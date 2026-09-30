import 'package:serverpod/serverpod.dart';
import '../generated/protocol.dart';

/// Endpoint providing real-time facility metrics and operational KPI calculations.
class DashboardEndpoint extends Endpoint {
  /// Compute operational metrics for the specified workspace.
  Future<DashboardMetrics> getMetrics(Session session, int workspaceId) async {
    final issues = await Issue.db.find(
      session,
      where: (t) => t.workspaceId.equals(workspaceId),
    );

    int total = issues.length;
    int open = 0;
    int assigned = 0;
    int inProgress = 0;
    int awaitingVerification = 0;
    int resolved = 0;
    int highPriority = 0;
    int criticalPriority = 0;

    double totalResolutionMinutes = 0;
    int resolvedCount = 0;

    for (final issue in issues) {
      switch (issue.status) {
        case 'OPEN':
          open++;
          break;
        case 'ASSIGNED':
          assigned++;
          break;
        case 'IN_PROGRESS':
          inProgress++;
          break;
        case 'AWAITING_VERIFICATION':
          awaitingVerification++;
          break;
        case 'RESOLVED':
          resolved++;
          if (issue.resolvedAt != null) {
            final diff = issue.resolvedAt!.difference(issue.createdAt);
            totalResolutionMinutes += diff.inMinutes;
            resolvedCount++;
          }
          break;
      }

      if (issue.priority == 'High') highPriority++;
      if (issue.priority == 'Critical') criticalPriority++;
    }

    final avgMinutes = resolvedCount > 0
        ? (totalResolutionMinutes / resolvedCount)
        : 0.0;

    return DashboardMetrics(
      totalIssues: total,
      openIssues: open,
      assignedIssues: assigned,
      inProgressIssues: inProgress,
      awaitingVerificationIssues: awaitingVerification,
      resolvedIssues: resolved,
      averageResolutionMinutes: avgMinutes,
      highPriorityCount: highPriority,
      criticalPriorityCount: criticalPriority,
    );
  }
}
