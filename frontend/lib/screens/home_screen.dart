import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';
import 'package:flutter_animate/flutter_animate.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onLogoPressed: () {
          if (kDebugMode) {
            print('app bar logo pressed');
          }
        },
      ),
      body: Stack(
        children: [
          Align(
            alignment: Alignment(0, 0.8),
            child: Icon(
              Icons.replay_circle_filled,
              size: 50,
              color: Colors.black26,
            )
              .animate().rotate(
                duration: const Duration(milliseconds: 500),
                curve: Curves.linear,
              )
          )],
      ),
    );
  }
}
