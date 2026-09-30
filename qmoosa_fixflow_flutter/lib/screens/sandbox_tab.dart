import 'package:flutter/material.dart';
import 'package:qmoosa_fixflow_client/qmoosa_fixflow_client.dart';
import '../client.dart';
import '../state/app_state.dart';

class SandboxTab extends StatefulWidget {
  const SandboxTab({super.key});

  @override
  State<SandboxTab> createState() => _SandboxTabState();
}

class _SandboxTabState extends State<SandboxTab> {
  bool _isRunning = false;
  SimulateResult? _lastResult;
  final List<String> _consoleLogs = [
    'Qmoosa FixFlow Interactive Sandbox Simulator Ready.',
    'Select a test scenario below to execute against the Serverpod 4 engine.',
  ];

  Future<void> _runScenario(String scenarioName, String title) async {
    setState(() {
      _isRunning = true;
      _consoleLogs.add('\n>>> Launching Scenario: $title [$scenarioName]');
    });

    try {
      final res = await client.sandbox.runScenario(scenarioName);
      setState(() {
        _lastResult = res;
        _consoleLogs.addAll(res.logs);
        _consoleLogs.add(
          '>>> Result: ${res.success ? "PASSED ✓" : "FAILED ✗"} in ${res.executionTimeMs}ms\n',
        );
      });
      await AppState().fetchIssues();
      await AppState().fetchMetrics();
    } catch (e) {
      setState(() {
        _consoleLogs.add('>>> ERROR executing scenario: $e\n');
      });
    } finally {
      if (mounted) setState(() => _isRunning = false);
    }
  }

  Future<void> _seedData() async {
    setState(() {
      _isRunning = true;
      _consoleLogs.add('\n>>> Seeding campus workspace & sample tickets...');
    });

    try {
      await client.sandbox.seedDemoData();
      setState(() {
        _consoleLogs.add(
          '✓ Campus workspace, locations, and sample tickets seeded successfully in PostgreSQL.\n',
        );
      });
      await AppState().fetchIssues();
      await AppState().fetchMetrics();
    } catch (e) {
      setState(() {
        _consoleLogs.add('>>> ERROR seeding data: $e\n');
      });
    } finally {
      if (mounted) setState(() => _isRunning = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        const Text(
          'Serverpod 4 Interactive Test Sandbox',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const Text(
          'Execute automated operational scenarios to verify atomic concurrency, state transitions, and background scheduling.',
          style: TextStyle(fontSize: 13, color: Colors.grey),
        ),
        const SizedBox(height: 20),
        if (_lastResult != null) ...[
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: _lastResult!.success
                  ? const Color(0xFF0D9488).withOpacity(0.1)
                  : Colors.red.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: _lastResult!.success
                    ? const Color(0xFF0D9488)
                    : Colors.red,
              ),
            ),
            child: Row(
              children: [
                Icon(
                  _lastResult!.success
                      ? Icons.check_circle
                      : Icons.error_outline,
                  color: _lastResult!.success
                      ? const Color(0xFF0D9488)
                      : Colors.red,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Text(
                    _lastResult!.summary,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: _lastResult!.success
                          ? const Color(0xFF0D9488)
                          : Colors.red,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],
        // Action Scenario Buttons
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            ElevatedButton.icon(
              onPressed: _isRunning
                  ? null
                  : () => _runScenario('golden_loop', 'The Golden Loop (E2E)'),
              icon: const Icon(Icons.play_circle_fill, color: Colors.white),
              label: const Text('Simulate Full Lifecycle (Report → Verify)'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
              ),
            ),
            ElevatedButton.icon(
              onPressed: _isRunning
                  ? null
                  : () => _runScenario(
                      'concurrency_clash',
                      'Atomic Claim Concurrency Stress Test',
                    ),
              icon: const Icon(Icons.bolt, color: Colors.white),
              label: const Text('Test Atomic Concurrency (Race Condition)'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
              ),
            ),
            ElevatedButton.icon(
              onPressed: _isRunning
                  ? null
                  : () => _runScenario(
                      'future_call',
                      'Serverpod Future Calls (Scheduling)',
                    ),
              icon: const Icon(Icons.schedule, color: Colors.white),
              label: const Text('Test Scheduled Reminder (Future Calls)'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal.shade700,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
              ),
            ),
            OutlinedButton.icon(
              onPressed: _isRunning ? null : _seedData,
              icon: const Icon(Icons.dataset_outlined),
              label: const Text('Seed Sample Campus Data'),
              style: OutlinedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        // Live Terminal Logs Console
        Container(
          height: 380,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF1E1E2E),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.black26),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.terminal, color: Colors.greenAccent, size: 18),
                      SizedBox(width: 8),
                      Text(
                        'Serverpod Execution Console',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'monospace',
                        ),
                      ),
                    ],
                  ),
                  if (_isRunning)
                    const SizedBox(
                      width: 14,
                      height: 14,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: Colors.greenAccent,
                      ),
                    ),
                ],
              ),
              const Divider(color: Colors.white24, height: 16),
              Expanded(
                child: ListView.builder(
                  itemCount: _consoleLogs.length,
                  itemBuilder: (ctx, i) {
                    final line = _consoleLogs[i];
                    Color color = Colors.white70;
                    if (line.startsWith('✓')) color = Colors.greenAccent;
                    if (line.startsWith('>>>')) color = Colors.cyanAccent;
                    if (line.contains('ERROR')) color = Colors.redAccent;
                    return Text(
                      line,
                      style: TextStyle(
                        fontFamily: 'monospace',
                        fontSize: 12,
                        color: color,
                        height: 1.4,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
