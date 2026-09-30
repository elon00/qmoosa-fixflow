import 'package:flutter/material.dart';

class AboutTab extends StatelessWidget {
  const AboutTab({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(28),
      children: [
        // Hero Header
        Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [Color(0xFF312E81), Color(0xFF1E1B4B)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.15),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.handyman_rounded,
                      color: Colors.white,
                      size: 28,
                    ),
                  ),
                  const SizedBox(width: 14),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Qmoosa FixFlow',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        'Real problems. Real assignments. Real-time resolution.',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 16),
              const Text(
                'Built for the "Build Something Real" Serverpod Hackathon. An enterprise-grade facility maintenance and issue-resolution platform engineered with Flutter + Serverpod 4 + PostgreSQL.',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 28),

        // Quick Links & Localhost Section
        const Text(
          'Quick Links & Test Environments',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Colors.grey.withOpacity(0.2)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              children: [
                _buildLinkRow(
                  'GitHub Source Repository',
                  'https://github.com/elon00/qmoosa-fixflow',
                  Icons.code,
                ),
                const Divider(),
                _buildLinkRow(
                  'Flutter Web Client (Localhost)',
                  'http://localhost:8081',
                  Icons.web,
                ),
                const Divider(),
                _buildLinkRow(
                  'Serverpod 4 Backend API',
                  'http://localhost:8080',
                  Icons.dns_outlined,
                ),
                const Divider(),
                _buildLinkRow(
                  'Serverpod Web & Insights',
                  'http://localhost:8082',
                  Icons.insights,
                ),
                const Divider(),
                _buildLinkRow(
                  'Interactive Sandbox Suite',
                  'Select the "Interactive Sandbox" Tab above',
                  Icons.smart_toy_outlined,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 28),

        // Problem & Solution
        const Text(
          'The Operational Problem & Our Solution',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: _buildInfoCard(
                title: 'The Challenge',
                content:
                    'Facilities and residential communities coordinate repairs through fragmented WhatsApp groups, paper logs, and messy spreadsheets. Requests vanish, technicians duplicate visits, and tenants never know if a hazard was addressed.',
                color: Colors.red.shade700,
                icon: Icons.cancel_outlined,
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _buildInfoCard(
                title: 'The FixFlow Solution',
                content:
                    'FixFlow establishes an immutable lifecycle: Report → Assign → Fix → Verify. The Serverpod 4 backend guarantees zero client trust, atomic claiming concurrency, and instant WebSocket notifications.',
                color: const Color(0xFF0D9488),
                icon: Icons.check_circle_outline,
              ),
            ),
          ],
        ),
        const SizedBox(height: 28),

        // Serverpod 4 Technology Breakdown
        const Text(
          'Serverpod 4 Architecture & Capabilities',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 12),
        Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: Colors.grey.withOpacity(0.2)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTechFeature(
                  'Type-Safe Endpoints & ORM',
                  'Models defined in YAML compile directly into relational PostgreSQL tables and typed client methods. No fragile manual JSON serialization contracts.',
                ),
                _buildTechFeature(
                  'Real-Time WebSocket Streaming',
                  'Streaming endpoints broadcast status changes instantaneously. When a technician claims a ticket, the tenant sees the assignee update without page refreshes.',
                ),
                _buildTechFeature(
                  'Serverpod Future Calls (Scheduling)',
                  'Background scheduled tasks trigger automated reminders for overdue tickets and prompt tenants for verification after technician completion.',
                ),
                _buildTechFeature(
                  'Atomic Concurrency Control',
                  'Prevents race conditions when multiple technicians attempt to claim the exact same ticket simultaneously.',
                ),
                _buildTechFeature(
                  'Client-Side SQLite & Offline Mode',
                  'Enables field technicians to view tickets and cache completion notes while operating in signal-dead basements, syncing on reconnection.',
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLinkRow(String title, String link, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.indigo),
          const SizedBox(width: 12),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
          ),
          const Spacer(),
          SelectableText(
            link,
            style: const TextStyle(
              fontSize: 13,
              color: Colors.indigo,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoCard({
    required String title,
    required String content,
    required Color color,
    required IconData icon,
  }) {
    return Container(
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
            children: [
              Icon(icon, color: color, size: 20),
              const SizedBox(width: 8),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: color,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Text(content, style: const TextStyle(fontSize: 13, height: 1.5)),
        ],
      ),
    );
  }

  Widget _buildTechFeature(String title, String desc) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.check, size: 16, color: Color(0xFF0D9488)),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
                Text(
                  desc,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey.shade600,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
