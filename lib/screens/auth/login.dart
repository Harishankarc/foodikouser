import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fudikoclient/components/appbutton.dart';
import 'package:fudikoclient/components/apptext.dart';
import 'package:fudikoclient/components/apptextfeild.dart';
import 'package:fudikoclient/model/auth/login-model.dart';
import 'package:fudikoclient/screens/auth/register.dart';
import 'package:fudikoclient/screens/home/homepage.dart';
import 'package:fudikoclient/service/auth/login-service.dart';
import 'package:fudikoclient/utils/constants.dart';
import 'package:fudikoclient/utils/tokens.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  LoginAuthService loginService = LoginAuthService();
  bool isLoading = false;

  @override
  void dispose() {
   _email.dispose();
    _password.dispose();
    super.dispose();
  }

  Future<void> loginUser() async {
    setState(() {
      isLoading = true;
    });
    final email = _email.text.trim();
    final password = _password.text.trim();

    if (email.isEmpty || password.isEmpty) {
      if (!mounted) return;
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill out all fields')),
      );
      return;
    }

    if (password.length < 6) {
      if (!mounted) return;
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Password must be at least 6 characters long'),
        ),
      );
      return;
    }

    final user = UserLoginModel(username: email, password: password);

    LoginResponseModel response = await loginService.loginUser(user);

    if (!mounted) return;
    setState(() {
      isLoading = false;
    });
    if (response.status) {
      await saveToken(response.token!);
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
      print(response.token);
    } else {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(response.message)));
    }
  }


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
                  AppButton(text: 'Login', onPressed: () {
                    loginUser();
                  }),
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
