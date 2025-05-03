import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shimmer/shimmer.dart';

class FavoritesScreen extends StatefulWidget {
  final List<String> savedWallpapers;
  const FavoritesScreen({super.key, required this.savedWallpapers});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreen();
}

class _FavoritesScreen extends State<FavoritesScreen> with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Scaffold(
      body: widget.savedWallpapers.isEmpty
          ? const Center(child: Text("Nothing Saved."))
          : GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,
          childAspectRatio: 1,
        ),
        itemCount: widget.savedWallpapers.length,
        itemBuilder: (BuildContext context, int index) {
          final wallpaperUrl = widget.savedWallpapers[index];

          return GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (_) => Dialog(
                  backgroundColor: Colors.transparent,
                  insetPadding: EdgeInsets.zero,
                  child: CachedNetworkImage(
                    imageUrl: wallpaperUrl,
                    fit: BoxFit.fill,
                    placeholder: (context, url) =>
                    const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) =>
                    const Center(child: Icon(Icons.error_outline)),
                  ),
                ),
              );
            },
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: SizedBox(
                  width: 150,
                  height: 150,
                  child: Hero(
                    tag: wallpaperUrl,
                    child: CachedNetworkImage(
                      imageUrl: wallpaperUrl,
                      fit: BoxFit.cover,
                      placeholder: (context, url) =>
                      Center(
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
                      ),
                      errorWidget: (context, url, error) =>
                      const Center(child: Icon(Icons.error_outline)),
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}