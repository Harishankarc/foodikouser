import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fudikoclient/components/appbutton.dart';
import 'package:fudikoclient/components/apptextfeild.dart';
import 'package:fudikoclient/screens/auth/otp.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 60.h),
                    ClipOval(
                      child: Image.asset(
                        'assets/images/avatar.png',
                        width: 150.w,
                        height: 150.h,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    AppTextFeild(text: "Contact Number",icon: Icons.phone,),
                    SizedBox(height: 20.h),
                    AppTextFeild(text: "Location",icon: Icons.location_on,),
                    SizedBox(height: 40.h),
                    AppButton(
                      text: 'Continue',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Otp()),
                        );
                      },
                    ),
                    SizedBox(height: 60.h),
                  ],
                ),
              );
        },
      ),
    );
  }
}
