import 'package:flutter/material.dart';
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
      body: Stack(
        children: [
          Placeholder(),
          Align(
            alignment: Alignment(-0.25, 0.75),
            child: IconButton(
              iconSize: 50,
              onPressed: (){},
              color: Colors.black26,
              icon: const Icon(Icons.replay_circle_filled),
            )
              .animate().rotate(
                duration: const Duration(milliseconds: 500),
                curve: Curves.linear,
              )
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
