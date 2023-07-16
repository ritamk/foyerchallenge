import 'package:flutter/material.dart';
import 'package:foyerchallenge/shared/constants.dart';
import 'package:foyerchallenge/shared/shared.dart';
import 'package:foyerchallenge/view/loc_list.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    const double greetingFontSize = 24.0;

    return ColoredSafeArea(
      color: Colors.white,
      child: Scaffold(
        body: SingleChildScrollView(
          primary: true,
          padding: const EdgeInsets.all(PAGE_PADDING),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: const [
                  Text(
                    "Hello",
                    style: TextStyle(
                      fontSize: greetingFontSize,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "\tRitam",
                    style: TextStyle(
                      fontSize: greetingFontSize,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              const LocationListView(),
            ],
          ),
        ),
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        // floatingActionButton: FloatingActionButton(
        //   onPressed: () {},
        //   child: const Icon(Icons.add),
        // ),
      ),
    );
  }
}
