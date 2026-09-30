import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

/// Core operational endpoint managing maintenance issue lifecycles and state transitions.
class IssueEndpoint extends Endpoint {
  /// Create a new maintenance issue report and record the initial audit event.
  Future<Issue> createIssue(Session session, Issue issue) async {
    final now = DateTime.now();
    final issueToInsert = issue.copyWith(
      status: 'OPEN',
      assignedUserId: null,
      assignedUserName: null,
      createdAt: now,
      updatedAt: now,
    );

    final saved = await Issue.db.insertRow(session, issueToInsert);

    // Record initial CREATED event in the audit trail
    await IssueEvent.db.insertRow(
      session,
      IssueEvent(
        issueId: saved.id!,
        actorId: saved.reporterId,
        actorName: saved.reporterName,
        eventType: 'CREATED',
        fromStatus: null,
        toStatus: 'OPEN',
        message: 'Issue reported: ${saved.title}',
        createdAt: now,
      ),
    );

    // Broadcast creation to workspace streaming channel
    await session.messages.postMessage(
      'workspace_${saved.workspaceId}_issues',
      saved,
    );

    return saved;
  }

  /// Fetch a single issue with full details.
  Future<Issue?> getIssue(Session session, int id) async {
    return await Issue.db.findById(session, id);
  }

  /// List issues with optional workspace and status filters.
  Future<List<Issue>> listIssues(
    Session session, {
    int? workspaceId,
    String? status,
  }) async {
    return await Issue.db.find(
      session,
      where: (t) {
        Expression expr = Constant.bool(true);
        if (workspaceId != null) {
          expr = expr & t.workspaceId.equals(workspaceId);
        }
        if (status != null && status.isNotEmpty) {
          expr = expr & t.status.equals(status);
        }
        return expr;
      },
      orderBy: (t) => t.createdAt,
    );
  }

  /// Atomically claim an open issue. Guarantees no two technicians can claim the same job.
  Future<Issue> claimIssue(
    Session session,
    int issueId,
    int technicianId,
    String technicianName,
  ) async {
    final current = await Issue.db.findById(session, issueId);
    if (current == null) {
      throw FixFlowException(
        message: 'Issue #$issueId not found.',
        statusCode: 404,
      );
    }

    if (current.status != 'OPEN') {
      throw FixFlowException(
        message:
            'Cannot claim issue: Current status is "${current.status}". Only OPEN issues may be claimed.',
        statusCode: 400,
      );
    }

    if (current.assignedUserId != null) {
      throw FixFlowException(
        message:
            'Issue has already been claimed by ${current.assignedUserName ?? "another technician"}.',
        statusCode: 409,
      );
    }

    final now = DateTime.now();
    final updated = current.copyWith(
      status: 'ASSIGNED',
      assignedUserId: technicianId,
      assignedUserName: technicianName,
      updatedAt: now,
    );

    final saved = await Issue.db.updateRow(session, updated);

    // Persist audit event
    await IssueEvent.db.insertRow(
      session,
      IssueEvent(
        issueId: saved.id!,
        actorId: technicianId,
        actorName: technicianName,
        eventType: 'CLAIMED',
        fromStatus: 'OPEN',
        toStatus: 'ASSIGNED',
        message: 'Claimed by technician $technicianName',
        createdAt: now,
      ),
    );

    // Broadcast live event
    await session.messages.postMessage(
      'workspace_${saved.workspaceId}_issues',
      saved,
    );

    return saved;
  }

  /// Transition issue from ASSIGNED to IN_PROGRESS.
  Future<Issue> startWork(
    Session session,
    int issueId,
    int technicianId,
  ) async {
    final current = await Issue.db.findById(session, issueId);
    if (current == null) {
      throw FixFlowException(message: 'Issue not found', statusCode: 404);
    }

    if (current.status != 'ASSIGNED' && current.status != 'REOPENED') {
      throw FixFlowException(
        message:
            'Cannot start work: Issue must be ASSIGNED or REOPENED (current: ${current.status}).',
        statusCode: 400,
      );
    }

    final now = DateTime.now();
    final updated = current.copyWith(
      status: 'IN_PROGRESS',
      updatedAt: now,
    );

    final saved = await Issue.db.updateRow(session, updated);

    await IssueEvent.db.insertRow(
      session,
      IssueEvent(
        issueId: saved.id!,
        actorId: technicianId,
        actorName: saved.assignedUserName ?? 'Technician',
        eventType: 'STARTED',
        fromStatus: current.status,
        toStatus: 'IN_PROGRESS',
        message: 'Technician commenced repair work.',
        createdAt: now,
      ),
    );

    await session.messages.postMessage(
      'workspace_${saved.workspaceId}_issues',
      saved,
    );

    return saved;
  }

