import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foyerchallenge/shared/constants.dart';
import 'package:foyerchallenge/shared/shared.dart';
import 'package:foyerchallenge/view/loc_list.dart';
import 'package:foyerchallenge/view/new_loc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
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
                        tooltip: "Add location",
                        onPressed: () {
                          Navigator.of(context).push(
                            CupertinoDialogRoute(
                              context: context,
                              builder: (context) => const NewLocationDialog(),
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
              const SizedBox(height: 20.0),
              const LocationListView(),
            ],
          ),
        ),
      ),
    );
  }
}
