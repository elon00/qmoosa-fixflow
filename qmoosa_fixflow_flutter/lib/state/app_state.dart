import 'dart:async';
import 'package:flutter/material.dart';
import 'package:qmoosa_fixflow_client/qmoosa_fixflow_client.dart';
import '../client.dart';

class UserPersona {
  final int id;
  final String name;
  final String role; // 'reporter', 'technician', 'manager'
  final String title;
  final IconData icon;

  const UserPersona({
    required this.id,
    required this.name,
    required this.role,
    required this.title,
    required this.icon,
  });
}

const defaultPersonas = [
  UserPersona(
    id: 101,
    name: 'Sarah Jenkins',
    role: 'reporter',
    title: 'Tenant / Reporter (Apt 304)',
    icon: Icons.person_outline,
  ),
  UserPersona(
    id: 202,
    name: 'Alex Vance',
    role: 'technician',
    title: 'Facility Lead Technician',
    icon: Icons.build_circle_outlined,
  ),
  UserPersona(
    id: 303,
    name: 'Elena Rostova',
    role: 'manager',
    title: 'Operations Director',
    icon: Icons.admin_panel_settings_outlined,
  ),
];

class AppState extends ChangeNotifier {
  static final AppState _instance = AppState._internal();
  factory AppState() => _instance;
  AppState._internal();

  UserPersona currentPersona = defaultPersonas[0];
  int workspaceId = 1;
  List<Issue> issues = [];
  DashboardMetrics? metrics;
  bool isLoading = false;
  String? errorMessage;

  StreamSubscription<Issue>? _streamSubscription;

  void switchPersona(UserPersona persona) {
    currentPersona = persona;
    notifyListeners();
  }

  Future<void> init() async {
    await fetchIssues();
    await fetchMetrics();
    _startStreaming();
  }

  void _startStreaming() {
    _streamSubscription?.cancel();
    try {
      _streamSubscription = client.activityStream
          .watchWorkspace(workspaceId)
          .listen(
            (updatedIssue) {
              final index = issues.indexWhere((i) => i.id == updatedIssue.id);
              if (index >= 0) {
                issues[index] = updatedIssue;
              } else {
                issues.insert(0, updatedIssue);
              }
              notifyListeners();
              fetchMetrics();
            },
            onError: (err) {
              // Fallback gracefully if stream disconnects
              debugPrint('Streaming error: $err');
            },
          );
    } catch (e) {
      debugPrint('Streaming initialization exception: $e');
    }
  }

  Future<void> fetchIssues() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      issues = await client.issue.listIssues(workspaceId: workspaceId);
      // Auto-seed if empty for zero-setup demo
      if (issues.isEmpty) {
        await client.sandbox.seedDemoData();
        issues = await client.issue.listIssues(workspaceId: workspaceId);
      }
    } catch (e) {
      errorMessage = 'Could not connect to Serverpod at $serverUrl: $e';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchMetrics() async {
    try {
      metrics = await client.dashboard.getMetrics(workspaceId);
      notifyListeners();
    } catch (e) {
      debugPrint('Metrics fetch error: $e');
    }
  }

  Future<Issue> reportIssue({
    required String title,
    required String description,
    required String category,
    required int locationId,
    required String locationName,
    required String priority,
    String? beforePhotoUrl,
  }) async {
    final newIssue = Issue(
      workspaceId: workspaceId,
      reporterId: currentPersona.id,
      reporterName: currentPersona.name,
      title: title,
      description: description,
      category: category,
      locationId: locationId,
      locationName: locationName,
      priority: priority,
      status: 'OPEN',
      beforePhotoUrl: beforePhotoUrl,
      createdAt: DateTime.now(),
      updatedAt: DateTime.now(),
    );

    final saved = await client.issue.createIssue(newIssue);
    await fetchIssues();
    await fetchMetrics();
    return saved;
  }

  Future<void> claimJob(int issueId) async {
    await client.issue.claimIssue(
      issueId,
      currentPersona.id,
      currentPersona.name,
    );
    await fetchIssues();
    await fetchMetrics();
  }

  Future<void> startWork(int issueId) async {
    await client.issue.startWork(issueId, currentPersona.id);
    await fetchIssues();
    await fetchMetrics();
  }

  Future<void> completeWork({
    required int issueId,
    required String resolutionNote,
    String? afterPhotoUrl,
  }) async {
    await client.issue.completeWork(
      issueId,
      currentPersona.id,
      resolutionNote,
      afterPhotoUrl,
    );
    await fetchIssues();
    await fetchMetrics();
  }

  Future<void> verifyResolution(int issueId) async {
    await client.issue.verifyResolution(issueId, currentPersona.id);
    await fetchIssues();
    await fetchMetrics();
  }

  Future<void> reopenIssue(int issueId, String reason) async {
    await client.issue.reopenIssue(issueId, currentPersona.id, reason);
    await fetchIssues();
    await fetchMetrics();
  }

  @override
  void dispose() {
    _streamSubscription?.cancel();
    super.dispose();
  }
}
