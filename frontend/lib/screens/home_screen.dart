import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:frontend/services/wallpaper_service.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreen extends StatefulWidget {
  final Function(String) onWallpaperSaved;
  const HomeScreen({super.key, required this.onWallpaperSaved});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  bool isLiked = false;
  final WallpaperService _wallpaperService = WallpaperService();
  String? _wallpaperData;

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
        isLiked = false;
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
            alignment: Alignment.center,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: _wallpaperData != null
                      ? Image.network(
                    _wallpaperData!,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Center(child: Text('Failed to load image'));
                    },
                    loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: Shimmer.fromColors(
                          direction: ShimmerDirection.ttb,
                          baseColor: Color(0xFFCBCBCB),
                          highlightColor: Colors.white54,
                          child: Container(
                            height: MediaQuery.of(context).size.height,
                            width: MediaQuery.of(context).size.width,
                            color: Colors.white,
                          ),
                        ),
                      );
                    },
                  )
                      : const Center(child: CircularProgressIndicator()),
                ),
              ),
            ),
          ),
          Align(
              alignment: const Alignment(-0.25, 0.75),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                      child: Container(
                        width: 70.0,
                        height: 70.0,
                        color: Colors.white54,
                      ),
                    ),
                  ),
                  IconButton(
                    iconSize: 50,
                    onPressed: () {
                      _fetchWallpaper();
                      _animationController
                        ..reset()
                        ..forward();
                    },
                    color: Colors.black54,
                    icon: const Icon(Icons.change_circle),
                  ).animate(controller: _animationController, autoPlay: false).rotate(
                      begin: 0, end: -2, duration: const Duration(seconds: 1)),
                ],
              )
          ),
          Align(
            alignment: const Alignment(0.25, 0.75),
            child: Stack(
              alignment: Alignment.center,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                    child: Container(
                      width: 70.0,
                      height: 70.0,
                      color: Colors.white54,
                    ),
                  ),
                ),
                IconButton(
                  iconSize: 50,
                  onPressed: () {
                    setState(() {
                      isLiked = !isLiked;
                      if (isLiked && _wallpaperData != null) {
                        widget.onWallpaperSaved(_wallpaperData!);
                      }
                    });
                  },
                  color: isLiked ? Colors.redAccent : Colors.black54,
                  icon: const Icon(Icons.favorite),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}