import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:walltest/models/wall_model.dart';
import 'package:http/http.dart' as http;

class WallsApi {
  static Future<List<WallModel>> getPhotos() async {
    final wallUrl = 'https://androidinsight.github.io/myapi/photos.json';
    final response = await http.get(Uri.parse(wallUrl));
    debugPrint('Google Places API URL: ${Uri.encodeFull(wallUrl)}');

    if (response.statusCode == 200) {
      final List wallsList = json.decode(response.body);
      debugPrint('Photos: $wallsList');
      return wallsList.map((json) => WallModel.fromJson(json)).toList();
    } else {
      debugPrint('Google Places API Response Code: ${response.statusCode}');
      throw Exception();
    }
  }
}
