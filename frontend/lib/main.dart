import 'package:flutter/material.dart';
import 'package:frontend/screens/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'azar',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0XFFE6E6E6),
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF66666E)),
        useMaterial3: true,
      ),
      home: MainScreen()
    );
  }
}