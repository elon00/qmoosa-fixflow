import 'package:flutter/material.dart';

class PriorityBadge extends StatelessWidget {
  final String priority;

  const PriorityBadge({super.key, required this.priority});

  @override
  Widget build(BuildContext context) {
    Color color;
    IconData icon;

    switch (priority.toLowerCase()) {
      case 'critical':
        color = Colors.red.shade700;
        icon = Icons.warning_amber_rounded;
        break;
      case 'high':
        color = Colors.orange.shade800;
        icon = Icons.arrow_upward_rounded;
        break;
      case 'medium':
        color = Colors.blue.shade700;
        icon = Icons.remove_rounded;
        break;
      case 'low':
      default:
        color = Colors.grey.shade600;
        icon = Icons.arrow_downward_rounded;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: color),
          const SizedBox(width: 4),
          Text(
            priority,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
