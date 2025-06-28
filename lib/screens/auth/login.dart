import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fudikoclient/components/appbutton.dart';
import 'package:fudikoclient/components/apptext.dart';
import 'package:fudikoclient/components/apptextfeild.dart';
import 'package:fudikoclient/screens/auth/register.dart';
import 'package:fudikoclient/utils/constants.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Center(
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 30.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/logofudikoo.png',
                    width: 250.w,
                    fit: BoxFit.contain,
                  ),
                  AppText(
                    text: "PARTNER APP",
                    size: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(height: 60.h),
                  AppTextFeild(text: "Username", icon: Icons.person),
                  SizedBox(height: 20.h),
                  AppTextFeild(
                    text: "Password",
                    icon: Icons.lock,
                    isObscure: true,
                  ),
                  SizedBox(height: 20.h),
                  AppButton(text: 'Login', onPressed: () {}),
                  SizedBox(height: 20.h),
                  AppText(
                    text: "Forget Password?",
                    size: 15,
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(height: 40.h),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(thickness: 1, color: appTextColor),
                      ),
                      SizedBox(width: 10.w),
                      AppText(
                        text: "or login with",
                        size: 15,
                        fontWeight: FontWeight.w400,
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Divider(thickness: 1, color: appTextColor),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/google.png',
                        width: 50.w,
                        height: 50.h,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                  SizedBox(height: 40.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText(
                        text: "Don't have an Account?  ",
                        size: 15,
                        fontWeight: FontWeight.normal,
                        color: appTextColor2,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const Register()));
                        },
                        child: AppText(
                          text: "Sign Up",
                          size: 15,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
