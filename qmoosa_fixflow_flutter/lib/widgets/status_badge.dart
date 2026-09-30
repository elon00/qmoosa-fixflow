import 'package:flutter/material.dart';

class StatusBadge extends StatelessWidget {
  final String status;
  final bool isLarge;

  const StatusBadge({
    super.key,
    required this.status,
    this.isLarge = false,
  });

  @override
  Widget build(BuildContext context) {
    Color bg;
    Color fg;
    IconData icon;
    String label = status.replaceAll('_', ' ');

    switch (status.toUpperCase()) {
      case 'OPEN':
        bg = Colors.amber.withOpacity(0.15);
        fg = Colors.amber.shade800;
        icon = Icons.radio_button_checked;
        break;
      case 'ASSIGNED':
        bg = Colors.indigo.withOpacity(0.15);
        fg = Colors.indigo.shade700;
        icon = Icons.assignment_ind_outlined;
        break;
      case 'IN_PROGRESS':
        bg = Colors.blue.withOpacity(0.15);
        fg = Colors.blue.shade700;
        icon = Icons.sync;
        break;
      case 'AWAITING_VERIFICATION':
        bg = Colors.purple.withOpacity(0.15);
        fg = Colors.purple.shade700;
        icon = Icons.fact_check_outlined;
        label = 'AWAITING VERIFICATION';
        break;
      case 'RESOLVED':
        bg = const Color(0xFF0D9488).withOpacity(0.15);
        fg = const Color(0xFF0D9488);
        icon = Icons.check_circle_outline;
        break;
      case 'REOPENED':
        bg = Colors.deepOrange.withOpacity(0.15);
        fg = Colors.deepOrange.shade800;
        icon = Icons.replay;
        break;
      default:
        bg = Colors.grey.withOpacity(0.15);
        fg = Colors.grey.shade700;
        icon = Icons.help_outline;
    }

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isLarge ? 14 : 8,
        vertical: isLarge ? 6 : 4,
      ),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(isLarge ? 12 : 8),
        border: Border.all(color: fg.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: isLarge ? 18 : 13, color: fg),
          const SizedBox(width: 5),
          Text(
            label,
            style: TextStyle(
              fontSize: isLarge ? 13 : 11,
              fontWeight: FontWeight.w700,
              letterSpacing: 0.4,
              color: fg,
            ),
          ),
        ],
      ),
    );
  }
}
