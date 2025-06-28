import 'package:flutter/material.dart';
import 'package:fudikoclient/components/appbutton.dart';
import 'package:fudikoclient/components/apptext.dart';
import 'package:fudikoclient/components/apptextfeild.dart';
import 'package:fudikoclient/components/descriptionBox.dart';
import 'package:fudikoclient/screens/tabs/inquery/locationselect.dart';
import 'package:fudikoclient/utils/constants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CtInquery extends StatefulWidget {
  final VoidCallback onReviewTap;
  final VoidCallback viewEnquiryOnTap;
  const CtInquery({super.key,required this.onReviewTap,required this.viewEnquiryOnTap});

  @override
  State<CtInquery> createState() => _CtInqueryState();
}

class _CtInqueryState extends State<CtInquery> {
  bool isReviewOnClick = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding:  EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Stack(
        children: [
          Column(
            children: [
              GestureDetector(
                onTap: widget.viewEnquiryOnTap,
                child: Row(
                  children: [
                    Icon(
                      Icons.content_paste_search_sharp,
                      size: 20.w,
                      color: appLinkColor2,
                    ),
                    SizedBox(width: 5.w),
                    AppText(
                      text: "View Enquiries",
                      size: 15,
                      fontWeight: FontWeight.w400,
                      color: appLinkColor2,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              DescriptionTextArea(
                hintText:
                    "Example: Chicken Biriyani , Porotta ,Rotti  , Payasam, Butter Chicken , Ice cream,.Salad",
                topHintText: "Your Menu",
                iconColor: appTextColor2,
                icon: Icons.dashboard,
                maxLength: 300,
              ),
              SizedBox(height: 20.h),
              AppTextFeild(
                text: "Other Services",
                icon: Icons.handshake,
                iconColor: appTextColor2,
              ),
              SizedBox(height: 20.h),
              AppTextFeild(
                text: "Number of  People",
                icon: Icons.people,
                iconColor: appTextColor2,
              ),
              SizedBox(height: 20.h),
              GestureDetector(
                onTap: () => _selectDateTime(context),
                child: AppTextFeild(
                  text: "Date & Time",
                  icon: Icons.calendar_today_sharp,
                  iconColor: appTextColor2,
                ),
              ),
              SizedBox(height: 20.h),
              AppTextFeild(
                text: "Expected amount per person",
                icon: Icons.wallet,
                iconColor: appTextColor2,
              ),
              SizedBox(height: 20.h),
              GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LocationSelect()),
                ),
                child: Container(
                  padding:  EdgeInsets.all(16.w),
                  decoration: BoxDecoration(
                    color: const Color(0xFF798FFF),
                    borderRadius: BorderRadius.circular(10.r),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 10,
                        offset: Offset(0, 4.w),
                      ),
                    ],
                  ),
                  child: Center(
                    child: AppText(
                      text: "Moscow City - 20km Radius",
                      size: 15,
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40.h),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 4.0, bottom: 4.h),
                    child: Text(
                      'Enquiry valid for',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  Container(
                    padding:  EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 12.h,
                    ),
                    decoration: BoxDecoration(
                      color: appSecondaryBackgroundColor,
                      borderRadius: BorderRadius.circular(15.r),
                      border: Border.all(color: Colors.black54),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _IconTextButton(
                          icon: Icons.calendar_today,
                          label: 'Date',
                          onTap: () => showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2020),
                            lastDate: DateTime(2101),
                          ),
                        ),
                        _IconTextButton(
                          icon: Icons.access_time,
                          label: 'Time',
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              SizedBox(
                width: 150.w,
                height: 50.h,
                child: AppButton(
                  text: "Review",
                  onPressed: widget.onReviewTap,
                  size: 15,
                  borderRadius: 10,
                  bgColor1: Colors.green,
                  bgColor2: Colors.green,
                ),
              ),
              SizedBox(height: 30.h),
            ],
          ),

        ],
      ),
    );
  }
}

class _IconTextButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _IconTextButton({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16.r),
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, size: 20.w, color: Colors.black),
          SizedBox(width: 8.w),
          Text(
            label,
            style: TextStyle(
              fontSize: 12.sp,
              color: appTextColor2,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}


Future<void> _selectDateTime(BuildContext context) async {
  final DateTime? pickedDate = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2020),
    lastDate: DateTime(2101),
  );

  if (pickedDate != null) {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      // Combine date & time
      DateTime fullDateTime = DateTime(
        pickedDate.year,
        pickedDate.month,
        pickedDate.day,
        pickedTime.hour,
        pickedTime.minute,
      );
    }
  }
}
