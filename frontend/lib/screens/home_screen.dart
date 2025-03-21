import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> with SingleTickerProviderStateMixin{
  static const address = 'http://localhost:8080/api/wallpapers/random';
  late AnimationController _animationController;
  bool isLiked = false;

  @override
  void initState() {
    super.initState();
    _fetchWallpaper();
    _animationController = AnimationController(vsync: this);
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
            ).animate(controller: _animationController, autoPlay: false).rotate(begin: 0, end: -2, duration: Duration(seconds: 1)),
          ),
          Align(
            alignment: Alignment(0.25, 0.75),
            child: IconButton(
              iconSize: 50,
              onPressed: (){
                setState(() {
                  isLiked = !isLiked;
                });
              },
              color: isLiked ? Colors.redAccent : null,
              icon: const Icon(Icons.favorite),
            )
          )
        ],
      ),
    );
  }

  Future _fetchWallpaper() async {
    final Uri url = Uri.parse(address);
    final response = await http.get(url);
    print(response.body);
  }
}
