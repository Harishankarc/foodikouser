import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fudikoclient/components/appbutton.dart';
import 'package:fudikoclient/components/apptext.dart';
import 'package:fudikoclient/components/apptextfeild.dart';
import 'package:fudikoclient/utils/constants.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 30.w, right: 30.w),
        child: Stack(
          children: [
            Positioned(
              top: 40.h,
              child: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.arrow_back_ios_outlined,
                      size: 30.r,
                      color: appTextColor3,
                    ),
                  ],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,

              children: [
                AppText(
                  text: "Set your new password",
                  size: 15,
                  fontWeight: FontWeight.w400,
                  color: appTextColor2,
                ),

                SizedBox(height: 40.h),
                AppTextFeild(text: "Current Password", icon: Icons.lock),
                SizedBox(height: 20.h),
                AppTextFeild(text: "New Password", icon: Icons.lock),
                SizedBox(height: 20.h),
                AppTextFeild(text: "Confirm Password", icon: Icons.lock),
                SizedBox(height: 60.h),
                AppButton(text: 'Update', onPressed: () {}),
                SizedBox(height: 20.h),
                AppText(
                  text: "Forgot Password?",
                  size: 14,
                  fontWeight: FontWeight.w400,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
