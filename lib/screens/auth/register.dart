import 'package:flutter/material.dart';
import 'package:fudikoclient/components/appbutton.dart';
import 'package:fudikoclient/components/apptext.dart';
import 'package:fudikoclient/components/apptextfeild.dart';
import 'package:fudikoclient/utils/constants.dart';

class Register extends StatelessWidget {
  const Register({super.key});

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
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 80),
                  Image.asset(
                    'assets/images/logofudikoo.png',
                    width: 250,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: 60),
                  AppTextFeild(text: "Username", icon: Icons.person),
                  SizedBox(height: 20),
                  AppTextFeild(text: "Email", icon: Icons.mail),
                  SizedBox(height: 20),
                  AppTextFeild(
                    text: "Password",
                    icon: Icons.lock,
                    isObscure: true,
                  ),
                  SizedBox(height: 20),
                  AppTextFeild(
                    text: "Confirm Password",
                    icon: Icons.lock,
                    isObscure: false,
                  ),
                  SizedBox(height: 20),
                  AppButton(text: 'Register', onPressed: () {}),
                  SizedBox(height: 40),
                  Row(
                    children: [
                      Expanded(
                        child: Divider(color: appTextColor, thickness: 1),
                      ),
                      SizedBox(width: 10),
                      AppText(
                        text: "or login with",
                        size: 15,
                        fontWeight: FontWeight.w400,
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: Divider(color: appTextColor, thickness: 1),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/images/google.png',
                        width: 50,
                        height: 50,
                        fit: BoxFit.contain,
                      ),
                    ],
                  ),
                  SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText(
                        text: "Already have an Account?  ",
                        size: 15,
                        fontWeight: FontWeight.normal,
                        color: appTextColor2,
                      ),
                      AppText(
                        text: "Sign In",
                        size: 15,
                        fontWeight: FontWeight.normal,
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
