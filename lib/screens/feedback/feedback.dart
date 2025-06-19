import 'package:flutter/material.dart';
import 'package:fudikoclient/components/appbutton.dart';
import 'package:fudikoclient/components/apptext.dart';
import 'package:fudikoclient/components/descriptionBox.dart';
import 'package:fudikoclient/utils/constants.dart';

class FeedBack extends StatefulWidget {
  const FeedBack({super.key});

  @override
  State<FeedBack> createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  bool isSubmitClicked = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appSecondaryBackgroundColor,
        body: Stack(
          children: [
            Positioned(
              top: 30,
              left: 30,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios_new,
                  color: appTextColor3,
                  size: 28,
                ),
              ),
            ),

            Positioned.fill(
              child: Center(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/feedback.png',
                        height: 160,
                        width: 160,
                        fit: BoxFit.contain,
                      ),
                      const SizedBox(height: 20),
                      AppText(
                        text: "We Value Your",
                        size: 32,
                        fontWeight: FontWeight.w600,
                        color: appTextColor3,
                      ),
                      const SizedBox(height: 8),
                      AppText(
                        text: "Feedback!",
                        size: 32,
                        fontWeight: FontWeight.w600,
                        color: appTextColor3,
                      ),
                      const SizedBox(height: 20),
                      AppText(
                        text: "How would you rate your experience?",
                        size: 17,
                        fontWeight: FontWeight.w500,
                        color: appTextColor2,
                      ),
                      const SizedBox(height: 20),
                      Wrap(
                        spacing: 10,
                        runSpacing: 20,
                        children: List.generate(5, (index) {
                          return Icon(
                            Icons.star,
                            color: index >= 3 ? appTextColor2 : Colors.amber,
                            size: 40,
                          );
                        }),
                      ),
                      const SizedBox(height: 50),
                      DescriptionTextArea(
                        hintText: "How was your experience?",
                        maxLength: 300,
                        icon: Icons.handshake,
                      ),
                      const SizedBox(height: 50),
                      SizedBox(
                        width: 200,
                        child: AppButton(
                          text: "Submit",
                          onPressed: () {
                            setState(() {
                              isSubmitClicked = !isSubmitClicked;
                            });
                          },
                          size: 17,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (isSubmitClicked) _confirmModal(),
          ],
        ),
      ),
    );
  }

  Widget _confirmModal() {
    return Positioned.fill(
      child: Container(
        color: Colors.black54,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isSubmitClicked = !isSubmitClicked;
                      });
                    },
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Icon(Icons.close, size: 25, color: appTextColor3),
                    ),
                  ),
                  Image.asset(
                    'assets/images/handshake.png',
                    height: 90,
                    width: 90,
                    fit: BoxFit.contain,
                  ),
                  AppText(
                    text: "Thank you for your",
                    size: 22,
                    fontWeight: FontWeight.w600,
                    color: appLinkColor2,
                  ),
                  SizedBox(height: 8),
                  AppText(
                    text: "feedback!",
                    size: 22,
                    fontWeight: FontWeight.w700,
                    color: appLinkColor2,
                  ),
                  SizedBox(height: 15),
                  AppText(
                    text: "We appreciate your input and",
                    size: 17,
                    fontWeight: FontWeight.w400,
                    color: appTextColor2,
                  ),
                  SizedBox(height: 4),
                  AppText(
                    text: "will use it to improve.",
                    size: 17,
                    fontWeight: FontWeight.w400,
                    color: appTextColor2,
                  ),
                  SizedBox(height: 35),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
