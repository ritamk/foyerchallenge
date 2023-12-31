import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    List<ProfileModel> profiles = ref.watch(profilesProvider);
    final int index = profiles.indexWhere(
        (ProfileModel element) => element.name == ref.watch(selectedProvider));

    return ColoredSafeArea(
      child: Scaffold(
        body: profiles.isEmpty
            ? Center(
                child: InkWell(
                  onTap: () => Navigator.of(context).push(
                    CupertinoDialogRoute(
                      context: context,
                      builder: (context) => const NewLocationDialog(),
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: Theme.of(context).primaryColor,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 12.0,
                          spreadRadius: 1.0,
                          color: Theme.of(context).primaryColor.withAlpha(100),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(Icons.add_circle,
                            color: Theme.of(context).indicatorColor),
                        const SizedBox(height: 10.0),
                        Text(
                          "Please create a new profile",
                          style: TextStyle(
                              fontSize: 18.0,
                              color: Theme.of(context).indicatorColor,
                              fontFamily: "Montserrat"),
                        ),
                        Text(
                          "Click here to get started",
                          style: TextStyle(
                              color: Theme.of(context).indicatorColor,
                              fontFamily: "Montserrat"),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            : SingleChildScrollView(
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
                          "\t${profiles[index].name}",
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
                              onPressed: () => showCupertinoDialog(
                                barrierDismissible: true,
                                context: context,
                                builder: (context) => const NewLocationDialog(),
                              ),
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
                        Text(
                          "${profiles[index].latitude}, ${profiles[index].longitude}",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 16.0),
                        ),
                        Icon(
                          Icons.location_on,
                          color: Theme.of(context).primaryColor,
                          size: 24.0,
                        ),
                      ],
                    ),
                    // const SizedBox(height: 10.0),
                    Row(
                      children: [
                        Text(
                          "${profiles[index].color} ",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 16.0),
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
                          ",\t${profiles[index].font} ",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 16.0),
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
