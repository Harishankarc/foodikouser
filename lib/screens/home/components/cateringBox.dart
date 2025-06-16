import 'package:flutter/material.dart';
import 'package:fudikoclient/components/apptext.dart';

class CateringBox extends StatelessWidget {
  const CateringBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          colors: [Colors.green, Colors.lightGreen],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/boxbg.png',
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),

          Positioned(
            bottom: 0,
            right: 20,
            child: Image.asset(
              'assets/images/boxbg3.png',
              width: 120,
              height: 120,
              fit: BoxFit.contain,
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppText(
                  text: "Catering",
                  size: 30,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                  isShadow: true,
                ),
                const SizedBox(height: 8),
                AppText(
                  text: "Book your functions with",
                  size: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
                const SizedBox(height: 4),
                AppText(
                  text: "exclusive discounts and avail",
                  size: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
                const SizedBox(height: 4),
                AppText(
                  text: "best Services in Less Price!",
                  size: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
                const SizedBox(height: 4),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
