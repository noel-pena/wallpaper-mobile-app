import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:
          TextButton(
            onPressed: (){},
            style: TextButton.styleFrom(
              textStyle: TextStyle(
                fontSize: 24
              )
            ),
            child: Text("azar"),
          ),
      backgroundColor: Color(0xFF2A2A2A),
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
