import 'package:flutter/material.dart';
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

  final _categories = [
    'Plumbing',
    'Electrical',
    'HVAC',
    'Structural',
    'Cleaning',
    'Safety',
    'IT & Access Control',
  ];

  final _priorities = ['Low', 'Medium', 'High', 'Critical'];

  final _locations = [
    {'id': 1, 'name': 'Main Server Vault (Building A, B2)'},
    {'id': 2, 'name': 'Executive Boardroom (Building A, Floor 4)'},
    {'id': 3, 'name': 'Cafeteria & Kitchen (Building B, Ground)'},
    {'id': 4, 'name': 'Residential Unit 304 (Sunset Wing)'},
  ];

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
        constraints: const BoxConstraints(maxWidth: 580, maxHeight: 720),
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
                TextFormField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                    labelText: 'Issue Title *',
                    hintText:
                        'e.g., Burst pipe spraying water under kitchen sink',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.title),
                  ),
                  validator: (v) => v == null || v.trim().isEmpty
                      ? 'Title is required'
                      : null,
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
                const SizedBox(height: 16),
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
