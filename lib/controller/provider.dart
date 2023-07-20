import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foyerchallenge/model/profile_model.dart';

final StateProvider<MaterialColor> colorProvider =
    StateProvider<MaterialColor>((ref) => Colors.green);

final StateProvider<String> fontProvider =
    StateProvider<String>((ref) => "Montserrat");

final StateProvider<double> textScaleProvider =
    StateProvider<double>((ref) => 1.0);

final StateProvider<ThemeData> themeProvider = StateProvider<ThemeData>((ref) {
  final MaterialColor color = ref.watch(colorProvider);
  final String font = ref.watch(fontProvider);

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
