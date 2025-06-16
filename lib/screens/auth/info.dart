import 'package:flutter/material.dart';
import 'package:fudikoclient/components/appbutton.dart';
import 'package:fudikoclient/components/appdropdown.dart';
import 'package:fudikoclient/components/apptextfeild.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: 60), // Optional top spacing
                    ClipOval(
                      child: Image.asset(
                        'assets/images/avatar.png',
                        width: 150,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(height: 20),
                    AppTextFeild(text: "Contact Number",icon: Icons.phone,),
                    SizedBox(height: 20),
                    AppTextFeild(text: "Location",icon: Icons.location_on,),
                    SizedBox(height: 40),
                    AppButton(
                      text: 'Continue',
                      onPressed: () {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => InfoPage2()),
                        // );
                      },
                    ),
                    SizedBox(height: 60), // Optional bottom spacing
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
