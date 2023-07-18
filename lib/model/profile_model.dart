import 'package:flutter/material.dart';

class ProfileModel {
  final String name;
  final String color;
  final String font;
  final double longitude;
  final double latitude;

  ProfileModel({
    required this.name,
    required this.color,
    required this.font,
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
