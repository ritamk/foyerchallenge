import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foyerchallenge/shared/constants.dart';
import 'package:foyerchallenge/view/home.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Foyer Challenge',
      theme: mainTheme,
      debugShowCheckedModeBanner: false,
      home: const HomeView(),
    );
  }
}

ThemeData mainTheme = ThemeData(
  fontFamily: "Montserrat",
  useMaterial3: true,
  // colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
  colorScheme: ColorScheme.fromSwatch(
    brightness: Brightness.dark,
    primarySwatch: MAIN_COLOR,
    primaryColorDark: MAIN_COLOR.shade800,
    accentColor: MAIN_COLOR.shade200,
    cardColor: MAIN_COLOR,
    backgroundColor: MAIN_COLOR,
    errorColor: Colors.red.shade300,
  ),
  scaffoldBackgroundColor: MAIN_COLOR.shade50,
);
