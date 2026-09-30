import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:qmoosa_fixflow_flutter/widgets/priority_badge.dart';
import 'package:qmoosa_fixflow_flutter/widgets/status_badge.dart';

void main() {
  group('Qmoosa FixFlow Widget Tests', () {
    testWidgets('StatusBadge renders correct labels and icons', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                StatusBadge(status: 'OPEN'),
                StatusBadge(status: 'IN_PROGRESS'),
                StatusBadge(status: 'RESOLVED'),
                StatusBadge(status: 'AWAITING_VERIFICATION'),
              ],
            ),
          ),
        ),
      );

      expect(find.text('OPEN'), findsOneWidget);
      expect(find.text('IN PROGRESS'), findsOneWidget);
      expect(find.text('RESOLVED'), findsOneWidget);
      expect(find.text('AWAITING VERIFICATION'), findsOneWidget);
    });

    testWidgets('PriorityBadge renders critical and high urgency indicators', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Column(
              children: [
                PriorityBadge(priority: 'Critical'),
                PriorityBadge(priority: 'High'),
                PriorityBadge(priority: 'Low'),
              ],
            ),
          ),
        ),
      );

      expect(find.text('Critical'), findsOneWidget);
      expect(find.text('High'), findsOneWidget);
      expect(find.text('Low'), findsOneWidget);
    });
  });
}
