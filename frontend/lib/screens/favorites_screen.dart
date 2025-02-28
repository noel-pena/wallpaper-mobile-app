import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../widgets/custom_app_bar.dart';

class FavoritesScreen extends StatefulWidget {
  const FavoritesScreen({super.key});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreen();
  }

  class _FavoritesScreen extends State<FavoritesScreen> {
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
      body: Placeholder()
    );
  }
}