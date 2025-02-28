import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../widgets/custom_app_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
  }

class _HomeScreen extends State<HomeScreen> {
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
        children: [
          Align(
              alignment: Alignment(1, 1),
              child: ElevatedButton(
                  onPressed: (){},
                  child: Text('Render')
              )
          )],
      ),
    );
  }
}
