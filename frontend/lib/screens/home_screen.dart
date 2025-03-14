import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'dart:math' as math;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> with SingleTickerProviderStateMixin{
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this,
        duration: const Duration(seconds: 1),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Placeholder(),
          Align(
            alignment: const Alignment(-0.25, 0.75),
              child: IconButton(
                iconSize: 50,
                onPressed: () {
                  _animationController
                    ..reset()
                    ..forward();
                },
                color: Colors.black26,
                icon: const Icon(Icons.replay_circle_filled),
              ).animate(controller: _animationController, autoPlay: false).rotate(begin: 0, end: 4 * math.pi),
          ),
          Align(
            alignment: Alignment(0.25, 0.75),
            child: IconButton(
              iconSize: 50,
              onPressed: (){},
              color: Colors.redAccent,
              icon: const Icon(Icons.favorite),
            )
          )
        ],
      ),
    );
  }
}
