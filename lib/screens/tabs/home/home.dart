import 'package:flutter/material.dart';
import 'package:fudikoclient/components/appfilterdropdown.dart';
import 'package:fudikoclient/components/appsearchbar.dart';
import 'package:fudikoclient/components/apptext.dart';
import 'package:fudikoclient/screens/tabs/components/restaurantCard.dart';
import 'package:fudikoclient/screens/tabs/home/filterbottommodal.dart';
import 'package:fudikoclient/screens/tabs/home/restaurantProfile.dart';
import 'package:fudikoclient/screens/tabs/home/timebottommodal.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool isClicked = false;
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: isClicked
          ? const RestaurantProfile()
          : Stack(
              children: [
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 30,
                        vertical: 30,
                      ),
                      child: const AppSearchBar(),
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
                                child: const RestaurantCard(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                // if(isOpen)
                //   AnimatedPositioned(
                //     duration: const Duration(milliseconds: 300),
                //     curve: Curves.easeOut,
                //     left: 0,
                //     right: 0,
                //     bottom: isOpen ? 0 : -screenHeight * 0.5,
                //     height: screenHeight * 0.5,
                //     child: Container(
                //       padding: const EdgeInsets.symmetric(
                //         horizontal: 20,
                //         vertical: 16,
                //       ),
                //       decoration: const BoxDecoration(
                //         color: Colors.white,
                //         borderRadius: BorderRadius.vertical(
                //           top: Radius.circular(25),
                //         ),
                //         boxShadow: [
                //           BoxShadow(
                //             color: Colors.black26,
                //             blurRadius: 10,
                //             offset: Offset(0, -4),
                //           ),
                //         ],
                //       ),
                //       child: Column(
                //         children: [
                //           Container(
                //             width: 40,
                //             height: 5,
                //             decoration: BoxDecoration(
                //               color: Colors.grey[300],
                //               borderRadius: BorderRadius.circular(10),
                //             ),
                //           ),
                //           const SizedBox(height: 16),
                //           const Text(
                //             "Filter Content Here",
                //           ),
                //         ],
                //       ),
                //     ),
                //   ),
              ],
            ),
    );
  }

  Widget _dropDownBuilder() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: [
          SizedBox(
            width: 120,
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
          const SizedBox(width: 20),
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
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Container(
        width: double.infinity,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              blurRadius: 10,
              offset: const Offset(0, 4),
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
      height: 250,
      child: ListView.builder(
        itemCount: colors.length,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          final color1 = colors[index]['color1']!;
          final color2 = colors[index]['color2']!;
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: Container(
              height: 250,
              width: 150,
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
                        const AppText(
                          text: "20%-30%",
                          size: 20,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                        const SizedBox(height: 4),
                        const AppText(
                          text: "Discount",
                          size: 18,
                          fontWeight: FontWeight.w400,
                          color: Colors.white,
                        ),
                        const SizedBox(height: 15),
                        Image.asset(
                          'assets/images/discounttag.png',
                          height: 100,
                          width: 100,
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
