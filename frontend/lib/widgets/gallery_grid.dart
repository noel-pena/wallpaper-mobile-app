import 'package:flutter/material.dart';


class GalleryGrid extends StatelessWidget {
  const GalleryGrid({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    String defaultWallpaper = "https://w.wallhaven.cc/full/nz/wallhaven-nz2lgg.jpg";

    return GridView.count(
      padding: const EdgeInsets.all(10),
      crossAxisCount: 3,
      crossAxisSpacing: 5,
      mainAxisSpacing: 5,
      childAspectRatio: 1,
      children:
        List.generate(100, (index) {
          return Center(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(5),
                child: SizedBox(
                    width: 150,
                    height: 150,
                    child: Image.network(
                      defaultWallpaper,
                      fit: BoxFit.cover,
                    )
                )
            )

          );
        }),
    );
  }
}