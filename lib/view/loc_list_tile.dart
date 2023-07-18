import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foyerchallenge/controller/local.dart';
import 'package:foyerchallenge/controller/provider.dart';

class DeviceProfileTile extends ConsumerWidget {
  const DeviceProfileTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return InkWell(
      onTap: () async {
        await LocalStorage.getProfileData();
        ref.read(colorProvider.notifier).state = Colors.amber;
      },
      child: Container(
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
      ),
    );
  }
}
