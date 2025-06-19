import 'package:flutter/material.dart';
import 'package:fudikoclient/components/appbutton.dart';
import 'package:fudikoclient/components/apptext.dart';
import 'package:fudikoclient/components/apptextfeild.dart';
import 'package:fudikoclient/components/descriptionBox.dart';
import 'package:fudikoclient/screens/tabs/inquery/inqueryBox.dart';
import 'package:fudikoclient/screens/tabs/inquery/locationselect.dart';
import 'package:fudikoclient/components/appfilterdropdown.dart';
import 'package:fudikoclient/screens/tabs/inquery/responseBox.dart';
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
  bool isWithdrawOnClick = false;
  bool viewEnquiryOnClick = false;
  bool isResponseAcceptOnClick = false;
  bool viewRequest = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appSecondaryBackgroundColor,
      body: Stack(
        children: [
          viewEnquiryOnClick
              ? _viewEnquiryWidget()
              : Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: Row(
                        children: [
                          buildStatusButton("Plan a Party"),
                          const SizedBox(width: 10),
                          buildStatusButton("Response"),
                        ],
                      ),
                    ),
                    Expanded(
                      child: selectedStatus == "Plan a Party"
                          ? _planPartyWidget()
                          : _responseWidget(),
                    ),
                  ],
                ),
          if (isWithdrawOnClick) _cancelBox(),
          if (isResponseAcceptOnClick) _responseAcceptBox(),
          if (viewRequest) _viewRequestWidget(),
          if (isReviewOnClick)
            Positioned.fill(
              child: Container(
                color: Colors.black54,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(30),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
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
                          SizedBox(height: 20),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.dashboard,
                                size: 20,
                                color: appTextColor2,
                              ),
                              SizedBox(width: 10),
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
                                    SizedBox(height: 5),
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

                          SizedBox(height: 20),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.people,
                                size: 20,
                                color: appTextColor2,
                              ),
                              SizedBox(width: 10),
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
                                    SizedBox(height: 5),
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
                          SizedBox(height: 20),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.calendar_today_sharp,
                                size: 20,
                                color: appTextColor2,
                              ),
                              SizedBox(width: 10),
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
                                    SizedBox(height: 5),
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
                          SizedBox(height: 20),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.wallet,
                                size: 20,
                                color: appTextColor2,
                              ),
                              SizedBox(width: 10),
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
                                    SizedBox(height: 5),
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
                          SizedBox(height: 20),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Icon(
                                Icons.analytics,
                                size: 20,
                                color: appTextColor2,
                              ),
                              SizedBox(width: 10),
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
                                    SizedBox(height: 5),
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
                          SizedBox(height: 30),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.timer, size: 20, color: Colors.red),
                              SizedBox(width: 5),
                              AppText(
                                text: "03:00:00",
                                size: 15,
                                fontWeight: FontWeight.w500,
                                color: Colors.red,
                              ),
                            ],
                          ),
                          SizedBox(height: 15),
                          SizedBox(
                            width: 150,
                            height: 40,
                            child: AppButton(
                              text: "Send",
                              onPressed: () {
                                setState(() {
                                  isReviewOnClick = !isReviewOnClick;
                                });
                              },
                              size: 20,
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
            ),
        ],
      ),
    );
  }

  Widget _planPartyWidget() {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
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
                  size: 20,
                  color: appLinkColor2,
                ),
                const SizedBox(width: 5),
                AppText(
                  text: "View Enquiries",
                  size: 15,
                  fontWeight: FontWeight.w400,
                  color: appLinkColor2,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          DescriptionTextArea(
            hintText:
                "Example: Chicken Biriyani , Porotta ,Rotti  , Payasam, Butter Chicken , Ice cream,.Salad",
            topHintText: "Your Menu",
            iconColor: appTextColor2,
            icon: Icons.dashboard,
            maxLength: 300,
          ),
          const SizedBox(height: 20),
          AppTextFeild(
            text: "Number of  People",
            icon: Icons.people,
            iconColor: appTextColor2,
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () => _selectDateTime(context),
            child: AppTextFeild(
              text: "Date & Time",
              icon: Icons.calendar_today_sharp,
              iconColor: appTextColor2,
            ),
          ),
          const SizedBox(height: 20),
          AppTextFeild(
            text: "Expected amount per person",
            icon: Icons.wallet,
            iconColor: appTextColor2,
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LocationSelect()),
            ),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFF798FFF),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
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
          const SizedBox(height: 40),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 4.0, bottom: 4),
                child: Text(
                  'Enquiry valid for',
                  style: TextStyle(
                    color: Colors.red,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  color: appSecondaryBackgroundColor,
                  borderRadius: BorderRadius.circular(15),
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
          const SizedBox(height: 30),
          SizedBox(
            width: 200,
            child: AppButton(
              text: "Review Party",
              onPressed: () {
                setState(() {
                  isReviewOnClick = true;
                });
              },
              size: 20,
              bgColor1: Colors.green,
              bgColor2: Colors.green,
            ),
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }

  Widget _viewEnquiryWidget() {
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
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
                  child: Icon(
                    Icons.arrow_back_ios_new,
                    color: appTextColor3,
                    size: 28,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 180,
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
                        padding: EdgeInsets.all(30),
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
                            SizedBox(height: 16),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              padding: EdgeInsets.all(16),
                              child: Column(
                                children: [
                                  Divider(color: Colors.grey[200]),
                                  SizedBox(height: 10),
                                  AppText(
                                    text: "item1",
                                    size: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                  SizedBox(height: 10),
                                  Divider(color: Colors.grey[200]),
                                  SizedBox(height: 10),
                                  AppText(
                                    text: "item2",
                                    size: 15,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                  SizedBox(height: 10),
                                  Divider(color: Colors.grey[200]),
                                  SizedBox(height: 10),
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
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30),
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
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
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
                  SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 40,
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
                        SizedBox(width: 10),
                        Expanded(
                          child: SizedBox(
                            height: 40,
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
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
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
                        onTap: (){
                          setState(() {
                            viewRequest = !viewRequest;
                          });
                        }
                        ,child: Icon(Icons.close, color: appTextColor3, size: 25)),
                    ],
                  ),
                  SizedBox(height: 20),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: AppText(
                      text: "P17854",
                      size: 20,
                      fontWeight: FontWeight.w700,
                      color: appTextColor3,
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.dashboard, size: 20, color: appTextColor2),
                      SizedBox(width: 10),
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
                            SizedBox(height: 5),
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
                  SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.people, size: 20, color: appTextColor2),
                      SizedBox(width: 10),
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
                            SizedBox(height: 5),
                            AppText(
                              text:
                                  "12 Person ",
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
                  SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.calendar_today_sharp, size: 20, color: appTextColor2),
                      SizedBox(width: 10),
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
                            SizedBox(height: 5),
                            AppText(
                              text:
                                  "April 12 - 2:30 pm",
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
                  SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.wallet, size: 20, color: appTextColor2),
                      SizedBox(width: 10),
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
                            SizedBox(height: 5),
                            AppText(
                              text:
                                  "1000 Per person",
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
                  SizedBox(height: 20),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.analytics, size: 20, color: appTextColor2),
                      SizedBox(width: 10),
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
                            SizedBox(height: 5),
                            AppText(
                              text:
                                  "Moscow City - 20km Radius",
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
                  SizedBox(height: 20),
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
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.warning_amber_outlined,
                    size: 50,
                    color: Colors.red,
                  ),
                  SizedBox(height: 10),
                  AppText(
                    text: "Switch Banquet Booking?",
                    isCentered: true,
                    lineSpacing: 1.5,
                    size: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.red,
                  ),
                  SizedBox(height: 10),
                  AppText(
                    text:
                        " You already have a banquet booked at Bollywood Restaurant. Booking another Banquet will automatically cancel your previous booking.",
                    isCentered: true,
                    lineSpacing: 1.5,
                    size: 15,
                    fontWeight: FontWeight.w500,
                    color: appTextColor2,
                  ),

                  SizedBox(height: 20),
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
                        width: 120,
                        height: 40,
                        child: AppButton(
                          text: "Yes,Book",
                          onPressed: () {
                            setState(() {
                              isResponseAcceptOnClick =
                                  !isResponseAcceptOnClick;
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
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 150,
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
                          padding: EdgeInsets.all(30),
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
                              SizedBox(height: 16),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: EdgeInsets.all(16),
                                child: Column(
                                  children: [
                                    Divider(color: Colors.grey[200]),
                                    SizedBox(height: 10),
                                    AppText(
                                      text: "item1",
                                      size: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                    SizedBox(height: 10),
                                    Divider(color: Colors.grey[200]),
                                    SizedBox(height: 10),
                                    AppText(
                                      text: "item2",
                                      size: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                    SizedBox(height: 10),
                                    Divider(color: Colors.grey[200]),
                                    SizedBox(height: 10),
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
                      const Icon(Icons.search, size: 17, color: Colors.black),
                      const SizedBox(width: 2),
                      AppText(
                        text: "Search",
                        size: 17,
                        fontWeight: FontWeight.w400,
                        color: Colors.black,
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Icon(Icons.book, size: 17, color: appLinkColor2),
                      const SizedBox(width: 2),
                      AppText(
                        text: "View Declined",
                        size: 17,
                        fontWeight: FontWeight.w400,
                        color: appLinkColor2,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        Expanded(
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
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
          height: 35,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: isSelected
                ? const LinearGradient(
                    colors: [Color(0xFFEC7B2D), Color(0xFFF7A440)],
                  )
                : null,
            color: isSelected ? null : Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                blurRadius: 6,
                offset: const Offset(2, 2),
              ),
            ],
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: 13,
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
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: Row(
        children: [
          Icon(icon, size: 20, color: Colors.black),
          const SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
              fontSize: 16,
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
