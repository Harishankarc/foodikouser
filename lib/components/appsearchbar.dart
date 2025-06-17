import 'package:flutter/material.dart';
import 'package:fudikoclient/components/apptext.dart';
import 'package:fudikoclient/utils/constants.dart';

class AppSearchBar extends StatelessWidget {
  const AppSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.arrow_back_rounded, size: 30, color: appTextColor3),

          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              AppText(
                text: "City",
                size: 12,
                fontWeight: FontWeight.w500,
                color: appTextColor3,
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Icon(Icons.location_on, size: 16, color: appTextColor3),
                  const SizedBox(width: 4),
                  AppText(
                    text: "Moscow Center",
                    size: 12,
                    fontWeight: FontWeight.w600,
                    color: appTextColor3,
                  ),
                ],
              ),
            ],
          ),

          Icon(Icons.search_rounded, size: 30, color: appTextColor3),
        ],
      ),
    );
  }
}
