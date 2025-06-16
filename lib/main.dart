import 'package:flutter/material.dart';
import 'package:fudikoclient/screens/about/about1.dart';
import 'package:fudikoclient/screens/about/about2.dart';
import 'package:fudikoclient/screens/about/about3.dart';
import 'package:fudikoclient/screens/about/aboutLayout.dart';
import 'package:fudikoclient/screens/auth/info.dart';
import 'package:fudikoclient/screens/auth/login.dart';
import 'package:fudikoclient/screens/auth/otp.dart';
import 'package:fudikoclient/screens/auth/register.dart';
import 'package:fudikoclient/screens/home/homepage.dart';
import 'package:fudikoclient/screens/splashscreen/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fudiko Client',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        fontFamily: 'Inter',
      ),
      home: HomePage(),
    );
  }
}
