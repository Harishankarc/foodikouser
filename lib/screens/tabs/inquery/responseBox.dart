import 'package:flutter/material.dart';
import 'package:fudikoclient/components/appbutton.dart';
import 'package:fudikoclient/components/apptext.dart';
import 'package:fudikoclient/utils/constants.dart';

class ResponseBox extends StatelessWidget {
  final VoidCallback onCancelTap;
  final VoidCallback onAcceptTap;
  final VoidCallback viewRequestClick;
  const ResponseBox({super.key, required this.onCancelTap, required this.onAcceptTap, required this.viewRequestClick});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: GestureDetector(
        onTap: () {

        },
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppText(
                            text: "P17854",
                            size: 20,
                            fontWeight: FontWeight.bold,
                            color: appTextColor3,
                          ),

                          const SizedBox(height: 10),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.restaurant,
                                color: appTextColor5,
                                size: 18,
                              ),
                              const SizedBox(width: 5),
                              Flexible(
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'Bollywood Restaurant',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          color: appLinkColor2,
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.wallet,
                                color: appTextColor5,
                                size: 18,
                              ),
                              const SizedBox(width: 5),
                              Flexible(
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: '950 ',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          color: appTextColor5,
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'Per Person',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: appTextColor5,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.discount,
                                color: appTextColor5,
                                size: 18,
                              ),
                              const SizedBox(width: 5),
                              Expanded(
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text:"5% on extra drinks",
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w500,
                                          color: appTextColor5,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.message,
                                color: appTextColor5,
                                size: 18,
                              ),
                              const SizedBox(width: 5),
                              Flexible(
                                child: RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: 'If you have more than 50 people, we can offer you a price of 850 per head.',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        AppText(
                          text: "Apr 11",
                          size: 10,
                          fontWeight: FontWeight.w600,
                          color: appTextColor3,
                        ),
                        const SizedBox(height: 5),
                        AppText(
                          text: "12:30pm",
                          size: 10,
                          fontWeight: FontWeight.w600,
                          color: appTextColor3,
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: viewRequestClick,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(Icons.manage_search_sharp, size: 12, color: appLinkColor2),
                          SizedBox(width: 5),
                          AppText(
                            text: "View Request",
                            size: 11,
                            fontWeight: FontWeight.w400,
                            color: appLinkColor2,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 20),
                    Column(
                      children: [
                        SizedBox(
                          width: 100,
                          height: 30,
                          child: AppButton(
                            text: "Decline",
                            onPressed: onCancelTap,
                            size: 11,
                            borderRadius: 10,
                            bgColor1: Colors.red,
                            bgColor2: Colors.red,
                          ),
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          width: 100,
                          height: 30,
                          child: AppButton(
                            text: "Accept",
                            onPressed: onAcceptTap,
                            size: 11,
                            borderRadius: 10,
                            bgColor1: Colors.green,
                            bgColor2: Colors.green,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
