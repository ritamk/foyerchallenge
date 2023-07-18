import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foyerchallenge/controller/local.dart';
import 'package:foyerchallenge/controller/provider.dart';
import 'package:foyerchallenge/model/profile_model.dart';
import 'package:foyerchallenge/shared/constants.dart';
import 'package:foyerchallenge/shared/shared.dart';
import 'package:foyerchallenge/view/loc_list.dart';
import 'package:foyerchallenge/view/new_loc.dart';

class HomeView extends ConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const double greetingFontSize = 24.0;

    return ColoredSafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          primary: true,
          padding: const EdgeInsets.all(PAGE_PADDING),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Text(
                    "Hello",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: greetingFontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "\tRitam",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: greetingFontSize,
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                        tooltip: "Add Profile",
                        onPressed: () async {
                          await LocalStorage.setProfileData(ProfileModel(
                            name: "Ritam",
                            font: ref.watch(fontProvider),
                            color: THEMES.keys.firstWhere((element) =>
                                THEMES[element] == ref.watch(colorProvider)),
                            longitude: 88.416845,
                            latitude: 22.577161,
                          )).whenComplete(
                            () => Navigator.of(context).push(
                              CupertinoDialogRoute(
                                context: context,
                                builder: (context) => const NewLocationDialog(),
                              ),
                            ),
                          );
                        },
                        splashRadius: 22.0,
                        iconSize: 36.0,
                        color: Theme.of(context).primaryColor,
                        icon: const Icon(Icons.add_circle),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.location_on,
                    color: Theme.of(context).primaryColor,
                    size: 24.0,
                  ),
                  Text(
                    "88.416845, 22.577161, ",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor, fontSize: 16.0),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).primaryColor,
                    ),
                    height: 20.0,
                    width: 20.0,
                  ),
                  Text(
                    " ${THEMES.keys.firstWhere((element) => THEMES[element] == ref.watch(colorProvider))}",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor, fontSize: 16.0),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              const LocationListView(),
            ],
          ),
        ),
      ),
    );
  }
}
