import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:fudikoclient/components/appbutton.dart';
import 'package:fudikoclient/components/apptext.dart';
import 'package:fudikoclient/utils/constants.dart';

class TimeBottomModal extends StatefulWidget {
  const TimeBottomModal({super.key});

  @override
  State<TimeBottomModal> createState() => _TimeBottomModalState();
}

class _TimeBottomModalState extends State<TimeBottomModal> {
  int? selectedDiscountIndex = 0;
  int? selectedTypeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 40,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(height: 16),

          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(Icons.tune, size: 20, color: Colors.black),
                    SizedBox(width: 10),
                    AppText(
                      text: "Filter",
                      size: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ],
                ),

                SizedBox(
                  height: 250,
                  child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.dateAndTime,
                    initialDateTime: DateTime.now(),
                    use24hFormat: false,
                    onDateTimeChanged: (DateTime newDateTime) {
                      // Handle date & time change
                    },
                  ),
                ),

                SizedBox(height: 50),
                SizedBox(
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText(
                        text: "Clear all",
                        size: 12,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        isCentered: true,
                      ),
                      SizedBox(height: 20),
                      SizedBox(
                        width: 150,
                        child: AppButton(text: "Apply", onPressed: () {}),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
