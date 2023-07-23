import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foyerchallenge/model/profile_model.dart';

final StateProvider<ThemeProviderModel> selectedThemeProvider =
    StateProvider<ThemeProviderModel>((ref) => ThemeProviderModel(
        color: Colors.green, font: "Montserrat", scale: 1.0));

final StateProvider<ThemeData> themeProvider = StateProvider<ThemeData>((ref) {
  final MaterialColor color = ref.watch(selectedThemeProvider).color;
  final String font = ref.watch(selectedThemeProvider).font;

  return ThemeData(
    fontFamily: font,
    useMaterial3: true,
    colorScheme: ColorScheme.fromSwatch(
      brightness: color != Colors.amber ? Brightness.dark : Brightness.light,
      primarySwatch: color,
      primaryColorDark: color.shade800,
      accentColor: color.shade200,
      cardColor: color,
      backgroundColor: color,
      errorColor: Colors.red.shade300,
    ),
    scaffoldBackgroundColor: color.shade50,
  );
});

final StateProvider<List<ProfileModel>> profilesProvider =
    StateProvider<List<ProfileModel>>((ref) => <ProfileModel>[]);

final StateProvider<String> selectedProvider =
    StateProvider<String>((ref) => "");
