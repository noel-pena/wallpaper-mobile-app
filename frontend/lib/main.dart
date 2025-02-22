import 'package:flutter/material.dart';
import 'package:frontend/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wallpaper App',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0XFFF4F4F6),
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFF66666E)),
        useMaterial3: true,
      ),
      home: HomeScreen()
    );
  }
}