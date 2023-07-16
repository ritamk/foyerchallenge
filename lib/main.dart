import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
  primarySwatch: Colors.purple,
);
