import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foyerchallenge/controller/local.dart';
import 'package:foyerchallenge/controller/provider.dart';
import 'package:foyerchallenge/model/profile_model.dart';
import 'package:foyerchallenge/shared/constants.dart';

class DeviceProfileTile extends ConsumerWidget {
  const DeviceProfileTile({super.key, required this.profile});
  final ProfileModel profile;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final Color contrast =
        THEMES[profile.color] == Colors.amber ? Colors.black : Colors.white;

    return InkWell(
      onTap: () async {
        await LocalStorage.setSelectedData(profile.name);
        ref.read(selectedProvider.notifier).state = profile.name;
        ref.read(colorProvider.notifier).state =
            THEMES[profile.color] ?? Colors.green;
        ref.read(fontProvider.notifier).state = profile.font;
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 12.0),
        padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 18.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: THEMES[profile.color],
          boxShadow: [
            BoxShadow(
              blurRadius: 12.0,
              spreadRadius: 1.0,
              color: THEMES[profile.color]!.withAlpha(100),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              profile.name,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18.0,
                color: contrast,
              ),
            ),
            const SizedBox(height: 10.0),
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  size: 18.0,
                  color: contrast,
                ),
                Text(
                  " ${profile.latitude}, ${profile.longitude}",
                  style: TextStyle(color: contrast, fontSize: 16.0),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            Container(
              padding: const EdgeInsets.all(8.0),
              width: double.infinity,
              decoration: BoxDecoration(
                color: contrast,
                borderRadius: BorderRadius.circular(25.0),
              ),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  style: TextStyle(
                    color: THEMES[profile.color],
                    fontWeight: FontWeight.bold,
                    fontFamily:
                        Theme.of(context).textTheme.bodyMedium!.fontFamily,
                    fontSize: 18.0,
                  ),
                  children: [
                    TextSpan(text: "${profile.color}, "),
                    TextSpan(
                      text: profile.font,
                      style: TextStyle(fontFamily: profile.font),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
