import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'dart:io' show Platform;

class WallpaperService {
  Future <dynamic> fetchWallpaper() async {
    try {
      String address;

      if (kIsWeb) {
        address = 'http://localhost:8080/api/wallpapers/random';
      } else if (Platform.isAndroid) {
        address = 'http://10.0.2.2:8080/api/wallpapers/random';
      } else if (Platform.isIOS) {
        address = 'http://127.0.0.1:8080/api/wallpapers/random';
      } else {
        address = 'http://localhost:8080/api/wallpapers/random';
      }

      final Uri url = Uri.parse(address);
      final response = await http.get(url);

      if (response.statusCode == 200) {
        return response.body;
      } else {
        throw Exception("Failed to load wallpaper: ${response.statusCode}");
      }
    } catch (error) {
      throw Exception("Could not reach call: $error");
    }
  }
}