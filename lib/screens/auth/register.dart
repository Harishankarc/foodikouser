import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fudikoclient/components/appbutton.dart';
import 'package:fudikoclient/components/apptext.dart';
import 'package:fudikoclient/components/apptextfeild.dart';
import 'package:fudikoclient/screens/auth/info.dart';
import 'package:fudikoclient/screens/auth/login.dart';
import 'package:fudikoclient/utils/constants.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/images/logofudikoo.png',
                  width: 250.w,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 60.h),
                AppTextFeild(text: "Username", icon: Icons.person),
                SizedBox(height: 20.h),
                AppTextFeild(text: "Email", icon: Icons.mail),
                SizedBox(height: 20.h),
                AppTextFeild(
                  text: "Password",
                  icon: Icons.lock,
                  isObscure: true,
                ),
                SizedBox(height: 20.h),
                AppTextFeild(
                  text: "Confirm Password",
                  icon: Icons.lock,
                  isObscure: false,
                ),
                SizedBox(height: 20.h),
                AppButton(text: 'Register', onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const InfoPage()));
                }),
                SizedBox(height: 40.h),
                Row(
                  children: [
                    Expanded(child: Divider(color: appTextColor, thickness: 1)),
                    SizedBox(width: 10.w),
                    AppText(
                      text: "or login with",
                      size: 15,
                      fontWeight: FontWeight.w400,
                    ),
                    SizedBox(width: 10.w),
                    Expanded(child: Divider(color: appTextColor, thickness: 1)),
                  ],
                ),
                SizedBox(height: 20.h),
                Image.asset(
                  'assets/images/google.png',
                  width: 50.w,
                  height: 50.h,
                  fit: BoxFit.contain,
                ),
                SizedBox(height: 40.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText(
                      text: "Already have an Account?  ",
                      size: 15,
                      fontWeight: FontWeight.normal,
                      color: appTextColor2,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const Login()));
                      },
                      child: AppText(
                      text: "Sign In",
                      size: 15,
                      fontWeight: FontWeight.normal,
                    ),
                    )
                  ],
                ),
                SizedBox(height: 20.h),
              ],
            ),
          ),
        ),
    );
  }
}
