import 'package:flutter/material.dart';
import 'package:foyerchallenge/view/loc_list_tile.dart';

class LocationListView extends StatefulWidget {
  const LocationListView({super.key});

  @override
  State<LocationListView> createState() => _LocationListViewState();
}

class _LocationListViewState extends State<LocationListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      primary: false,
      itemCount: 14,
      itemBuilder: (BuildContext context, int index) {
        return const DeviceProfileTile();
      },
    );
  }
}
