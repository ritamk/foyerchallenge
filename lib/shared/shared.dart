import 'package:flutter/material.dart';

class ColoredSafeArea extends StatelessWidget {
  const ColoredSafeArea({super.key, this.color, required this.child});
  final Widget child;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color ?? Theme.of(context).colorScheme.primary,
      child: SafeArea(
        child: child,
      ),
    );
  }
}

ScaffoldFeatureController commonSnackbar(String text, BuildContext context,
    {double textSize = 16.0}) {
  const double rad = 15.0;
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    backgroundColor: Colors.black,
    behavior: SnackBarBehavior.floating,
    content: Text(
      text,
      style: TextStyle(fontSize: textSize, color: Colors.white),
    ),
    padding: const EdgeInsets.all(18.0),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(rad)),
  ));
}
