import 'package:flutter/material.dart';
import '../state/app_state.dart';

class DashboardTab extends StatelessWidget {
  const DashboardTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: AppState(),
      builder: (context, _) {
        final state = AppState();
        final metrics = state.metrics;

        return ListView(
          padding: const EdgeInsets.all(24),
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Facility Operations KPIs',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Real-time calculations computed by Serverpod backend',
                      style: TextStyle(fontSize: 13, color: Colors.grey),
                    ),
                  ],
                ),
                ElevatedButton.icon(
                  onPressed: () => state.fetchMetrics(),
                  icon: const Icon(Icons.refresh, size: 18),
                  label: const Text('Recalculate'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            // Metric Cards Grid
            Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                _buildKpiCard(
                  title: 'Open Issues',
                  value: '${metrics?.openIssues ?? 0}',
                  subtitle: 'Unassigned tickets',
                  color: Colors.amber.shade700,
                  icon: Icons.radio_button_checked,
                ),
                _buildKpiCard(
                  title: 'In Progress',
                  value: '${metrics?.inProgressIssues ?? 0}',
                  subtitle: 'Active repairs',
                  color: Colors.blue.shade700,
                  icon: Icons.sync,
                ),
                _buildKpiCard(
                  title: 'Awaiting Verify',
                  value: '${metrics?.awaitingVerificationIssues ?? 0}',
                  subtitle: 'Pending proof inspection',
                  color: Colors.purple.shade700,
                  icon: Icons.fact_check_outlined,
                ),
                _buildKpiCard(
                  title: 'Resolved Today',
                  value: '${metrics?.resolvedIssues ?? 0}',
                  subtitle: 'Verified & closed',
                  color: const Color(0xFF0D9488),
                  icon: Icons.check_circle_outline,
                ),
                _buildKpiCard(
                  title: 'Avg Resolution MTTR',
                  value:
                      '${(metrics?.averageResolutionMinutes ?? 0).toStringAsFixed(1)} m',
                  subtitle: 'Mean turnaround time',
                  color: Colors.indigo,
                  icon: Icons.timer_outlined,
                ),
                _buildKpiCard(
                  title: 'Critical Urgency',
                  value: '${metrics?.criticalPriorityCount ?? 0}',
                  subtitle: 'Emergency hazards',
                  color: Colors.red.shade700,
                  icon: Icons.warning_amber_rounded,
                ),
              ],
            ),
            const SizedBox(height: 32),
            // Operational Lifecycle Breakdown Card
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: BorderSide(color: Colors.grey.withOpacity(0.2)),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Operational Lifecycle Flow',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _buildFlowStep(
                          '1. Report',
                          'Tenant / Resident',
                          Icons.campaign_outlined,
                          Colors.amber.shade800,
                        ),
                        const Icon(
                          Icons.arrow_forward_rounded,
                          color: Colors.grey,
                        ),
                        _buildFlowStep(
                          '2. Claim',
                          'Technician Lock',
                          Icons.assignment_ind_outlined,
                          Colors.indigo,
                        ),
                        const Icon(
                          Icons.arrow_forward_rounded,
                          color: Colors.grey,
                        ),
                        _buildFlowStep(
                          '3. Repair',
                          'Work in Progress',
                          Icons.handyman_outlined,
                          Colors.blue,
                        ),
                        const Icon(
                          Icons.arrow_forward_rounded,
                          color: Colors.grey,
                        ),
                        _buildFlowStep(
                          '4. Verify',
                          'Evidence Review',
                          Icons.verified_outlined,
                          const Color(0xFF0D9488),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Widget _buildKpiCard({
    required String title,
    required String value,
    required String subtitle,
    required Color color,
    required IconData icon,
  }) {
    return Container(
      width: 220,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: color.withOpacity(0.06),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color.withOpacity(0.25)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey.shade700,
                ),
              ),
              Icon(icon, size: 20, color: color),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
          ),
        ],
      ),
    );
  }

  Widget _buildFlowStep(
    String title,
    String subtitle,
    IconData icon,
    Color color,
  ) {
    return Column(
      children: [
        CircleAvatar(
          radius: 24,
          backgroundColor: color.withOpacity(0.12),
          child: Icon(icon, color: color, size: 24),
        ),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
        ),
        Text(
          subtitle,
          style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
        ),
      ],
    );
  }
}
