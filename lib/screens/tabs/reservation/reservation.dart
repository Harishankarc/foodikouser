import 'package:flutter/material.dart';
import 'package:fudikoclient/components/appbutton.dart';
import 'package:fudikoclient/components/appfilterdropdown.dart';
import 'package:fudikoclient/components/apptext.dart';
import 'package:fudikoclient/components/apptextfeild.dart';
import 'package:fudikoclient/screens/tabs/reservation/reservationBox.dart';
import 'package:fudikoclient/screens/tabs/reservation/reservationDelete.dart';
import 'package:fudikoclient/utils/constants.dart';

class Reservation extends StatefulWidget {
  const Reservation({super.key});

  @override
  State<Reservation> createState() => _ReservationState();
}

class _ReservationState extends State<Reservation> {
  bool isDeletePressed = false;
  bool isConfirmedPressed = false;
  bool isBookingCanceled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appSecondaryBackgroundColor,
      body: Stack(
        children: [
          // Main content
          SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 30),
                  child: AppTextFeild(
                    text: "Search Restaurant",
                    textColor: appTextColor,
                    isTextCenter: true,
                  ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: 200,
                  child: AppFilterDropDown(
                    hint: "filter",
                    icon: Icons.tune_outlined,
                    toggleDropdown: () {
                      showModalBottomSheet(
                        backgroundColor: Colors.white,
                        context: context,
                        isScrollControlled: true,
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.vertical(
                            top: Radius.circular(25),
                          ),
                        ),
                        builder: (context) {
                          return Padding(
                            padding: const EdgeInsets.all(30),
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
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  padding: const EdgeInsets.all(16),
                                  child: Column(
                                    children: [
                                      Divider(color: Colors.grey[200]),
                                      const SizedBox(height: 10),
                                      AppText(
                                        text: "item1",
                                        size: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                      const SizedBox(height: 10),
                                      Divider(color: Colors.grey[200]),
                                      const SizedBox(height: 10),
                                      AppText(
                                        text: "item2",
                                        size: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                      const SizedBox(height: 10),
                                      Divider(color: Colors.grey[200]),
                                      const SizedBox(height: 10),
                                      AppText(
                                        text: "item3",
                                        size: 15,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.black,
                                      ),
                                      const SizedBox(height: 10),
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
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: ListView.builder(
                    itemCount: 3,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return ReservationBox(
                        onCancelTap: () {
                          setState(() {
                            isDeletePressed = !isDeletePressed;
                          });
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),

          if (isDeletePressed)
            Positioned.fill(
              child: Container(color: Colors.black38, child: _deleteBox()),
            ),
          if (isConfirmedPressed)
            Positioned.fill(
              child: Container(color: Colors.black38, child: _confirmedBox()),
            ),
          if (isBookingCanceled)
            Positioned.fill(
              child: Container(
                color: Colors.black38,
                child: _bookingCanceledBox(),
              ),
            ),
        ],
      ),
    );
  }

  Widget _bookingCanceledBox() {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
          child: Text("HIi"),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.only(
                left: 40,
                right: 40,
                top: 30,
                bottom: 30,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            isDeletePressed = !isDeletePressed;
                            isBookingCanceled = !isBookingCanceled;
                          });
                        },
                        child: Icon(Icons.close, size: 30, color: appTextColor),
                      ),
                    ],
                  ),
                  Image.asset(
                    'assets/images/cancel.png',
                    height: 60,
                    width: 60,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: 20),
                  AppText(
                    text: "Booking Canceled!",
                    size: 28,
                    fontWeight: FontWeight.w500,
                    color: Colors.red,
                    isCentered: true,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _confirmedBox() {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
          child: Text("HIi"),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.only(
                left: 40,
                right: 40,
                top: 30,
                bottom: 30,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppText(
                    text: "Are you sure you want to Cancel this Booking?",
                    size: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    isCentered: true,
                  ),
                  SizedBox(height: 10),
                  AppText(
                    text:
                        "Cancelling a confirmed order may negatively impact your reliability rating",
                    size: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                    isCentered: true,
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 35,
                          child: AppButton(
                            text: "Yes",
                            onPressed: () {
                              setState(() {
                                isDeletePressed = !isDeletePressed;
                                isConfirmedPressed = !isConfirmedPressed;
                                isBookingCanceled = !isBookingCanceled;
                              });
                            },
                            borderRadius: 5,
                            bgColor1: Colors.green,
                            bgColor2: Colors.green,
                            size: 15,
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: SizedBox(
                          height: 35,
                          child: AppButton(
                            text: "No",
                            onPressed: () {
                              setState(() {
                                isDeletePressed = !isDeletePressed;
                              });
                            },
                            size: 15,
                            borderRadius: 5,
                            bgColor1: Colors.red,
                            bgColor2: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _deleteBox() {
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Colors.black.withOpacity(0.5)),
          child: Text("HIi"),
        ),
        Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.only(
                left: 40,
                right: 40,
                top: 30,
                bottom: 30,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppText(
                    text: "Are you sure you want to Cancel this Booking?",
                    size: 15,
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    isCentered: true,
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 35,
                          child: AppButton(
                            text: "Yes",
                            onPressed: () {
                              setState(() {
                                isDeletePressed = !isDeletePressed;
                                isConfirmedPressed = !isConfirmedPressed;
                              });
                            },
                            borderRadius: 5,
                            bgColor1: Colors.green,
                            bgColor2: Colors.green,
                            size: 15,
                          ),
                        ),
                      ),
                      const SizedBox(width: 20),
                      Expanded(
                        child: SizedBox(
                          height: 35,
                          child: AppButton(
                            text: "No",
                            onPressed: () {
                              setState(() {
                                isDeletePressed = !isDeletePressed;
                              });
                            },
                            size: 15,
                            borderRadius: 5,
                            bgColor1: Colors.red,
                            bgColor2: Colors.red,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
