import 'package:flutter/material.dart';
import 'package:fudikoclient/components/apptext.dart';
import 'package:fudikoclient/screens/home/components/banquetBox.dart';
import 'package:fudikoclient/screens/home/components/cateringBox.dart';
import 'package:fudikoclient/screens/home/components/restaurantBox.dart';
import 'package:fudikoclient/screens/home/components/takeawayBox.dart';
import 'package:fudikoclient/utils/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController _pageController = PageController();
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appSecondaryBackgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
              child: _navBar(),
            ),

            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: 2,
                      onPageChanged: (index) {
                        setState(() {
                          _currentIndex = index;
                        });
                      },
                      itemBuilder: (context, index) {
                        return SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              left: 30,
                              right: 30,
                              top: 10,
                            ),
                            child: Column(
                              children: [
                                if (index == 0) ...[
                                  RestaurantBox(),
                                  SizedBox(height: 20),
                                  BanquetBox(),
                                  SizedBox(height: 20),
                                  CateringBox(),
                                  SizedBox(height: 20),
                                  TakeAwayBox(),
                                ] else ...[
                                  ListView.builder(
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemCount: 5,
                                    itemBuilder: (context, index) {
                                      return Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            children: [
                                              AppText(
                                                text: "10 minutes ago",
                                                size: 15,
                                                fontWeight: FontWeight.w500,
                                                color: appTextColor2,
                                              ),
                                            ],
                                          ),
                                          SizedBox(height: 10),
                                          Image.asset(
                                            'assets/images/offerimage.png',
                                            height: 600,
                                            fit: BoxFit.contain,
                                          ),
                                          SizedBox(height: 20),
                                        ],
                                      );
                                    },
                                  ),
                                ],
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        2, // Number of pages
                        (index) => AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          width: _currentIndex == index ? 12 : 8,
                          height: _currentIndex == index ? 12 : 8,
                          decoration: BoxDecoration(
                            color: _currentIndex == index
                                ? Colors.orange
                                : Colors.grey,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _navBar() {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Icon(Icons.menu, size: 30, color: appTextColor3),
        ),
        Align(
          alignment: Alignment.center,
          child: Container(
            width: 200,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Column(
                children: [
                  AppText(
                    text: "City",
                    size: 10,
                    fontWeight: FontWeight.w600,
                    color: appTextColor3,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.location_on, size: 15, color: appTextColor3),
                        AppText(
                          text: "Moscow Center",
                          size: 10,
                          fontWeight: FontWeight.w600,
                          color: appTextColor3,
                        ),
                      ],
                    ),
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
