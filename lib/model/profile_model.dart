import 'package:flutter/material.dart';

class ProfileModel {
  final String name;
  final String color;
  final String font;
  final double size;
  final double longitude;
  final double latitude;

  ProfileModel({
    required this.name,
    required this.color,
    required this.font,
    required this.size,
    required this.longitude,
    required this.latitude,
  });
}

class ThemeProviderModel {
  final MaterialColor color;
  final String font;
  final double scale;

  ThemeProviderModel({
    required this.color,
    required this.font,
    required this.scale,
  });
}
