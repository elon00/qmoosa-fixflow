import 'package:flutter/material.dart';
import 'package:qmoosa_fixflow_client/qmoosa_fixflow_client.dart';
import '../client.dart';
import '../state/app_state.dart';
import '../widgets/priority_badge.dart';
import '../widgets/status_badge.dart';

class IssueDetailScreen extends StatefulWidget {
  final Issue issue;

  const IssueDetailScreen({super.key, required this.issue});

  @override
  State<IssueDetailScreen> createState() => _IssueDetailScreenState();
}

class _IssueDetailScreenState extends State<IssueDetailScreen> {
  late Issue _issue;
  List<IssueEvent> _events = [];
  bool _isLoadingEvents = false;
  bool _isActionLoading = false;

  @override
  void initState() {
    super.initState();
    _issue = widget.issue;
    _loadEvents();
  }

  Future<void> _loadEvents() async {
    setState(() => _isLoadingEvents = true);
    try {
      final evts = await client.issue.getIssueEvents(_issue.id!);
      if (mounted) setState(() => _events = evts);
    } catch (e) {
      debugPrint('Error loading events: $e');
    } finally {
      if (mounted) setState(() => _isLoadingEvents = false);
    }
  }

  Future<void> _claimJob() async {
    setState(() => _isActionLoading = true);
    try {
      await AppState().claimJob(_issue.id!);
      final updated = await client.issue.getIssue(_issue.id!);
      if (updated != null && mounted) {
        setState(() => _issue = updated);
        await _loadEvents();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Job claimed successfully! Concurrency lock held.'),
            backgroundColor: Colors.indigo,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red),
        );
      }
    } finally {
      if (mounted) setState(() => _isActionLoading = false);
    }
  }

  Future<void> _startWork() async {
    setState(() => _isActionLoading = true);
    try {
      await AppState().startWork(_issue.id!);
      final updated = await client.issue.getIssue(_issue.id!);
      if (updated != null && mounted) {
        setState(() => _issue = updated);
        await _loadEvents();
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red),
        );
      }
    } finally {
      if (mounted) setState(() => _isActionLoading = false);
    }
  }

  Future<void> _completeWorkDialog() async {
    final noteController = TextEditingController(
      text:
          'Replaced damaged fitting, tested line under pressure. Normal flow restored.',
    );
    final photoController = TextEditingController(
      text:
          'https://images.unsplash.com/photo-1621905251189-08b45d6a269e?w=600',
    );

    final result = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Complete Job & Upload Proof'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: noteController,
              maxLines: 2,
              decoration: const InputDecoration(
                labelText: 'Resolution Note *',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            TextField(
              controller: photoController,
              decoration: const InputDecoration(
                labelText: 'After-Repair Photo URL',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.purple),
            child: const Text('Submit Completion'),
          ),
        ],
      ),
    );

    if (result == true) {
      setState(() => _isActionLoading = true);
      try {
        await AppState().completeWork(
          issueId: _issue.id!,
          resolutionNote: noteController.text.trim(),
          afterPhotoUrl: photoController.text.trim().isNotEmpty
              ? photoController.text.trim()
              : null,
        );
        final updated = await client.issue.getIssue(_issue.id!);
        if (updated != null && mounted) {
          setState(() => _issue = updated);
          await _loadEvents();
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                'Work completed! Sent to reporter for verification.',
              ),
              backgroundColor: Colors.purple,
            ),
          );
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red),
          );
        }
      } finally {
        if (mounted) setState(() => _isActionLoading = false);
      }
    }
  }

  Future<void> _verifyResolution() async {
    setState(() => _isActionLoading = true);
    try {
      await AppState().verifyResolution(_issue.id!);
      final updated = await client.issue.getIssue(_issue.id!);
      if (updated != null && mounted) {
        setState(() => _issue = updated);
        await _loadEvents();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Resolution confirmed! Ticket officially RESOLVED ✓'),
            backgroundColor: Color(0xFF0D9488),
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red),
        );
      }
    } finally {
      if (mounted) setState(() => _isActionLoading = false);
    }
  }

  Future<void> _reopenDialog() async {
    final reasonController = TextEditingController();
    final result = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Reopen Issue'),
        content: TextField(
          controller: reasonController,
          decoration: const InputDecoration(
            labelText: 'Reason for reopening',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrange),
            child: const Text('Reopen Issue'),
          ),
        ],
      ),
    );

    if (result == true && reasonController.text.trim().isNotEmpty) {
      setState(() => _isActionLoading = true);
      try {
        await AppState().reopenIssue(_issue.id!, reasonController.text.trim());
        final updated = await client.issue.getIssue(_issue.id!);
        if (updated != null && mounted) {
          setState(() => _issue = updated);
          await _loadEvents();
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red),
          );
        }
      } finally {
        if (mounted) setState(() => _isActionLoading = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final persona = AppState().currentPersona;

    return Scaffold(
      appBar: AppBar(
        title: Text('Issue #${_issue.id}'),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: StatusBadge(status: _issue.status, isLarge: true),
            ),
          ),
        ],
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Left: Main details and photos
          Expanded(
            flex: 3,
            child: ListView(
              padding: const EdgeInsets.all(24),
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        _issue.title,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    PriorityBadge(priority: _issue.priority),
                  ],
                ),
                const SizedBox(height: 12),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    Chip(
                      avatar: const Icon(Icons.category, size: 14),
                      label: Text(_issue.category),
                      backgroundColor: Colors.blue.withOpacity(0.08),
                    ),
                    Chip(
                      avatar: const Icon(Icons.location_on, size: 14),
                      label: Text(_issue.locationName),
                      backgroundColor: Colors.grey.withOpacity(0.08),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  'Description',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 6),
                Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey.withOpacity(0.2)),
                  ),
                  child: Text(
                    _issue.description,
                    style: const TextStyle(fontSize: 14, height: 1.5),
                  ),
                ),
                const SizedBox(height: 24),
                // Photographic evidence section
                const Text(
                  'Photographic Evidence',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: _buildPhotoCard(
                        title: 'Before (Reported Fault)',
                        url: _issue.beforePhotoUrl,
                        icon: Icons.broken_image_outlined,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: _buildPhotoCard(
                        title: 'After (Completion Proof)',
                        url: _issue.afterPhotoUrl,
                        icon: Icons.check_circle_outline,
                      ),
                    ),
                  ],
                ),
                if (_issue.resolutionNote != null) ...[
                  const SizedBox(height: 24),
                  const Text(
                    'Technician Resolution Note',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  Container(
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: Colors.purple.withOpacity(0.06),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.purple.withOpacity(0.2)),
                    ),
                    child: Text(
                      _issue.resolutionNote!,
                      style: const TextStyle(fontSize: 14, height: 1.4),
                    ),
                  ),
                ],
                const SizedBox(height: 32),
                // Action Buttons based on Role & State
                _buildActionPanel(persona),
              ],
            ),
          ),
          const VerticalDivider(width: 1),
          // Right: Real-time Timeline Audit Trail
          Expanded(
            flex: 2,
            child: Container(
              color: Theme.of(context).cardColor.withOpacity(0.3),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.history_rounded, size: 20),
                      SizedBox(width: 8),
                      Text(
                        'Audit Trail & Timeline',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: _isLoadingEvents
                        ? const Center(child: CircularProgressIndicator())
                        : _events.isEmpty
                        ? const Center(
                            child: Text('No timeline events logged yet.'),
                          )
                        : ListView.separated(
                            itemCount: _events.length,
                            separatorBuilder: (_, __) =>
                                const SizedBox(height: 12),
                            itemBuilder: (ctx, i) {
                              final ev = _events[i];
                              return _buildTimelineItem(ev);
                            },
                          ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPhotoCard({
    required String title,
    required String? url,
    required IconData icon,
  }) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.08),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.withOpacity(0.2)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: url != null && url.isNotEmpty
            ? Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    url,
                    fit: BoxFit.cover,
                    errorBuilder: (_, __, ___) => Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(icon, size: 36, color: Colors.grey),
                          const SizedBox(height: 4),
                          const Text('Image unavailable'),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      color: Colors.black54,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      child: Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(icon, size: 36, color: Colors.grey.shade400),
                    const SizedBox(height: 6),
                    Text(
                      '$title\n(Pending)',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  Widget _buildTimelineItem(IssueEvent ev) {
    Color dotColor = Colors.indigo;
    IconData icon = Icons.info_outline;

    switch (ev.eventType) {
      case 'CREATED':
        dotColor = Colors.amber.shade700;
        icon = Icons.add_circle_outline;
        break;
      case 'CLAIMED':
        dotColor = Colors.indigo;
        icon = Icons.assignment_ind;
        break;
      case 'STARTED':
        dotColor = Colors.blue;
        icon = Icons.handyman;
        break;
      case 'COMPLETED':
        dotColor = Colors.purple;
        icon = Icons.fact_check;
        break;
      case 'VERIFIED':
        dotColor = const Color(0xFF0D9488);
        icon = Icons.check_circle;
        break;
      case 'REOPENED':
        dotColor = Colors.deepOrange;
        icon = Icons.replay;
        break;
    }

    final timeStr =
        '${ev.createdAt.hour.toString().padLeft(2, '0')}:${ev.createdAt.minute.toString().padLeft(2, '0')}';

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 14,
          backgroundColor: dotColor.withOpacity(0.15),
          child: Icon(icon, size: 14, color: dotColor),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    ev.eventType,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: dotColor,
                    ),
                  ),
                  Text(
                    timeStr,
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey.shade500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 2),
              Text(
                ev.message ?? '${ev.actorName} performed ${ev.eventType}',
                style: const TextStyle(fontSize: 13),
              ),
              const SizedBox(height: 2),
              Text(
                'By: ${ev.actorName}',
                style: TextStyle(fontSize: 11, color: Colors.grey.shade600),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActionPanel(UserPersona persona) {
    if (_isActionLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (_issue.status == 'OPEN') {
      return ElevatedButton.icon(
        onPressed: _claimJob,
        icon: const Icon(Icons.assignment_turned_in),
        label: const Text('Claim This Job (Technician Lock)'),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.indigo,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
    }

    if (_issue.status == 'ASSIGNED') {
      return ElevatedButton.icon(
        onPressed: _startWork,
        icon: const Icon(Icons.play_arrow_rounded),
        label: const Text('Start Work (Move to IN PROGRESS)'),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue.shade700,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
    }

    if (_issue.status == 'IN_PROGRESS') {
      return ElevatedButton.icon(
        onPressed: _completeWorkDialog,
        icon: const Icon(Icons.camera_alt_outlined),
        label: const Text('Upload Evidence & Complete Work'),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.purple.shade700,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      );
    }

    if (_issue.status == 'AWAITING_VERIFICATION') {
      return Row(
        children: [
          Expanded(
            child: ElevatedButton.icon(
              onPressed: _verifyResolution,
              icon: const Icon(Icons.check_circle_outline),
              label: const Text('Confirm Fixed ✓ (Verify)'),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF0D9488),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          OutlinedButton.icon(
            onPressed: _reopenDialog,
            icon: const Icon(Icons.replay),
            label: const Text('Reopen Issue'),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.deepOrange,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            ),
          ),
        ],
      );
    }

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF0D9488).withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: const Color(0xFF0D9488).withOpacity(0.3)),
      ),
      child: const Row(
        children: [
          Icon(Icons.verified, color: Color(0xFF0D9488)),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              'This maintenance ticket has been verified and permanently resolved.',
              style: TextStyle(
                color: Color(0xFF0D9488),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
