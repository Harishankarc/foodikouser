import 'package:flutter/material.dart';
import 'package:fudikoclient/components/apptextfeild.dart';
import 'package:fudikoclient/screens/tabs/components/restaurantCard.dart';
import 'package:fudikoclient/utils/constants.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
              child: AppTextFeild(
                text: "Search Restaurant",
                textColor: appTextColor,
                isTextCenter: true,
              ),
            ),
            const SizedBox(height: 20),
            RestaurantCard()
          ],
        ),
      ),
    );
  }
}
