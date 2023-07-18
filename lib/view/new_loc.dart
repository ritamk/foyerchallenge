import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foyerchallenge/controller/local.dart';
import 'package:foyerchallenge/controller/provider.dart';
import 'package:foyerchallenge/model/profile_model.dart';
import 'package:foyerchallenge/shared/constants.dart';
import 'package:foyerchallenge/shared/shared.dart';
import 'package:geolocator/geolocator.dart';
import 'package:location/location.dart' as loc;

class NewLocationDialog extends ConsumerStatefulWidget {
  const NewLocationDialog({super.key});

  @override
  ConsumerState<NewLocationDialog> createState() => _NewLocationDialogState();
}

class _NewLocationDialogState extends ConsumerState<NewLocationDialog> {
  final double fontSize = 16.0;
  Position? _position;
  bool _gettingLocation = false;
  bool _saving = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _longController = TextEditingController();
  final TextEditingController _latController = TextEditingController();
  final TextEditingController _nameController = TextEditingController(text: "");

  final FocusNode _longScope = FocusNode();
  final FocusNode _latScope = FocusNode();
  final FocusNode _nameScope = FocusNode();

  String _selectedColor = "";
  String _selectedFont = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: CupertinoAlertDialog(
        title: Text(
          "Add New Profile",
          style: TextStyle(
            fontFamily:
                Theme.of(context).primaryTextTheme.displayMedium!.fontFamily,
          ),
        ),
        content: Material(
          type: MaterialType.transparency,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 20.0),
                Row(
                  children: [
                    Flexible(
                      child: Column(
                        children: [
                          TextFormField(
                            controller: _longController,
                            focusNode: _longScope,
                            decoration:
                                textInputDecoration(context, "Longitude"),
                            validator: (value) {
                              if (value != null && value.isNotEmpty) {
                                if (((double.parse(value) > LONG_LIMIT[0]) &&
                                    (double.parse(value) < LONG_LIMIT[1]))) {
                                  return null;
                                } else {
                                  return "Invalid longitude";
                                }
                              } else {
                                return "Enter longitude";
                              }
                            },
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (val) =>
                                FocusScope.of(context).requestFocus(_latScope),
                          ),
                          const SizedBox(height: 10.0),
                          TextFormField(
                            controller: _latController,
                            focusNode: _latScope,
                            decoration:
                                textInputDecoration(context, "Latitude"),
                            validator: (value) {
                              if (value != null && value.isNotEmpty) {
                                if (((double.parse(value) < LAT_LIMIT[0]) &&
                                    (double.parse(value) > LAT_LIMIT[1]))) {
                                  return null;
                                } else {
                                  return "Invalid latitude";
                                }
                              } else {
                                return "Enter latitude";
                              }
                            },
                            keyboardType: TextInputType.number,
                            textInputAction: TextInputAction.next,
                            onFieldSubmitted: (val) =>
                                FocusScope.of(context).requestFocus(_nameScope),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    InkWell(
                      onTap: () async {
                        setState(() => _gettingLocation = true);
                        try {
                          _position = await determinePosition();
                          _longController.text =
                              _position!.longitude.toString();
                          _latController.text = _position!.latitude.toString();
                        } catch (e) {
                          commonSnackbar(e.toString(), context);
                        }
                        setState(() => _gettingLocation = false);
                      },
                      child: Container(
                        height: 130.0,
                        width: 50.0,
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: !_gettingLocation
                            ? const Icon(Icons.location_on)
                            : const CupertinoActivityIndicator(radius: 10.0),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 10.0),
                TextFormField(
                  controller: _nameController,
                  focusNode: _nameScope,
                  decoration: textInputDecoration(context, "Name"),
                  validator: (value) =>
                      value!.isNotEmpty ? null : "Please enter a name",
                  textInputAction: TextInputAction.done,
                  onFieldSubmitted: (val) => FocusScope.of(context).unfocus(),
                ),
                const SizedBox(height: 10.0),
                PopupMenuButton(
                  constraints:
                      const BoxConstraints.expand(width: 200.0, height: 200.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  initialValue: "Green",
                  onSelected: (value) => setState(() => _selectedColor = value),
                  itemBuilder: (context) {
                    return <PopupMenuEntry<String>>[
                      for (String elem in THEMES.keys)
                        PopupMenuItem(
                          value: elem,
                          child: Row(
                            children: [
                              Expanded(child: Text(elem)),
                              Container(
                                height: 30.0,
                                width: 30.0,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Theme.of(context).indicatorColor),
                                  color: THEMES[elem],
                                  shape: BoxShape.circle,
                                ),
                              )
                            ],
                          ),
                        ),
                    ];
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    height: 50.0,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _selectedColor.isNotEmpty
                            ? Text(
                                _selectedColor,
                                style: TextStyle(
                                  fontSize: fontSize,
                                ),
                              )
                            : Text(
                                "Color",
                                style: TextStyle(
                                  fontSize: fontSize,
                                ),
                              ),
                        const SizedBox(width: 10.0),
                        _selectedColor.isNotEmpty
                            ? Container(
                                height: 30.0,
                                width: 30.0,
                                decoration: BoxDecoration(
                                  color: THEMES[_selectedColor],
                                  shape: BoxShape.circle,
                                ),
                              )
                            : const Icon(
                                Icons.keyboard_arrow_down,
                                size: 18.0,
                              ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
                PopupMenuButton(
                  constraints:
                      const BoxConstraints.expand(width: 200.0, height: 200.0),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  initialValue: "Montserrat",
                  onSelected: (value) => setState(() => _selectedFont = value),
                  itemBuilder: (context) {
                    return <PopupMenuEntry<String>>[
                      for (String elem in FONTS)
                        PopupMenuItem(
                          value: elem,
                          child: Text(
                            elem,
                            style: TextStyle(fontFamily: elem),
                          ),
                        ),
                    ];
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    height: 50.0,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _selectedFont.isNotEmpty
                            ? Text(
                                _selectedFont,
                                style: TextStyle(
                                  fontFamily: _selectedFont,
                                  fontSize: fontSize,
                                ),
                              )
                            : Text(
                                "Font",
                                style: TextStyle(
                                  fontSize: fontSize,
                                ),
                              ),
                        const SizedBox(width: 10.0),
                        _selectedFont.isNotEmpty
                            ? const SizedBox(height: 0.0, width: 0.0)
                            : const Icon(
                                Icons.keyboard_arrow_down,
                                size: 18.0,
                              ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10.0),
              ],
            ),
          ),
        ),
        actions: [
          CupertinoDialogAction(
            onPressed: () => Navigator.pop(context),
            child: Text(
              "Cancel",
              style: TextStyle(
                fontFamily: Theme.of(context)
                    .primaryTextTheme
                    .displayMedium!
                    .fontFamily,
                color: Theme.of(context).indicatorColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          CupertinoDialogAction(
            onPressed: () {
              if (_formKey.currentState!.validate() &&
                  _selectedColor.isNotEmpty &&
                  _selectedFont.isNotEmpty) {
                if (ref.watch(profilesProvider).indexWhere(
                        (element) => element.name == _nameController.text) ==
                    -1) {
                  if ((ref.watch(profilesProvider).indexWhere((element) =>
                              element.longitude ==
                              double.parse(_latController.text)) ==
                          -1) &&
                      (ref.watch(profilesProvider).indexWhere((element) =>
                              element.latitude ==
                              double.parse(_longController.text)) ==
                          -1)) {
                    setState(() => _saving = true);
                    LocalStorage.setProfileData(
                      ProfileModel(
                        name: _nameController.text,
                        color: _selectedColor,
                        font: _selectedFont,
                        longitude: double.parse(_longController.text),
                        latitude: double.parse(_latController.text),
                      ),
                    )
                        .whenComplete(() =>
                            LocalStorage.setSelectedData(_nameController.text))
                        .whenComplete(() {
                      ref.read(profilesProvider.notifier).state =
                          LocalStorage.getProfileData() ?? <ProfileModel>[];
                      ref.read(selectedProvider.notifier).state =
                          LocalStorage.getSelectedData() ?? "";
                      ref.read(colorProvider.notifier).state =
                          THEMES[_selectedColor] ?? Colors.green;
                      ref.read(fontProvider.notifier).state = _selectedFont;
                      setState(() => _saving = false);
                      Navigator.of(context).pop();
                    });
                  } else {
                    commonSnackbar("Location already exists", context);
                  }
                } else {
                  commonSnackbar("Name already exists", context);
                }
              } else {
                commonSnackbar("Please input all the required values", context);
              }
            },
            child: !_saving
                ? Text(
                    "Save",
                    style: TextStyle(
                      fontFamily: Theme.of(context)
                          .primaryTextTheme
                          .displayMedium!
                          .fontFamily,
                      color: Theme.of(context).indicatorColor,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                : CupertinoActivityIndicator(
                    color: Theme.of(context).indicatorColor,
                    radius: 10.0,
                  ),
          ),
        ],
      ),
    );
  }
}

Future<Position?> determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    serviceEnabled = await loc.Location().requestService();
    if (!serviceEnabled) {
      throw "Please enable location services.";
    }
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      throw "Please allow location permissions.";
    }
  }

  if (permission == LocationPermission.deniedForever) {
    throw "Cannot request permissions, location permissions are permanently denied.";
  }

  try {
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
  } catch (e) {
    return Geolocator.getLastKnownPosition();
  }
}
