import 'package:flutter/material.dart';
import 'package:frontend/screens/home_screen.dart';
import 'package:frontend/screens/favorites_screen.dart';
import 'package:frontend/widgets/custom_app_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  MainScreenState createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  List<String> savedWallpapers = [];
  int _selectedIndex = 0;
  late final FavoritesScreen favoritesScreen;

  @override
  void initState(){
    super.initState();
    favoritesScreen = FavoritesScreen(savedWallpapers: savedWallpapers);
  }

  void setSavedWallpapers (List<String> newSavedWallpapers) {
    setState(() {
      savedWallpapers = newSavedWallpapers;
    });
  }

  Widget _buildFavoritesScreen() {
    return FavoritesScreen(savedWallpapers: savedWallpapers);
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgetOptions = <Widget>[
      HomeScreen(onWallpaperSaved: (String url) {
        if (!savedWallpapers.contains(url)) {
          setSavedWallpapers([...savedWallpapers, url]);
        }
      }),
      Builder(builder: (context) => _buildFavoritesScreen()),
    ];

    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          onLogoPressed: () {
            setState(() {
              _selectedIndex = 0;
            });
          },
        ),
        body:
        IndexedStack(
          index: _selectedIndex,
          children: widgetOptions,
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              label: 'Favorites',
            )
          ],
          backgroundColor: Color(0xFFCBCBCB),
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.black87,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}