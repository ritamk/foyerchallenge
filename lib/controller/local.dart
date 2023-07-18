import 'dart:convert';

import 'package:foyerchallenge/model/profile_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  static const String _profileKey = "profileKey";
  static const String _selectedKey = "selectedKey";

  static SharedPreferences? sharedPreferences;

  static Future init() async =>
      sharedPreferences = await SharedPreferences.getInstance();

  static Future<bool> setSelectedData(String name) async {
    return await sharedPreferences!.setString(_selectedKey, name);
  }

  static String? getSelectedData() {
    try {
      return sharedPreferences!.getString(_selectedKey);
    } catch (e) {
      return null;
    }
  }

  static Future<bool> setProfileData(ProfileModel details) async {
    final String? obj = sharedPreferences!.getString(_profileKey);
    List<dynamic> list;

    if (obj != null) {
      list = jsonDecode(obj);
    } else {
      list = <dynamic>[];
    }

    list.add({
      "name": details.name,
      "font": details.font,
      "color": details.color,
      "latitude": details.latitude,
      "longitude": details.longitude,
    });

    return await sharedPreferences!.setString(_profileKey, jsonEncode(list));
  }

  static List<ProfileModel>? getProfileData() {
    try {
      final String? data = sharedPreferences!.getString(_profileKey);
      List<dynamic> decoded = [];
      List<ProfileModel> returner = <ProfileModel>[];

      if (data != null) {
        decoded = jsonDecode(data);
        for (dynamic element in decoded) {
          returner.add(ProfileModel(
            name: element["name"],
            color: element["color"],
            font: element["font"],
            longitude: element["latitude"],
            latitude: element["longitude"],
          ));
        }
        return returner;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  static Future<void> deleteAllProfileData() async {
    await sharedPreferences!.clear();
    return;
  }
}
