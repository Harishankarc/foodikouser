import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fudikoclient/components/appbutton.dart';
import 'package:fudikoclient/components/apptext.dart';
import 'package:fudikoclient/components/apptextfeild.dart';
import 'package:fudikoclient/components/descriptionBox.dart';
import 'package:fudikoclient/screens/tabs/inquery/ctInquery/ctInquery.dart';
import 'package:fudikoclient/screens/tabs/inquery/ctInquery/ctInqueryBox.dart';
import 'package:fudikoclient/screens/tabs/inquery/ctInquery/ctdecline.dart';
import 'package:fudikoclient/screens/tabs/inquery/ctInquery/ctresponseBox.dart';
import 'package:fudikoclient/screens/tabs/inquery/declineBox.dart';
import 'package:fudikoclient/screens/tabs/inquery/inqueryBox.dart';
import 'package:fudikoclient/screens/tabs/inquery/locationselect.dart';
import 'package:fudikoclient/components/appfilterdropdown.dart';
import 'package:fudikoclient/screens/tabs/inquery/responseBox.dart';
import 'package:fudikoclient/screens/tabs/mainnav.dart';
import 'package:fudikoclient/utils/constants.dart';

class Inquery extends StatefulWidget {
  const Inquery({super.key});

  @override
  State<Inquery> createState() => _InqueryState();
}

