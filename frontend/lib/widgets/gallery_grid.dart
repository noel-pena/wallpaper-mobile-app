import 'package:flutter/material.dart';

class GalleryGrid extends StatelessWidget {
  const GalleryGrid({
    super.key
  });

  @override
  Widget build(BuildContext context) {
    return GridView.count(
        crossAxisCount: 2,
      children: [

      ],
    );
  }
}