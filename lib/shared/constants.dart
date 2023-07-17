// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:foyerchallenge/model/profile_model.dart';

const double PAGE_PADDING = 18.0;

InputDecoration textInputDecoration(BuildContext context, String label) {
  return InputDecoration(
    contentPadding: const EdgeInsets.all(20.0),
    labelText: label,
    floatingLabelBehavior: FloatingLabelBehavior.never,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(15.0),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(
        width: 1.5,
        color: Theme.of(context).primaryColor,
      ),
      borderRadius: BorderRadius.circular(30.0),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.red),
      borderRadius: BorderRadius.circular(30.0),
    ),
  );
}

const List<double> LONG_LIMIT = [68.245483, 97.420296];
const List<double> LAT_LIMIT = [37.057941, 6.658559];

final List<ThemeSelectionModel> THEMES = [
  ThemeSelectionModel(colorName: "Amber", color: Colors.amber),
  ThemeSelectionModel(colorName: "Indigo", color: Colors.indigo),
  ThemeSelectionModel(colorName: "Blue Grey", color: Colors.blueGrey),
  ThemeSelectionModel(colorName: "Teal", color: Colors.teal),
  ThemeSelectionModel(colorName: "Deep Purple", color: Colors.deepPurple),
  ThemeSelectionModel(colorName: "Green", color: Colors.green),
  ThemeSelectionModel(colorName: "Orange", color: Colors.orange),
];

const MaterialColor MAIN_COLOR = Colors.blue;

final List<String> FONTS = [
  "Montserrat",
  "Caveat",
  "IndieFlower",
  "Roboto",
  "SourceCode",
  "YujiBoku",
  "Playfair",
];
