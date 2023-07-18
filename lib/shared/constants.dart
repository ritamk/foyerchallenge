// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:flutter/material.dart';

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

final Map<String, MaterialColor> THEMES = {
  "Amber": Colors.amber,
  "Indigo": Colors.indigo,
  "Blue Grey": Colors.blueGrey,
  "Teal": Colors.teal,
  "Deep Purple": Colors.deepPurple,
  "Green": Colors.green,
  "Orange": Colors.orange,
};

final List<String> FONTS = [
  "Montserrat",
  "Caveat",
  "IndieFlower",
  "Roboto",
  "SourceCode",
  "YujiBoku",
  "Playfair",
];