class _InqueryState extends State<Inquery> {
  String selectedStatus = 'Plan a Party';
  DateTime selectedDateTime = DateTime.now();
  bool isReviewOnClick = false;
  bool isCtReviewOnClick = false;
  bool isWithdrawOnClick = false;
  bool viewEnquiryOnClick = false;
  bool viewCtEnquiryOnClick = false;
  bool isResponseAcceptOnClick = false;
  bool viewRequest = false;
  bool viewCtRequest = false;
  bool isResponseAcceptConfirmOnClick = false;
  bool isConfirmClicked = false;
  bool viewDeclineOnClick = false;
  bool viewCtDeclineOnClick = false;
  bool isSearchOnClick = false;
  bool isCtSearchOnClick = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appSecondaryBackgroundColor,
      body: Stack(
        children: [
          if (viewEnquiryOnClick)
            _viewEnquiryWidget()
          else if(viewCtEnquiryOnClick)
            _viewCtEnquiryWidget()
          else if (viewDeclineOnClick)
            _viewDeclineWidget()
          else if (viewCtDeclineOnClick)
            _viewCtDeclineWidget()
          else if (isSearchOnClick)
            _viewSearchWidget()
          else if (isCtSearchOnClick)
            _viewCtSearchWidget()
          else
            Column(
              children: [
                Padding(
                  padding:  EdgeInsets.all(20.w),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              buildStatusButton("Plan a Party"),
                              SizedBox(width: 10.w),
                              buildStatusButton("Book a Catering"),
                            ],
                          ),
                          SizedBox(height: 10.h,),
                          Row(
                            children: [
                              buildStatusButton("Party Response"),
                              SizedBox(width: 10.w),
                              buildStatusButton("Catering Response"),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: selectedStatus == "Plan a Party"
                      ? _planPartyWidget()
                      : selectedStatus == "Party Response"
                      ? _responseWidget()
                      : selectedStatus == "Book a Catering"
                      ? CtInquery(
                        onReviewTap: (){
                          setState(() {
                            isCtReviewOnClick = !isCtReviewOnClick;
                          });
                        },
                        viewEnquiryOnTap:(){
                          setState(() {
                            viewCtEnquiryOnClick = !viewCtEnquiryOnClick;
                          });
                        }
                      ) : _ctResponseWidget()
                ),
              ],
            ),
          if (isWithdrawOnClick) _cancelBox(),
          if (isResponseAcceptOnClick) _responseAcceptBox(),
          if (viewRequest) _viewRequestWidget(),
          if (viewCtRequest) _viewCtRequestWidget(),
          if (isResponseAcceptConfirmOnClick) _responseAcceptConfirmBox(),
          if (isReviewOnClick) _reviewBox(),
          if(isCtReviewOnClick) _ctReviewBox()
        ],
      ),
    );
  }


  Widget _viewCtSearchWidget(){
    return Stack(
      children: [
        Column(
          children: [
            Padding(
              padding:  EdgeInsets.only(left: 30.w, right: 30.w, top: 30.h),
              child: AppTextFeild(
                text: "Enter the Coupon Number",
                textColor: appTextColor3,
                icon: Icons.close,
                iconColor: appTextColor3,
                iconOnTap: () {
                  setState(() {
                    isCtSearchOnClick = !isCtSearchOnClick;
                  });
                },
              ),
            ),

            SizedBox(height: 20.h),
            SizedBox(
              width: 180.w,
              child: AppFilterDropDown(
                hint: "Today",
                toggleDropdown: () {
                  showModalBottomSheet(
                    backgroundColor: Colors.white,
                    context: context,
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(25),
                      ),
                    ),
                    builder: (context) {
                      return Padding(
                        padding: EdgeInsets.all(30.w),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 40.w,
                              height: 5.h,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                            ),
                            SizedBox(height: 16.h),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              padding: EdgeInsets.all(16.w),
                              child: Column(
                                children: [
                                  Divider(color: Colors.grey[200]),
                                  SizedBox(height: 10.h),
                                  AppText(
                                    text: "item1",
                                    size: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                  SizedBox(height: 10.h),
                                  Divider(color: Colors.grey[200]),
                                  SizedBox(height: 10.h),
                                  AppText(
                                    text: "item2",
                                    size: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                  SizedBox(height: 10.h),
                                  Divider(color: Colors.grey[200]),
                                  SizedBox(height: 10.h),
                                  AppText(
                                    text: "item3",
                                    size: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                  SizedBox(height: 10.h),
                                  Divider(color: Colors.grey[200]),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                icon: Icons.tune,
              ),
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:  EdgeInsets.only(left: 30.w, right: 30.w),
                    child: CtResponseBox(
                      viewRequestClick: () {
                        setState(() {
                          viewCtRequest = !viewCtRequest;
                        });
                      },
                      onAcceptTap: () {
                        setState(() {
                          isResponseAcceptOnClick = !isResponseAcceptOnClick;
                        });
                      },
                      onCancelTap: () {
                        setState(() {});
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _viewCtDeclineWidget(){
    return Stack(
      children: [
        Column(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  viewCtDeclineOnClick = !viewCtDeclineOnClick;
                });
              },
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding:  EdgeInsets.only(left: 30.w, right: 30.w, top: 30.h),
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: appTextColor3,
                    size: 28.w,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 180.w,
              child: AppFilterDropDown(
                hint: "Today",
                toggleDropdown: () {
                  showModalBottomSheet(
                    backgroundColor: Colors.white,
                    context: context,
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(25),
                      ),
                    ),
                    builder: (context) {
                      return Padding(
                        padding: EdgeInsets.all(30.w),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 40.w,
                              height: 5.h,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                            ),
                            SizedBox(height: 16.h),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              padding: EdgeInsets.all(16.w),
                              child: Column(
                                children: [
                                  Divider(color: Colors.grey[200]),
                                  SizedBox(height: 10.h),
                                  AppText(
                                    text: "item1",
                                    size: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                  SizedBox(height: 10.h),
                                  Divider(color: Colors.grey[200]),
                                  SizedBox(height: 10.h),
                                  AppText(
                                    text: "item2",
                                    size: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                  SizedBox(height: 10.h),
                                  AppText(
                                    text: "item3",
                                    size: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                  SizedBox(height: 10.h),
                                  Divider(color: Colors.grey[200]),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                icon: Icons.tune,
              ),
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:  EdgeInsets.only(left: 30.w, right: 30.w),
                    child: CtDeclineBox(
                      onCancelTap: () {}
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }


  Widget _viewCtRequestWidget(){
    return Positioned.fill(
      child: Container(
        color: Colors.black54,
        child: Center(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 30.w),
            child: Container(
              width: double.infinity,
              padding:  EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                        text: "Requested party",
                        size: 15,
                        fontWeight: FontWeight.w500,
                        color: appTextColor2,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            viewCtRequest = !viewCtRequest;
                          });
                        },
                        child: Icon(
                          Icons.close,
                          color: appTextColor3,
                          size: 25.w,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: AppText(
                      text: "P17854",
                      size: 20,
                      fontWeight: FontWeight.w700,
                      color: appTextColor3,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.dashboard, size: 20.w, color: appTextColor2),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              text: "Your Menu",
                              size: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 5.h),
                            AppText(
                              text:
                                  "Chicken Biriyani , Porotta, Rotti ,Salad, Payasam, Butter Chicken , Ice cream. ",
                              size: 15,
                              fontWeight: FontWeight.w500,
                              color: appTextColor2,
                              lineSpacing: 1.5,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.handshake, size: 20.w, color: appTextColor2),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              text: "Other Services",
                              size: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 5.h),
                            AppText(
                              text: "7 Service boys needed.",
                              size: 15,
                              fontWeight: FontWeight.w500,
                              color: appTextColor2,
                              lineSpacing: 1.5,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.people, size: 20.w, color: appTextColor2),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              text: "Number of Persons",
                              size: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 5.h),
                            AppText(
                              text: "12 Person ",
                              size: 15,
                              fontWeight: FontWeight.w500,
                              color: appTextColor2,
                              lineSpacing: 1.5,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.calendar_today_sharp,
                        size: 20.w,
                        color: appTextColor2,
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              text: "Date and Time ",
                              size: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 5.h),
                            AppText(
                              text: "April 12 - 2:30 pm",
                              size: 15,
                              fontWeight: FontWeight.w500,
                              color: appTextColor2,
                              lineSpacing: 1.5,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.wallet, size: 20.w, color: appTextColor2),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              text: "Expected amount per person",
                              size: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 5.h),
                            AppText(
                              text: "1000 Per person",
                              size: 15,
                              fontWeight: FontWeight.w500,
                              color: appTextColor2,
                              lineSpacing: 1.5,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.analytics, size: 20.w, color: appTextColor2),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              text: "Enquiry Radius ",
                              size: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 5.h),
                            AppText(
                              text: "Moscow City - 20km Radius",
                              size: 15,
                              fontWeight: FontWeight.w500,
                              color: appTextColor2,
                              lineSpacing: 1.5,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _ctResponseWidget(){
    return Column(
      children: [
        SizedBox(height: 20.h),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 30.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 150.w,
                child: AppFilterDropDown(
                  hint: "Today",
                  icon: Icons.tune,
                  toggleDropdown: () {
                    showModalBottomSheet(
                      backgroundColor: Colors.white,
                      context: context,
                      isScrollControlled: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(25),
                        ),
                      ),
                      builder: (context) {
                        return Padding(
                          padding: EdgeInsets.all(30.w),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                width: 40.w,
                                height: 5.h,
                                decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                              ),
                              SizedBox(height: 16.h),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20.r),
                                ),
                                padding: EdgeInsets.all(16.w),
                                child: Column(
                                  children: [
                                    Divider(color: Colors.grey[200]),
                                    SizedBox(height: 10.h),
                                    AppText(
                                      text: "item1",
                                      size: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                    SizedBox(height: 10.h),
                                    Divider(color: Colors.grey[200]),
                                    SizedBox(height: 10.h),
                                    AppText(
                                      text: "item2",
                                      size: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                    SizedBox(height: 10.h),
                                    Divider(color: Colors.grey[200]),
                                    SizedBox(height: 10.h),
                                    AppText(
                                      text: "item3",
                                      size: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                    SizedBox(height: 10),
                                    Divider(color: Colors.grey[200]),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Icon(Icons.search, size: 17.w, color: Colors.black),
                      SizedBox(width: 2.w),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isCtSearchOnClick = !isCtSearchOnClick;
                          });
                        },
                        child: AppText(
                          text: "Search",
                          size: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5.h),
                  Row(
                    children: [
                      Icon(Icons.book, size: 17.w, color: appLinkColor2),
                      SizedBox(width: 2.w),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            viewCtDeclineOnClick = !viewCtDeclineOnClick;
                          });
                        },
                        child: AppText(
                          text: "View Declined",
                          size: 15,
                          fontWeight: FontWeight.w400,
                          color: appLinkColor2,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 20.h),
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding:  EdgeInsets.symmetric(horizontal: 30.w),
                child: CtResponseBox(
                  viewRequestClick: () {
                    setState(() {
                      viewCtRequest = !viewCtRequest;
                    });
                  },
                  onAcceptTap: () {
                    setState(() {
                      isResponseAcceptOnClick = !isResponseAcceptOnClick;
                    });
                  },
                  onCancelTap: () {
                    setState(() {});
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _viewCtEnquiryWidget(){
    return Stack(
      children: [
        Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding:  EdgeInsets.only(left: 30.w, right: 30.w, top: 30.h),
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: appTextColor3,
                    size: 28.w,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 180.w,
              child: AppFilterDropDown(
                hint: "Today",
                toggleDropdown: () {
                  showModalBottomSheet(
                    backgroundColor: Colors.white,
                    context: context,
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(25),
                      ),
                    ),
                    builder: (context) {
                      return Padding(
                        padding: EdgeInsets.all(30.w),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 40.w,
                              height: 5.h,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                            ),
                            SizedBox(height: 16.h   ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              padding: EdgeInsets.all(16.w),
                              child: Column(
                                children: [
                                  Divider(color: Colors.grey[200]),
                                  SizedBox(height: 10.h),
                                  AppText(
                                    text: "item1",
                                    size: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                  SizedBox(height: 10.h),
                                  Divider(color: Colors.grey[200]),
                                  SizedBox(height: 10.h),
                                  AppText(
                                    text: "item2",
                                    size: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                  SizedBox(height: 10.h),
                                  Divider(color: Colors.grey[200]),
                                  SizedBox(height: 10.h),
                                  AppText(
                                    text: "item3",
                                    size: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                  SizedBox(height: 10),
                                  Divider(color: Colors.grey[200]),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                icon: Icons.tune,
              ),
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:  EdgeInsets.only(left: 30.w, right: 30.w),
                    child: CtInqueryBox(
                      onCancelTap: () {
                        setState(() {
                          isWithdrawOnClick = !isWithdrawOnClick;
                        });
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }


  Widget _ctReviewBox(){
    return Positioned.fill(
      child: Container(
        color: Colors.black54,
        child: Center(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 30.w),
            child: Container(
              width: double.infinity,
              padding:  EdgeInsets.all(30.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                        text: "C17854",
                        size: 20,
                        fontWeight: FontWeight.w700,
                        color: appTextColor3,
                      ),
                      AppText(
                        text: "Edit",
                        size: 15,
                        fontWeight: FontWeight.w700,
                        color: appLinkColor,
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.dashboard, size: 20.w, color: appTextColor2),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              text: "Your Menu",
                              size: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 5.h),
                            AppText(
                              text:
                                  "Chicken Biriyani , Porotta, Rotti ,Salad, Payasam, Butter Chicken , Ice cream. ",
                              size: 15,
                              fontWeight: FontWeight.w500,
                              color: appTextColor2,
                              lineSpacing: 1.5,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.handshake, size: 20.w, color: appTextColor2),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              text: "Other Services",
                              size: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 5.h),
                            AppText(
                              text: "7 Service boys needed.",
                              size: 15,
                              fontWeight: FontWeight.w500,
                              color: appTextColor2,
                              lineSpacing: 1.5,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.people, size: 20.w, color: appTextColor2),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              text: "Number of Persons",
                              size: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 5.h),
                            AppText(
                              text: "200 Person ",
                              size: 15,
                              fontWeight: FontWeight.w500,
                              color: appTextColor2,
                              lineSpacing: 1.5,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.calendar_today_sharp,
                        size: 20.w,
                        color: appTextColor2,
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              text: "Date and Time ",
                              size: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 5.h),
                            AppText(
                              text: "April 12 - 2:30 pm",
                              size: 15,
                              fontWeight: FontWeight.w500,
                              color: appTextColor2,
                              lineSpacing: 1.5,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.wallet, size: 20.w, color: appTextColor2),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              text: "Expected amount per person",
                              size: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 5.h),
                            AppText(
                              text: "450 Per person",
                              size: 15,
                              fontWeight: FontWeight.w500,
                              color: appTextColor2,
                              lineSpacing: 1.5,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.analytics, size: 20.w, color: appTextColor2),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              text: "Enquiry Radius ",
                              size: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 5.h),
                            AppText(
                              text: "Moscow City - 20km Radius",
                              size: 15,
                              fontWeight: FontWeight.w500,
                              color: appTextColor2,
                              lineSpacing: 1.5,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.timer, size: 20.w, color: Colors.red),
                      SizedBox(width: 5.w),
                      AppText(
                        text: "03:00:00",
                        size: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.red,
                      ),
                    ],
                  ),
                  SizedBox(height: 15.h),
                  SizedBox(
                    width: 150.w,
                    height: 50.h,
                    child: AppButton(
                      text: "Send",
                      onPressed: () {
                        setState(() {
                          isCtReviewOnClick = !isCtReviewOnClick;
                        });
                      },
                      size: 15,
                      bgColor1: Colors.green,
                      bgColor2: Colors.green,
                      borderRadius: 10,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _reviewBox() {
    return Positioned.fill(
      child: Container(
        color: Colors.black54,
        child: Center(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 30.w),
            child: Container(
              width: double.infinity,
              padding:  EdgeInsets.all(30.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                        text: "C17854",
                        size: 20,
                        fontWeight: FontWeight.w700,
                        color: appTextColor3,
                      ),
                      AppText(
                        text: "Edit",
                          size: 15,
                        fontWeight: FontWeight.w700,
                        color: appLinkColor,
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.dashboard, size: 20.w, color: appTextColor2),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              text: "Your Menu",
                              size: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 5.h),
                            AppText(
                              text:
                                  "Chicken Biriyani , Porotta, Rotti ,Salad, Payasam, Butter Chicken , Ice cream. ",
                              size: 15,
                              fontWeight: FontWeight.w500,
                              color: appTextColor2,
                              lineSpacing: 1.5,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 20.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.people, size: 20.w, color: appTextColor2),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              text: "Number of Persons",
                              size: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 5.h),
                            AppText(
                              text: "200 Person ",
                              size: 15,
                              fontWeight: FontWeight.w500,
                              color: appTextColor2,
                              lineSpacing: 1.5,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.calendar_today_sharp,
                        size: 20.w,
                        color: appTextColor2,
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              text: "Date and Time ",
                              size: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 5.h),
                            AppText(
                              text: "April 12 - 2:30 pm",
                              size: 15,
                              fontWeight: FontWeight.w500,
                              color: appTextColor2,
                              lineSpacing: 1.5,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.wallet, size: 20.w, color: appTextColor2),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              text: "Expected amount per person",
                              size: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 5.h),
                            AppText(
                              text: "450 Per person",
                              size: 15,
                              fontWeight: FontWeight.w500,
                              color: appTextColor2,
                              lineSpacing: 1.5,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.analytics, size: 20.w, color: appTextColor2),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              text: "Enquiry Radius ",
                              size: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 5.h),
                            AppText(
                              text: "Moscow City - 20km Radius",
                              size: 15,
                              fontWeight: FontWeight.w500,
                              color: appTextColor2,
                              lineSpacing: 1.5,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 30.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.timer, size: 20.w, color: Colors.red),
                      SizedBox(width: 5.w),
                      AppText(
                        text: "03:00:00",
                        size: 15,
                        fontWeight: FontWeight.w500,
                        color: Colors.red,
                      ),
                    ],
                  ),
                  SizedBox(height: 15.h),
                  SizedBox(
                    width: 150.w,
                    height: 50.h,
                    child: AppButton(
                      text: "Send",
                      onPressed: () {
                        setState(() {
                          isReviewOnClick = !isReviewOnClick;
                        });
                      },
                      size: 15,
                      bgColor1: Colors.green,
                      bgColor2: Colors.green,
                      borderRadius: 10,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _responseAcceptConfirmBox() {
    return Positioned.fill(
      child: Container(
        color: Colors.black54,
        child: Center(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 30.w),
            child: Container(
              width: double.infinity,
              padding:  EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isResponseAcceptConfirmOnClick =
                                !isResponseAcceptConfirmOnClick;
                            if (isConfirmClicked) {
                              isConfirmClicked = !isConfirmClicked;
                            }
                          });
                        },
                        child: Icon(
                          Icons.close,
                          color: appTextColor3,
                          size: 25.w,
                        ),
                      ),
                    ],
                  ),

                  if (isConfirmClicked)
                    Column(
                      children: [
                        Image.asset(
                          'assets/images/checked.png',
                          height: 50.h,
                          width: 50.w,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(height: 20.h),
                        AppText(
                          text: "Booking Successful!",
                          size: 20,
                          fontWeight: FontWeight.w500,
                          color: appTextColor3,
                          isCentered: true,
                        ),
                        SizedBox(height: 20.h),
                      ],
                    ),

                  if (!isConfirmClicked)
                    Column(
                      children: [
                        SizedBox(height: 20.h),
                        AppText(
                          text:
                              "After confirmation, your party order will be booked at Bollywood Restaurant.",
                          size: 15,
                          fontWeight: FontWeight.w500,
                          color: appTextColor2,
                          isCentered: true,
                        ),
                        SizedBox(height: 20.h),
                        SizedBox(
                          width: 150.w,
                          height: 40.h,
                          child: AppButton(
                            text: "Confirm",
                            onPressed: () {
                              setState(() {
                                isConfirmClicked = !isConfirmClicked;
                              });
                            },
                            bgColor1: Colors.green,
                            bgColor2: Colors.green,
                            size: 15,
                            borderRadius: 10,
                          ),
                        ),
                        SizedBox(height: 20.h),
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

  Widget _planPartyWidget() {
    return SingleChildScrollView(
      padding:  EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                viewEnquiryOnClick = !viewEnquiryOnClick;
              });
            },
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
                color:  Color(0xFF798FFF),
                borderRadius: BorderRadius.circular(10.r),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10.r,
                    offset:  Offset(0, 4),
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
              text: "Review Party",
              onPressed: () {
                setState(() {
                  isReviewOnClick = true;
                });
              },
              size: 15,
              borderRadius: 10,
              bgColor1: Colors.green,
              bgColor2: Colors.green,
            ),
          ),
          SizedBox(height: 30.h),
        ],
      ),
    );
  }

  Widget _viewSearchWidget() {
    return Stack(
      children: [
        Column(
          children: [
            Padding(
              padding:  EdgeInsets.only(left: 30.w, right: 30.w, top: 30.h),
              child: AppTextFeild(
                text: "Your Current Location",
                textColor: appTextColor3,
                icon: Icons.close,
                iconColor: appTextColor3,
                iconOnTap: () {
                  setState(() {
                    isSearchOnClick = !isSearchOnClick;
                  });
                },
              ),
            ),

            SizedBox(height: 20.h),
            SizedBox(
              width: 180.w,
              child: AppFilterDropDown(
                hint: "Today",
                toggleDropdown: () {
                  showModalBottomSheet(
                    backgroundColor: Colors.white,
                    context: context,
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(25.r),
                      ),
                    ),
                    builder: (context) {
                      return Padding(
                        padding:  EdgeInsets.all(30.w),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 40.w,
                              height: 5.h,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                            ),
                            SizedBox(height: 16.h),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              padding:  EdgeInsets.all(16.w),
                              child: Column(
                                children: [
                                  Divider(color: Colors.grey[200]),
                                  SizedBox(height: 10.h),
                                  AppText(
                                    text: "item1",
                                    size: 15.w,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                  SizedBox(height: 10.h),
                                  Divider(color: Colors.grey[200]),
                                  SizedBox(height: 10.h),
                                  AppText(
                                    text: "item2",
                                    size: 15.w,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                  SizedBox(height: 10.h),
                                  Divider(color: Colors.grey[200]),
                                  SizedBox(height: 10.h),
                                  AppText(
                                    text: "item3",
                                    size: 15.w,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                  SizedBox(height: 10.h),
                                  Divider(color: Colors.grey[200]),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                icon: Icons.tune,
              ),
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:  EdgeInsets.only(left: 30.w, right: 30.w),
                    child: ResponseBox(
                      viewRequestClick: () {
                        setState(() {
                          viewRequest = !viewRequest;
                        });
                      },
                      onAcceptTap: () {
                        setState(() {
                          isResponseAcceptOnClick = !isResponseAcceptOnClick;
                        });
                      },
                      onCancelTap: () {
                        setState(() {});
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _viewDeclineWidget() {
    return Stack(
      children: [
        Column(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  viewDeclineOnClick = !viewDeclineOnClick;
                });
              },
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding:  EdgeInsets.only(left: 30.w, right: 30.w, top: 30.h),
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: appTextColor3,
                    size: 28,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 180.w,
              child: AppFilterDropDown(
                hint: "Today",
                toggleDropdown: () {
                  showModalBottomSheet(
                    backgroundColor: Colors.white,
                    context: context,
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(25.r),
                      ),
                    ),
                    builder: (context) {
                      return Padding(
                        padding:  EdgeInsets.all(30.w),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 40.w,
                              height: 5.h,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                            ),
                            SizedBox(height: 16.h),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              padding:  EdgeInsets.all(16.w),
                              child: Column(
                                children: [
                                  Divider(color: Colors.grey[200]),
                                  SizedBox(height: 10.h),
                                  AppText(
                                    text: "item1",
                                    size: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                  SizedBox(height: 10.h),
                                  Divider(color: Colors.grey[200]),
                                  SizedBox(height: 10.h),
                                  AppText(
                                    text: "item2",
                                    size: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                  SizedBox(height: 10.h),
                                  Divider(color: Colors.grey[200]),
                                  SizedBox(height: 10.h),
                                  AppText(
                                    text: "item3",
                                    size: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                  SizedBox(height: 10.h),
                                  Divider(color: Colors.grey[200]),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                icon: Icons.tune,
              ),
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:  EdgeInsets.only(left: 30.w, right: 30.w),
                    child: DeclineBox(onCancelTap: () {}),
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _viewEnquiryWidget() {
    return Stack(
      children: [
        Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => MainNavPage()));
              },
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding:  EdgeInsets.only(left: 30.w, right: 30.w, top: 30.h),
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: appTextColor3,
                    size: 28,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 180.w,
              child: AppFilterDropDown(
                hint: "Today",
                toggleDropdown: () {
                  showModalBottomSheet(
                    backgroundColor: Colors.white,
                    context: context,
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(25.r),
                      ),
                    ),
                    builder: (context) {
                      return Padding(
                        padding: EdgeInsets.all(30.w),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 40.w,
                              height: 5.h,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                            ),
                            SizedBox(height: 16.h),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20.r),
                              ),
                              padding:  EdgeInsets.all(16.w),
                              child: Column(
                                children: [
                                  Divider(color: Colors.grey[200]),
                                  SizedBox(height: 10.h),
                                  AppText(
                                    text: "item1",
                                    size: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                  SizedBox(height: 10.h),
                                  Divider(color: Colors.grey[200]),
                                  SizedBox(height: 10.h),
                                  AppText(
                                    text: "item2",
                                    size: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                  SizedBox(height: 10.h),
                                  Divider(color: Colors.grey[200]),
                                  SizedBox(height: 10.h),
                                  AppText(
                                    text: "item3",
                                    size: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                  SizedBox(height: 10.h),
                                  Divider(color: Colors.grey[200]),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                icon: Icons.tune,
              ),
            ),
            SizedBox(height: 20.h),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:  EdgeInsets.only(left: 30.w, right: 30.w),
                    child: InqueryBox(
                      onCancelTap: () {
                        setState(() {
                          isWithdrawOnClick = !isWithdrawOnClick;
                        });
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _cancelBox() {
    return Positioned.fill(
      child: Container(
        color: Colors.black54,
        child: Center(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 30.w),
            child: Container(
              width: double.infinity,
              padding:  EdgeInsets.symmetric(horizontal: 30.w, vertical: 50.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppText(
                    text: "Are you sure you want to Cancel this Enquiry?",
                    isCentered: true,
                    lineSpacing: 1.5,
                    size: 15,
                    fontWeight: FontWeight.w500,
                    color: appTextColor2,
                  ),
                  SizedBox(height: 20.h),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 50.w),
                    child: Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 40.h,
                            child: AppButton(
                              text: "Yes",
                              onPressed: () {
                                setState(() {
                                  isWithdrawOnClick = !isWithdrawOnClick;
                                });
                              },
                              size: 15,
                              bgColor1: Colors.green,
                              bgColor2: Colors.green,
                              borderRadius: 10,
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Expanded(
                          child: SizedBox(
                            height: 40.h,
                            child: AppButton(
                              text: "No",
                              onPressed: () {},
                              size: 15,
                              bgColor1: Colors.red,
                              bgColor2: Colors.red,
                              borderRadius: 10,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  //---------------------------------------------------------------------------
  Widget _viewRequestWidget() {
    return Positioned.fill(
      child: Container(
        color: Colors.black54,
        child: Center(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 30.w),
            child: Container(
              width: double.infinity,
              padding:  EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                        text: "Requested party",
                        size: 15,
                        fontWeight: FontWeight.w500,
                        color: appTextColor2,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            viewRequest = !viewRequest;
                          });
                        },
                        child: Icon(
                          Icons.close,
                          color: appTextColor3,
                          size: 25.w,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: AppText(
                      text: "P17854",
                      size: 20,
                      fontWeight: FontWeight.w700,
                      color: appTextColor3,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.dashboard, size: 20.w, color: appTextColor2),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              text: "Your Menu",
                              size: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 5.h),
                            AppText(
                              text:
                                  "Chicken Biriyani , Porotta, Rotti ,Salad, Payasam, Butter Chicken , Ice cream. ",
                              size: 15,
                              fontWeight: FontWeight.w500,
                              color: appTextColor2,
                              lineSpacing: 1.5,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.people, size: 20.w, color: appTextColor2),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              text: "Number of Persons",
                              size: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 5.h),
                            AppText(
                              text: "12 Person ",
                              size: 15,
                              fontWeight: FontWeight.w500,
                              color: appTextColor2,
                              lineSpacing: 1.5,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.calendar_today_sharp,
                        size: 20.w,
                        color: appTextColor2,
                      ),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              text: "Date and Time ",
                              size: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 5.h),
                            AppText(
                              text: "April 12 - 2:30 pm",
                              size: 15,
                              fontWeight: FontWeight.w500,
                              color: appTextColor2,
                              lineSpacing: 1.5,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.wallet, size: 20, color: appTextColor2),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              text: "Expected amount per person",
                              size: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 5.h),
                            AppText(
                              text: "1000 Per person",
                              size: 15,
                              fontWeight: FontWeight.w500,
                              color: appTextColor2,
                              lineSpacing: 1.5,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.analytics, size: 20, color: appTextColor2),
                      SizedBox(width: 10.w),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppText(
                              text: "Enquiry Radius ",
                              size: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 5.h),
                            AppText(
                              text: "Moscow City - 20km Radius",
                              size: 15,
                              fontWeight: FontWeight.w500,
                              color: appTextColor2,
                              lineSpacing: 1.5,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _responseAcceptBox() {
    return Positioned.fill(
      child: Container(
        color: Colors.black54,
        child: Center(
          child: Padding(
            padding:  EdgeInsets.symmetric(horizontal: 30.w),
            child: Container(
              width: double.infinity,
              padding:  EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.r),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.warning_amber_outlined,
                    size: 50.w,
                    color: Colors.red,
                  ),
                  SizedBox(height: 10.h),
                  AppText(
                    text: "Switch Banquet Booking?",
                    isCentered: true,
                    lineSpacing: 1.5,
                    size: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.red,
                  ),
                  SizedBox(height: 10.h),
                  AppText(
                    text:
                        " You already have a banquet booked at Bollywood Restaurant. Booking another Banquet will automatically cancel your previous booking.",
                    isCentered: true,
                    lineSpacing: 1.5,
                    size: 15,
                    fontWeight: FontWeight.w500,
                    color: appTextColor2,
                  ),

                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppText(
                        text: "Cancel",
                        size: 15,
                        fontWeight: FontWeight.w400,
                        color: appLinkColor2,
                      ),
                      SizedBox(
                        width: 120.w,
                        height: 40.h,
                        child: AppButton(
                          text: "Yes,Book",
                          onPressed: () {
                            setState(() {
                              isResponseAcceptOnClick =
                                  !isResponseAcceptOnClick;
                              isResponseAcceptConfirmOnClick =
                                  !isResponseAcceptConfirmOnClick;
                            });
                          },
                          size: 15,
                          bgColor1: Colors.green,
                          bgColor2: Colors.green,
                          borderRadius: 10,
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

  Widget _responseWidget() {
    return Column(
      children: [
        SizedBox(height: 20.h),
        Padding(
          padding:  EdgeInsets.symmetric(horizontal: 30.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 150.w,
                child: AppFilterDropDown(
                  hint: "Today",
                  icon: Icons.tune,
                  toggleDropdown: () {
                    showModalBottomSheet(
                      backgroundColor: Colors.white,
                      context: context,
                      isScrollControlled: true,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(25.r),
                        ),
                      ),
                      builder: (context) {
                        return Padding(
                          padding: EdgeInsets.all(30.w),
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
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20.r),
                                ),
                                padding: EdgeInsets.all(16.w),
                                child: Column(
                                  children: [
                                    Divider(color: Colors.grey[200]),
                                    SizedBox(height: 10.h),
                                    AppText(
                                      text: "item1",
                                      size: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                    SizedBox(height: 10.h),
                                    Divider(color: Colors.grey[200]),
                                    SizedBox(height: 10.h),
                                    AppText(
                                      text: "item2",
                                      size: 15.w,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                    SizedBox(height: 10.h),
                                    Divider(color: Colors.grey[200]),
                                    SizedBox(height: 10.h),
                                    AppText(
                                      text: "item3",
                                      size: 15.w,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                    SizedBox(height: 10.h),
                                    Divider(color: Colors.grey[200]),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Row(
                    children: [
                      Icon(Icons.search, size: 17.w, color: Colors.black),
                      SizedBox(width: 2.w),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isSearchOnClick = !isSearchOnClick;
                          });
                        },
                        child: AppText(
                          text: "Search",
                          size: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5.h),
                  Row(
                    children: [
                      Icon(Icons.book, size: 17.w   , color: appLinkColor2),
                      SizedBox(width: 2.w),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            viewDeclineOnClick = !viewDeclineOnClick;
                          });
                        },
                        child: AppText(
                          text: "View Declined",
                          size: 15,
                          fontWeight: FontWeight.w400,
                          color: appLinkColor2,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 20.h),
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding:  EdgeInsets.symmetric(horizontal: 30.w),
                child: ResponseBox(
                  viewRequestClick: () {
                    setState(() {
                      viewRequest = !viewRequest;
                    });
                  },
                  onAcceptTap: () {
                    setState(() {
                      isResponseAcceptOnClick = !isResponseAcceptOnClick;
                    });
                  },
                  onCancelTap: () {
                    setState(() {});
                  },
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget buildStatusButton(String text) {
    final bool isSelected = selectedStatus == text;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            selectedStatus = text;
          });
        },
        child: Container(
          height: 35.h,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: isSelected
                ? const LinearGradient(
                    colors: [Color(0xFFEC7B2D), Color(0xFFF7A440)],
                  )
                : null,
            color: isSelected ? null : Colors.white,
            borderRadius: BorderRadius.circular(10.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 6.r,
                offset: Offset(2.w, 2.w),
              ),
            ],
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 13.w,
              fontWeight: FontWeight.w500,
              color: isSelected ? Colors.white : appTextColor3,
            ),
          ),
        ),
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
      borderRadius: BorderRadius.circular(16.r    ),
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
