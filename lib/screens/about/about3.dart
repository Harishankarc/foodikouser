import 'package:flutter/material.dart';
import 'package:fudikoclient/components/apptext.dart';
import 'package:fudikoclient/utils/constants.dart';

class About3 extends StatelessWidget {
  final VoidCallback? onPress;
  const About3({super.key,this.onPress});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        child: Stack(
          children: [
            Stack(
              children: [
                Positioned(
                  top: -120,
                  left: -120,
                  child: Container(
                    width: 350,
                    height: 350,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.grey.shade300,
                        width: 30,
                      ),
                    ),
                    clipBehavior: Clip.hardEdge,
                  ),
                ),
                Positioned(
                  top: -110,
                  left: -80,
                  child: Image.asset(
                    'assets/images/pizza3.png',
                    width: 350,
                    height: 350,
                  ),
                ),
              ],
            ),
            Positioned(
              top: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 40,
                ),
                child: GestureDetector(
                  onTap: onPress,
                  child: AppText(
                    text: "Next",
                    size: 15,
                    fontWeight: FontWeight.w400,
                    color: appTextColor,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppText(
                    text: "Catering That Fits",
                    size: 35,
                    fontWeight: FontWeight.w700,
                    color: appTextColor6,
                  ),
                  AppText(
                    text: "Your Budget!",
                    size: 35,
                    fontWeight: FontWeight.w700,
                    color: appTextColor6,
                  ),
                  SizedBox(height: 20),
                  AppText(
                    text: "From home parties to big",
                    size: 20,
                    fontWeight: FontWeight.w400,
                    color: appButtonColor2,
                  ),
                  AppText(
                    text: "events—get the best food",
                    size: 20,
                    fontWeight: FontWeight.w400,
                    color: appButtonColor2,
                  ),
                  AppText(
                    text: "delivered",
                    size: 20,
                    fontWeight: FontWeight.w400,
                    color: appButtonColor2,
                  ),
                ],
              ),
            ),
            Positioned(
              top: 100,
              right: -50,
              child: Container(
                width: 150,
                height: 150,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Color.fromARGB(112, 249, 123, 13),
                    width: 20,
                  ),
                ),
                clipBehavior: Clip.hardEdge,
              ),
            ),
            Positioned(
              bottom: -50,
              right: -50,
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Color.fromARGB(112, 249, 123, 13),
                    width: 20,
                  ),
                ),
                clipBehavior: Clip.hardEdge,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
