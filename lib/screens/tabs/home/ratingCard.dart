import 'package:flutter/material.dart';
import 'package:fudikoclient/components/apptext.dart';
import 'package:fudikoclient/utils/constants.dart';

class RatingCard extends StatelessWidget {
  const RatingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: Offset(0, 4),
            ),
          ]
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/images/avatar.png',
                  width: 40,
                  height: 40,
                  fit: BoxFit.cover,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppText(text: "Alexander Thompson", size: 15, fontWeight: FontWeight.w600,color: Colors.black,),
                    SizedBox(height: 5,),
                    Wrap(
                      children: List.generate(
                        5,
                        (index) => Icon(
                          Icons.star,
                          color: index < 3 ? Colors.amber : Colors.grey,
                          size: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                AppText(text: "3 minutes ago", size: 12, fontWeight: FontWeight.w400,color: appTextColor2,),
              ],
            ),
            SizedBox(height: 20,),
            SizedBox(
              width: double.infinity,
              child: AppText(text: "Outstanding experience! The food was excellent and the staff went above and beyond to assist. Will definitely order again.", size: 13, fontWeight: FontWeight.w400,color: appTextColor2,lineSpacing: 1.5,),
            )
          ],
        ),
      ),
    );
  }
}