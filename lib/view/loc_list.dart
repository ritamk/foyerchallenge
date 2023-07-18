import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foyerchallenge/controller/provider.dart';
import 'package:foyerchallenge/view/loc_list_tile.dart';

class LocationListView extends ConsumerStatefulWidget {
  const LocationListView({super.key});

  @override
  ConsumerState<LocationListView> createState() => _LocationListViewState();
}

class _LocationListViewState extends ConsumerState<LocationListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemCount: ref.watch(profilesProvider).length,
      itemBuilder: (BuildContext context, int index) {
        return DeviceProfileTile(
          profile: ref.watch(profilesProvider)[index],
        );
      },
    );
  }
}
