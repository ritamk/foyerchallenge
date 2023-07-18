import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:foyerchallenge/controller/local.dart';
import 'package:foyerchallenge/controller/provider.dart';
import 'package:foyerchallenge/model/profile_model.dart';
import 'package:foyerchallenge/shared/constants.dart';
import 'package:foyerchallenge/view/home.dart';
import 'package:shimmer/shimmer.dart';

class WelcomeWrapper extends ConsumerStatefulWidget {
  const WelcomeWrapper({super.key});

  @override
  ConsumerState<WelcomeWrapper> createState() => _WelcomeWrapper();
}

class _WelcomeWrapper extends ConsumerState<WelcomeWrapper> {
  bool goHome = false;

  Future<void> getProfiles() async {
    await Future.delayed(const Duration(seconds: 2));
    List<ProfileModel>? profiles = LocalStorage.getProfileData();
    String? selected = LocalStorage.getSelectedData();

    ref.read(profilesProvider.notifier).state = profiles ?? <ProfileModel>[];
    ref.read(selectedProvider.notifier).state = selected ?? "";

    if (selected != null && profiles != null) {
      ref.read(colorProvider.notifier).state = THEMES[profiles[
                  profiles.indexWhere(
                      (ProfileModel element) => element.name == selected)]
              .color] ??
          Colors.green;
      ref.read(fontProvider.notifier).state = profiles[profiles
              .indexWhere((ProfileModel element) => element.name == selected)]
          .font;
    }

    setState(() => goHome = true);
  }

  @override
  void initState() {
    super.initState();
    getProfiles();
  }

  @override
  Widget build(BuildContext context) {
    return goHome
        ? const HomeView()
        : Scaffold(
            body: Center(
              child: Shimmer.fromColors(
                baseColor: Colors.black87,
                highlightColor: Colors.black12,
                period: const Duration(seconds: 1),
                child: const Text(
                  "Welcome",
                  style: TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
  }
}
