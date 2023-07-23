import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foyerchallenge/controller/local.dart';
import 'package:foyerchallenge/controller/provider.dart';
import 'package:foyerchallenge/wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.init();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Foyer Challenge',
      theme: ref.watch(themeProvider),
      debugShowCheckedModeBanner: false,
      home: MediaQuery(
        data: MediaQuery.of(context)
            .copyWith(textScaleFactor: ref.watch(selectedThemeProvider).scale),
        child: const WelcomeWrapper(),
      ),
    );
  }
}

// ThemeData mainTheme = ThemeData(
//   fontFamily: "Montserrat",
//   useMaterial3: true,
//   // colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
//   colorScheme: ColorScheme.fromSwatch(
//     brightness: Brightness.dark,
//     primarySwatch: Colors.blue,
//     primaryColorDark: Colors.blue.shade800,
//     accentColor: Colors.blue.shade200,
//     cardColor: Colors.blue,
//     backgroundColor: Colors.blue,
//     errorColor: Colors.red.shade300,
//   ),
//   scaffoldBackgroundColor: Colors.blue.shade50,
// );
