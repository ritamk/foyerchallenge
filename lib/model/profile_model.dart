import 'package:flutter/material.dart';

class ProfileModel {
  final String name;
  final Color color;
  final Color contrastColor;
  final String font;
  final double size;
  final double longitude;
  final double latitude;

  ProfileModel({
    required this.name,
    required this.color,
    required this.contrastColor,
    required this.font,
    required this.size,
    required this.longitude,
    required this.latitude,
  });
}

class ThemeSelectionModel {
  final String colorName;
  final MaterialColor color;

  ThemeSelectionModel({
    required this.colorName,
    required this.color,
  });
}
