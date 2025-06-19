import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:fudikoclient/components/appbutton.dart';
import 'package:fudikoclient/components/apptext.dart';
import 'package:fudikoclient/utils/constants.dart';

class QrCoupon extends StatelessWidget {
  const QrCoupon({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appSecondaryBackgroundColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height  - 150,
              ),
              child: IntrinsicHeight(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(onTap: (){
                          Navigator.pop(context);
                        },child: Icon(Icons.close, color: appTextColor, size: 30)),
                      ],
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppText(
                            text: "Empire Restaurant",
                            size: 25,
                            fontWeight: FontWeight.w600,
                            color: appTextColor3,
                          ),
                          Stack(
                            children: [
                              Image.asset(
                                "assets/images/couponbody.png",
                                height: 500,
                                width: 300,
                                fit: BoxFit.contain,
                              ),
                              Positioned(
                                top: 80,
                                left: 45,
                                child: Image.asset(
                                  'assets/images/qrcode.png',
                                  height: 200,
                                  width: 200,
                                ),
                              ),
                              Positioned(
                                bottom: 100,
                                left: 95,
                                child: Column(
                                  children: [
                                    AppText(text: "APR 2", size: 16, fontWeight: FontWeight.w400,color: appTextColor3,),
                                    SizedBox(height: 10,),
                                    SizedBox(width: 100,height: 40,child: AppButton(text: "02:30PM", onPressed: (){},size: 15,))
                                  ],
                                ),
                              )
                            ],
                          ),
                          AppText(text: "35% offer for entire menu ", size: 20, fontWeight: FontWeight.w700,color: appTextColor2,),
                          SizedBox(height: 10,),
                          AppText(text: "2 Person  ", size: 20, fontWeight: FontWeight.w700,color: appTextColor2,)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
