import 'package:flutter/material.dart';
import 'package:fudikoclient/screens/tabs/mainnav.dart';
import 'package:fudikoclient/utils/constants.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: appTextColor),
        fontFamily: 'Inter',
      ),
      home: MainNavPage(),
    );
  }
}
