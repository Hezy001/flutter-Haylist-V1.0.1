import 'package:flutter/material.dart';
import 'pages/splash_screen.dart';
import 'services/hive_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveService.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HEYLIST',
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        appBarTheme: const AppBarTheme(
          centerTitle: true,
          backgroundColor: Colors.yellow, // Stronger yellow for AppBar
          foregroundColor: Colors.black,  // Ensures text/icons are readable
        ),
      ),
    );
  }
}