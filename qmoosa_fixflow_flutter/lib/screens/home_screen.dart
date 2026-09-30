import 'package:flutter/material.dart';
import '../state/app_state.dart';
import 'about_tab.dart';
import 'dashboard_tab.dart';
import 'issue_feed_tab.dart';
import 'report_issue_dialog.dart';
import 'sandbox_tab.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    AppState().init();
  }

  final _tabs = const [
    IssueFeedTab(),
    DashboardTab(),
    SandboxTab(),
    AboutTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: AppState(),
      builder: (context, _) {
        final state = AppState();

        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            title: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.handyman_rounded,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
                const SizedBox(width: 10),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Qmoosa FixFlow',
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.2,
                      ),
                    ),
                    Text(
                      'Serverpod 4 • Real-time Operations',
                      style: TextStyle(fontSize: 10, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            actions: [
              // Persona Switcher dropdown
              Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.indigo.withOpacity(0.08),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.indigo.withOpacity(0.2)),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<UserPersona>(
                    value: state.currentPersona,
                    icon: const Icon(
                      Icons.arrow_drop_down,
                      color: Colors.indigo,
                    ),
                    items: defaultPersonas.map((p) {
                      return DropdownMenuItem<UserPersona>(
                        value: p,
                        child: Row(
                          children: [
                            Icon(p.icon, size: 16, color: Colors.indigo),
                            const SizedBox(width: 8),
                            Text(
                              p.title,
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                    onChanged: (p) {
                      if (p != null) state.switchPersona(p);
                    },
                  ),
                ),
              ),
              const SizedBox(width: 12),
              // Report Issue CTA
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: ElevatedButton.icon(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (_) => const ReportIssueDialog(),
                    );
                  },
                  icon: const Icon(Icons.add, size: 18),
                  label: const Text('Report Problem'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
            ],
          ),
          body: Row(
            children: [
              NavigationRail(
                selectedIndex: _currentIndex,
                onDestinationSelected: (i) => setState(() => _currentIndex = i),
                labelType: NavigationRailLabelType.all,
                leading: const SizedBox(height: 8),
                destinations: const [
                  NavigationRailDestination(
                    icon: Icon(Icons.view_agenda_outlined),
                    selectedIcon: Icon(Icons.view_agenda),
                    label: Text('Issues Feed'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.insights_outlined),
                    selectedIcon: Icon(Icons.insights),
                    label: Text('Analytics'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.smart_toy_outlined),
                    selectedIcon: Icon(Icons.smart_toy),
                    label: Text('Sandbox'),
                  ),
                  NavigationRailDestination(
                    icon: Icon(Icons.info_outline),
                    selectedIcon: Icon(Icons.info),
                    label: Text('About & Specs'),
                  ),
                ],
              ),
              const VerticalDivider(width: 1),
              Expanded(child: _tabs[_currentIndex]),
            ],
          ),
        );
      },
    );
  }
}
