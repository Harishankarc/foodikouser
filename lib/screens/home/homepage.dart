import 'package:flutter/material.dart';
import 'package:fudikoclient/components/apptext.dart';
import 'package:fudikoclient/screens/home/components/banquetBox.dart';
import 'package:fudikoclient/screens/home/components/cateringBox.dart';
import 'package:fudikoclient/screens/home/components/restaurantBox.dart';
import 'package:fudikoclient/screens/home/components/takeawayBox.dart';
import 'package:fudikoclient/utils/constants.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appSecondaryBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: SingleChildScrollView(
            child: Column(
              children: [
                _navBar(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                     SizedBox(height: 40),
                    RestaurantBox(),
                    SizedBox(height: 20),
                    BanquetBox(),
                    SizedBox(height: 20),
                    CateringBox(),
                    SizedBox(height: 20),
                    TakeAwayBox(),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _navBar() {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Icon(Icons.menu, size: 30, color: appTextColor3),
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            width: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AppText(
                    text: "City",
                    size: 10,
                    fontWeight: FontWeight.w600,
                    color: appTextColor3,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.location_on, size: 15, color: appTextColor3),
                        AppText(
                          text: "Moscow Center",
                          size: 10,
                          fontWeight: FontWeight.w600,
                          color: appTextColor3,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
