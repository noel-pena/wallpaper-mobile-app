import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:frontend/services/wallpaper_service.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool isLiked = false;
  final WallpaperService _wallpaperService = WallpaperService();
  dynamic _wallpaperData;

  @override
  void initState() {
    super.initState();
    _fetchWallpaper();
    _animationController = AnimationController(vsync: this);
  }

  Future _fetchWallpaper() async {
    try {
      final data = await _wallpaperService.fetchWallpaper();
      setState(() {
        _wallpaperData = data;
      });
    } catch (error) {
      throw('Error: $error');
    }
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
          Align(
            alignment: const Alignment(0, 0),
            child: _wallpaperData != null
            ? Image.network(_wallpaperData!)
            : const Center(child: CircularProgressIndicator()),
          ),
          Align(
            alignment: const Alignment(-0.25, 0.75),
            child: IconButton(
              iconSize: 50,
              onPressed: () {
                _fetchWallpaper();
                _animationController
                  ..reset()
                  ..forward();
              },
              color: Colors.black26,
              icon: const Icon(Icons.replay_circle_filled),
            ).animate(controller: _animationController, autoPlay: false).rotate(
                begin: 0, end: -2, duration: Duration(seconds: 1)),
          ),
          Align(
              alignment: Alignment(0.25, 0.75),
              child: IconButton(
                iconSize: 50,
                onPressed: () {
                  _fetchWallpaper();
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
}
