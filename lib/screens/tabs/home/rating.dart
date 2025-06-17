import 'package:flutter/material.dart';
import 'package:fudikoclient/components/apptext.dart';
import 'package:fudikoclient/screens/tabs/home/ratingCard.dart';
import 'package:fudikoclient/utils/constants.dart';

class RatingPage extends StatelessWidget {
  const RatingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: Column(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                text: "Bollywood",
                size: 35,
                fontWeight: FontWeight.w600,
                color: appTextColor3,
              ),
              AppText(
                text: "Restaurant",
                size: 25,
                fontWeight: FontWeight.w600,
                color: appTextColor3,
              ),
              Row(
                children: [
                  Icon(Icons.location_on, size: 15, color: appTextColor3),
                  const SizedBox(width: 5),
                  AppText(
                    text: "Ulitsa Serpukhovskiy Val-14",
                    size: 15,
                    fontWeight: FontWeight.w400,
                    color: appTextColor3,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 40),
          Column(
            children: [
              AppText(
                text: "Overall Rating",
                size: 16,
                fontWeight: FontWeight.w500,
                color: appTextColor2,
              ),
              SizedBox(height: 10),
              AppText(
                text: "4.8",
                size: 50,
                fontWeight: FontWeight.w500,
                color: appTextColor2,
              ),
              SizedBox(height: 10),
              Wrap(
                children: List.generate(
                  5,
                  (index) => Icon(
                    Icons.star,
                    color: index < 3 ? Colors.amber : Colors.grey,
                    size: 40,
                  ),
                ),
              ),
              SizedBox(height: 10),
              AppText(
                text: "Based on 35 reviews",
                size: 15,
                fontWeight: FontWeight.w400,
                color: appTextColor2,
              ),
              SizedBox(height: 40),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 5,
                itemBuilder: (context, index) => RatingCard(),
              )
            ],
          ),
        ],
      ),
    );
  }
}
