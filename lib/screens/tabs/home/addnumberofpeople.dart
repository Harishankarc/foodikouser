
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fudikoclient/components/appbutton.dart';
import 'package:fudikoclient/components/apptext.dart';
import 'package:fudikoclient/utils/constants.dart';

class NumberOfPeopleModal extends StatefulWidget {
  final VoidCallback? bookingOnClick;
  const NumberOfPeopleModal({super.key, this.bookingOnClick});

  @override
  State<NumberOfPeopleModal> createState() => _NumberOfPeopleModalState();
}

class _NumberOfPeopleModalState extends State<NumberOfPeopleModal> {
  int? selectedDiscountIndex = 0;
  int? selectedTypeIndex = 0;
  bool isBookingClicked = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40.w,
              height: 5.h,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            SizedBox(height: 16.h),

            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              padding:  EdgeInsets.all(16.w),
              child: !isBookingClicked ? _addNoOfPeople() : _confirmBox(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _confirmBox() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/checked.png',
                height: 50.h,
                width: 50.w,
                fit: BoxFit.contain,
              ),
              SizedBox(height: 20.h),
              AppText(text: "Booking Successful!", size: 25, fontWeight: FontWeight.w500,color: appTextColor3,),
              SizedBox(height: 20.h),
              AppText(text: "You have received a coupon for a 40% discount on the entire menu for today at 2:00 PM", size: 12, fontWeight: FontWeight.w400,color: appTextColor2,isCentered: true,lineSpacing: 1.2,),

            ],
          ),
        ),
        SizedBox(height: 20.h),
      ],
    );
  }

  Widget _addNoOfPeople() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Icon(Icons.close, color: appTextColor, size: 25))],
        ),
        SizedBox(height: 10.h),
        SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText(
                text: "Number of People",
                size: 15,
                fontWeight: FontWeight.w500,
                color: appTextColor2,
                isCentered: true,
              ),
              SizedBox(height: 20.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 50.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(20),
                        bottomLeft: Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[300]!,
                          blurRadius: 2,
                          spreadRadius: 1,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Center(
                      child: AppText(
                        text: "-",
                        size: 30.sp,
                        fontWeight: FontWeight.bold,
                        color: appTextColor2,
                      ),
                    ),
                  ),
                  Container(
                    width: 100.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[300]!,
                          blurRadius: 2,
                          spreadRadius: 1,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Center(
                      child: AppText(
                        text: "5",
                        size: 30.sp,
                        fontWeight: FontWeight.bold,
                        color: appTextColor2,
                      ),
                    ),
                  ),
                  Container(
                    width: 50.w,
                    height: 50.h,
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey[300]!,
                          blurRadius: 2,
                          spreadRadius: 1,
                          offset: Offset(0, 1),
                        ),
                      ],
                    ),
                    child: Center(
                      child: AppText(
                        text: "+",
                        size: 30.sp,
                        fontWeight: FontWeight.bold,
                        color: appTextColor2,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20.h),
              SizedBox(
                width: 200.w,
                height: 50.h,
                child: AppButton(
                  text: "Book",
                  onPressed: () {
                    setState(() {
                      isBookingClicked = !isBookingClicked;
                    });
                  },
                  borderRadius: 10.r,
                  size: 15,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
