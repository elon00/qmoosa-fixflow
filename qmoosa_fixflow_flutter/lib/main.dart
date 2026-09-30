import 'package:flutter/material.dart';
import 'client.dart';
import 'screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeClient();
  runApp(const QmoosaFixFlowApp());
}

ThemeData _buildTheme(Brightness brightness) {
  final isDark = brightness == Brightness.dark;
  return ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: const Color(0xFF4F46E5),
      brightness: brightness,
      surface: isDark ? const Color(0xFF0F172A) : const Color(0xFFF8FAFC),
    ),
    scaffoldBackgroundColor: isDark
        ? const Color(0xFF0F172A)
        : const Color(0xFFF8FAFC),
    cardColor: isDark ? const Color(0xFF1E293B) : Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: isDark ? const Color(0xFF1E293B) : Colors.white,
      foregroundColor: isDark ? Colors.white : const Color(0xFF0F172A),
      elevation: 0,
      scrolledUnderElevation: 1,
    ),
  );
}

class QmoosaFixFlowApp extends StatelessWidget {
  const QmoosaFixFlowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Qmoosa FixFlow - Serverpod 4',
      debugShowCheckedModeBanner: false,
      theme: _buildTheme(Brightness.light),
      darkTheme: _buildTheme(Brightness.dark),
      themeMode: ThemeMode.system,
      home: const HomeScreen(),
    );
  }
}
