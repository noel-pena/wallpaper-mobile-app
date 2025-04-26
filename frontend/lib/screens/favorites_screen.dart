import 'package:flutter/material.dart';

class FavoritesScreen extends StatefulWidget {
  final List<String> savedWallpapers;
  const FavoritesScreen({super.key, required this.savedWallpapers});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreen();
}

class _FavoritesScreen extends State<FavoritesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: (widget.savedWallpapers.isEmpty) ?
      Center(child: Text("Nothing Saved."))
      : GridView.count(
        padding: const EdgeInsets.all(10),
        crossAxisCount: 3,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
        childAspectRatio: 1,
        children: widget.savedWallpapers.map((wallpaperUrl) {
          return GestureDetector(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (_) => Dialog(
                    backgroundColor: Colors.transparent,
                    insetPadding: EdgeInsets.zero,
                    child: Image.network(
                      wallpaperUrl,
                      fit: BoxFit.fill,
                    )
                  )
              );
            },
            child:
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: SizedBox(
                    width: 150,
                    height: 150,
                    child:  Hero(
                      tag: wallpaperUrl,
                      child:
                      Image.network(
                        wallpaperUrl,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return const Center(child: Icon(Icons.error_outline));
                        },
                      ),
                    )
                  ),
                ),
              ),
          );
        }).toList(),
      ),
    );
  }
}