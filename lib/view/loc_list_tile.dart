import 'package:flutter/material.dart';

class DeviceProfileTile extends StatelessWidget {
  const DeviceProfileTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 12.0),
      padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 18.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Theme.of(context).primaryColor,
        boxShadow: [
          BoxShadow(
            blurRadius: 12.0,
            spreadRadius: 1.0,
            color: Theme.of(context).primaryColor.withAlpha(100),
          ),
        ],
      ),
      child: const Text(
        "Location",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
          // color: tileTextColor,
        ),
      ),
    );
  }
}
