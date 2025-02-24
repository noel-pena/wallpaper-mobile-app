import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
      body: Stack(
        children: [Center(
          child: TextButton.icon(
            onPressed: (){},
            icon: Icon(Icons.add, size: 18),
            label: Text("Mobile Wallpaper"),
          ),
        )],
      ),
    );
  }
}
