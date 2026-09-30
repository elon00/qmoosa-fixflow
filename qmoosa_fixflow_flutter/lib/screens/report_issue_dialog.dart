import 'package:flutter/material.dart';
import 'package:qmoosa_fixflow_client/qmoosa_fixflow_client.dart';
import '../client.dart';
import '../state/app_state.dart';

class ReportIssueDialog extends StatefulWidget {
  const ReportIssueDialog({super.key});

  @override
  State<ReportIssueDialog> createState() => _ReportIssueDialogState();
}

class _ReportIssueDialogState extends State<ReportIssueDialog> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descController = TextEditingController();
  final _photoController = TextEditingController(
    text: 'https://images.unsplash.com/photo-1584622650111-993a426fbf0a?w=600',
  );

  String _selectedCategory = 'Plumbing';
  String _selectedPriority = 'High';
  int _selectedLocationId = 1;
  String _selectedLocationName = 'Main Server Vault (Building A, B2)';
  bool _isSubmitting = false;
  bool _isTriaging = false;
  TriageResult? _triageResult;

  final _categories = [
    'Plumbing',
    'Electrical',
    'HVAC',
    'Structural',
    'Cleaning',
    'Safety',
    'IT & Access Control',
    'General Facility',
  ];

  final _priorities = ['Low', 'Medium', 'High', 'Critical'];

  final _locations = [
    {'id': 1, 'name': 'Main Server Vault (Building A, B2)'},
    {'id': 2, 'name': 'Executive Boardroom (Building A, Floor 4)'},
    {'id': 3, 'name': 'Cafeteria & Kitchen (Building B, Ground)'},
    {'id': 4, 'name': 'Residential Unit 304 (Sunset Wing)'},
  ];

  Future<void> _runAiTriage() async {
    final text = _descController.text.trim();
    if (text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'Please enter a description first to run AI Smart Triage.',
          ),
        ),
      );
      return;
    }

    setState(() => _isTriaging = true);
    try {
      final res = await client.aiTriage.analyzeReport(
        description: text,
        photoUrl: _photoController.text.trim(),
      );
      setState(() {
        _triageResult = res;
        if (_categories.contains(res.suggestedCategory)) {
          _selectedCategory = res.suggestedCategory;
        }
        if (_priorities.contains(res.suggestedPriority)) {
          _selectedPriority = res.suggestedPriority;
        }
      });
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'AI Triage completed: Suggested ${res.suggestedCategory} (${res.suggestedPriority}) with ${(res.confidence * 100).toInt()}% confidence.',
            ),
            backgroundColor: Colors.indigo,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('AI Triage error: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _isTriaging = false);
    }
  }

  void _simulateQrScan() {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Row(
          children: [
            Icon(Icons.qr_code_scanner, color: Colors.indigo),
            SizedBox(width: 8),
            Text('Scan Physical Facility Tag'),
          ],
        ),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Simulating QR optical scan on fixture tag:'),
            SizedBox(height: 8),
            SelectableText(
              'FIXFLOW://location/1?asset=PUMP-04',
              style: TextStyle(
                fontFamily: 'monospace',
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
            SizedBox(height: 12),
            Text(
              'Recognized Asset: High-Pressure Chilled Water Pump\nLocation: Main Server Vault (Building A, Basement 2)',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              Navigator.pop(ctx);
              setState(() {
                _selectedLocationId = 1;
                _selectedLocationName = 'Main Server Vault (Building A, B2)';
                _titleController.text =
                    'Asset PUMP-04 Fault - Main Server Vault';
              });
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Location auto-populated from QR tag!'),
                  backgroundColor: Color(0xFF0D9488),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF0D9488),
            ),
            child: const Text('Apply Location Tag'),
          ),
        ],
      ),
    );
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isSubmitting = true);
    try {
      await AppState().reportIssue(
        title: _titleController.text.trim(),
        description: _descController.text.trim(),
        category: _selectedCategory,
        locationId: _selectedLocationId,
        locationName: _selectedLocationName,
        priority: _selectedPriority,
        beforePhotoUrl: _photoController.text.trim().isNotEmpty
            ? _photoController.text.trim()
            : null,
      );

      if (mounted) {
        Navigator.of(context).pop(true);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Issue reported successfully to Serverpod!'),
            backgroundColor: Colors.green,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to report issue: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _isSubmitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 620, maxHeight: 760),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Form(
            key: _formKey,
            child: ListView(
              shrinkWrap: true,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Row(
                      children: [
                        Icon(
                          Icons.report_problem_outlined,
                          color: Colors.indigo,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Report Maintenance Issue',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      icon: const Icon(Icons.close),
                      onPressed: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _titleController,
                        decoration: const InputDecoration(
                          labelText: 'Issue Title *',
                          hintText: 'e.g., Water pipe burst under kitchen sink',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.title),
                        ),
                        validator: (v) => v == null || v.trim().isEmpty
                            ? 'Title is required'
                            : null,
                      ),
                    ),
                    const SizedBox(width: 10),
                    OutlinedButton.icon(
                      onPressed: _simulateQrScan,
                      icon: const Icon(Icons.qr_code_scanner, size: 18),
                      label: const Text('Scan QR Tag'),
                      style: OutlinedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          vertical: 18,
                          horizontal: 14,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _descController,
                  maxLines: 3,
                  decoration: const InputDecoration(
                    labelText: 'Description *',
                    hintText:
                        'Describe what happened, exact symptoms, and hazards...',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.description_outlined),
                  ),
                  validator: (v) => v == null || v.trim().isEmpty
                      ? 'Description is required'
                      : null,
                ),
                const SizedBox(height: 8),
                // AI Agentic Smart Triage trigger button
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton.icon(
                    onPressed: _isTriaging ? null : _runAiTriage,
                    icon: _isTriaging
                        ? const SizedBox(
                            width: 14,
                            height: 14,
                            child: CircularProgressIndicator(strokeWidth: 2),
                          )
                        : const Icon(
                            Icons.auto_awesome,
                            size: 16,
                            color: Colors.indigo,
                          ),
                    label: const Text(
                      '✨ Run AI Smart Triage (Auto-detect Category & Urgency)',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo,
                      ),
                    ),
                  ),
                ),
                if (_triageResult != null) ...[
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.indigo.withOpacity(0.06),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.indigo.withOpacity(0.2)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.psychology,
                              size: 18,
                              color: Colors.indigo,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              'AI Analysis: ${_triageResult!.reasoning}',
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        if (_triageResult!.immediateActions.isNotEmpty) ...[
                          const SizedBox(height: 6),
                          const Text(
                            'Immediate Containment Advice:',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          ..._triageResult!.immediateActions.map(
                            (a) => Padding(
                              padding: const EdgeInsets.only(top: 2),
                              child: Text(
                                '• $a',
                                style: const TextStyle(fontSize: 11),
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                ],
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        value: _selectedCategory,
                        decoration: const InputDecoration(
                          labelText: 'Category',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.category_outlined),
                        ),
                        items: _categories.map((c) {
                          return DropdownMenuItem(value: c, child: Text(c));
                        }).toList(),
                        onChanged: (v) => setState(
                          () => _selectedCategory = v ?? _selectedCategory,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: DropdownButtonFormField<String>(
                        value: _selectedPriority,
                        decoration: const InputDecoration(
                          labelText: 'Priority',
                          border: OutlineInputBorder(),
                          prefixIcon: Icon(Icons.flag_outlined),
                        ),
                        items: _priorities.map((p) {
                          return DropdownMenuItem(value: p, child: Text(p));
                        }).toList(),
                        onChanged: (v) => setState(
                          () => _selectedPriority = v ?? _selectedPriority,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                DropdownButtonFormField<int>(
                  value: _selectedLocationId,
                  decoration: const InputDecoration(
                    labelText: 'Facility Location',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.location_on_outlined),
                  ),
                  items: _locations.map((loc) {
                    return DropdownMenuItem<int>(
                      value: loc['id'] as int,
                      child: Text(loc['name'] as String),
                    );
                  }).toList(),
                  onChanged: (v) {
                    if (v != null) {
                      setState(() {
                        _selectedLocationId = v;
                        _selectedLocationName =
                            _locations.firstWhere((l) => l['id'] == v)['name']
                                as String;
                      });
                    }
                  },
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: _photoController,
                  decoration: const InputDecoration(
                    labelText: 'Photo URL (Evidence)',
                    hintText: 'https://...',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.photo_camera_outlined),
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton.icon(
                  onPressed: _isSubmitting ? null : _submit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  icon: _isSubmitting
                      ? const SizedBox(
                          width: 18,
                          height: 18,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        )
                      : const Icon(Icons.send_rounded),
                  label: Text(
                    _isSubmitting
                        ? 'Submitting to Serverpod...'
                        : 'Submit Issue',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