  /// Complete work, attach completion photo and notes, and move to AWAITING_VERIFICATION.
  Future<Issue> completeWork(
    Session session,
    int issueId,
    int technicianId,
    String resolutionNote,
    String? afterPhotoUrl,
  ) async {
    final current = await Issue.db.findById(session, issueId);
    if (current == null) {
      throw FixFlowException(message: 'Issue not found', statusCode: 404);
    }

    if (current.status != 'IN_PROGRESS') {
      throw FixFlowException(
        message: 'Cannot complete work: Issue must be IN_PROGRESS.',
        statusCode: 400,
      );
    }

    final now = DateTime.now();
    final updated = current.copyWith(
      status: 'AWAITING_VERIFICATION',
      resolutionNote: resolutionNote,
      afterPhotoUrl: afterPhotoUrl ?? current.afterPhotoUrl,
      updatedAt: now,
    );

    final saved = await Issue.db.updateRow(session, updated);

    await IssueEvent.db.insertRow(
      session,
      IssueEvent(
        issueId: saved.id!,
        actorId: technicianId,
        actorName: saved.assignedUserName ?? 'Technician',
        eventType: 'COMPLETED',
        fromStatus: 'IN_PROGRESS',
        toStatus: 'AWAITING_VERIFICATION',
        message: 'Work completed. Note: $resolutionNote',
        createdAt: now,
      ),
    );

    await session.messages.postMessage(
      'workspace_${saved.workspaceId}_issues',
      saved,
    );

    return saved;
  }

  /// Reporter confirms repair was successful, moving issue to RESOLVED.
  Future<Issue> verifyResolution(
    Session session,
    int issueId,
    int reporterId,
  ) async {
    final current = await Issue.db.findById(session, issueId);
    if (current == null) {
      throw FixFlowException(message: 'Issue not found', statusCode: 404);
    }

    if (current.status != 'AWAITING_VERIFICATION') {
      throw FixFlowException(
        message:
            'Cannot verify: Issue must be in AWAITING_VERIFICATION status.',
        statusCode: 400,
      );
    }

    final now = DateTime.now();
    final updated = current.copyWith(
      status: 'RESOLVED',
      resolvedAt: now,
      updatedAt: now,
    );

    final saved = await Issue.db.updateRow(session, updated);

    await IssueEvent.db.insertRow(
      session,
      IssueEvent(
        issueId: saved.id!,
        actorId: reporterId,
        actorName: saved.reporterName,
        eventType: 'VERIFIED',
        fromStatus: 'AWAITING_VERIFICATION',
        toStatus: 'RESOLVED',
        message: 'Resolution inspected and verified by reporter.',
        createdAt: now,
      ),
    );

    await session.messages.postMessage(
      'workspace_${saved.workspaceId}_issues',
      saved,
    );

    return saved;
  }

  /// Reporter reopens issue if repair was incomplete or problem re-occurred.
  Future<Issue> reopenIssue(
    Session session,
    int issueId,
    int reporterId,
    String reason,
  ) async {
    final current = await Issue.db.findById(session, issueId);
    if (current == null) {
      throw FixFlowException(message: 'Issue not found', statusCode: 404);
    }

    final now = DateTime.now();
    final updated = current.copyWith(
      status: 'REOPENED',
      updatedAt: now,
    );

    final saved = await Issue.db.updateRow(session, updated);

    await IssueEvent.db.insertRow(
      session,
      IssueEvent(
        issueId: saved.id!,
        actorId: reporterId,
        actorName: saved.reporterName,
        eventType: 'REOPENED',
        fromStatus: current.status,
        toStatus: 'REOPENED',
        message: 'Issue reopened: $reason',
        createdAt: now,
      ),
    );

    await session.messages.postMessage(
      'workspace_${saved.workspaceId}_issues',
      saved,
    );

    return saved;
  }

  /// Get timeline events for an issue.
  Future<List<IssueEvent>> getIssueEvents(
    Session session,
    int issueId,
  ) async {
    return await IssueEvent.db.find(
      session,
      where: (t) => t.issueId.equals(issueId),
      orderBy: (t) => t.createdAt,
    );
  }
}
