import 'package:flutter/material.dart';
import 'screens/main_dashboard.dart';

void main() {
  runApp(const CloudStorageApp());
}

class CloudStorageApp extends StatelessWidget {
  const CloudStorageApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CloudStore Admin',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF2563EB), // Professional blue
          brightness: Brightness.light,
        ),
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF8FAFC),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const MainDashboard(),
      },
    );
  }
}
