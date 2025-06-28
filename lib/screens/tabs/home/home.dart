import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fudikoclient/components/appfilterdropdown.dart';
import 'package:fudikoclient/components/appsearchbar.dart';
import 'package:fudikoclient/components/apptext.dart';
import 'package:fudikoclient/screens/tabs/components/restaurantCard.dart';
import 'package:fudikoclient/screens/tabs/home/addnumberofpeople.dart';
import 'package:fudikoclient/screens/tabs/home/filterbottommodal.dart';
import 'package:fudikoclient/screens/tabs/home/rating.dart';
import 'package:fudikoclient/screens/tabs/home/timebottommodal.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isClicked = false;
  bool isOpen = false;
  bool isBookingModalOpen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Padding(
                padding:  EdgeInsets.symmetric(
                  horizontal: 30.w,
                  vertical: 30.h,
                ),
                child:  AppSearchBar(),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _discountBuilder(),
                      _mapBuilder(),
                      _dropDownBuilder(),
                      ListView.builder(
                        itemCount: 5,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            setState(() {
                              isClicked = true;
                            });
                          },
                          child: RestaurantCard(
                            onRatingOnClick: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RatingPage(),
                                ),
                              );
                            },
                            onBoxClicked: () {
                              setState(() {
                                isBookingModalOpen = !isBookingModalOpen;
                              });
                              if (isBookingModalOpen) {
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
                                    return NumberOfPeopleModal();
                                  },
                                );
                              }
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _dropDownBuilder() {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20.w),
      child: Row(
        children: [
          SizedBox(
            width: 120.w,
            child: AppFilterDropDown(
              hint: "Filter",
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
                    return FilterBottomModal();
                  },
                );
              },
            ),
          ),
          SizedBox(width: 20.w),
          Expanded(
            child: AppFilterDropDown(
              hint: "Today at 12:00PM",
              icon: Icons.event_available,
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
                    return TimeBottomModal();
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _mapBuilder() {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Container(
        width: double.infinity,
        height: 150.h,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset:  Offset(0, 4),
            ),
          ],
        ),
        clipBehavior: Clip.hardEdge,
        child: Image.asset('assets/images/map.png', fit: BoxFit.cover),
      ),
    );
  }

  Widget _discountBuilder() {
    final colors = [
      {'color1': Colors.deepPurple, 'color2': Colors.deepPurpleAccent},
      {'color1': Colors.green, 'color2': Colors.lightGreen},
      {'color1': Colors.purple, 'color2': Colors.purpleAccent},
      {'color1': Colors.red, 'color2': Colors.redAccent},
      {'color1': Colors.orange, 'color2': Colors.orangeAccent},
      {'color1': Colors.blue, 'color2': Colors.blueAccent},
    ];

    return SizedBox(
      height: 250.h,
      child: ListView.builder(
        itemCount: colors.length,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final color1 = colors[index]['color1']!;
          final color2 = colors[index]['color2']!;
          return Padding(
            padding:  EdgeInsets.symmetric(horizontal: 5.w),
            child: Container(
              height: 250.h,
              width: 150.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [color1, color2],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                ),
              ),
              child: Stack(
                children: [
                  Positioned.fill(
                    child: Image.asset(
                      'assets/images/boxbg.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(
                          text: "20%-30%",
                          size: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                        SizedBox(height: 4.h),
                        AppText(
                          text: "Discount",
                          size: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                        SizedBox(height: 15.h),
                        Image.asset(
                          'assets/images/discounttag.png',
                          height: 100.h,
                          width: 100.w  ,
                          fit: BoxFit.contain,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
