import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fudikoclient/components/appbutton.dart';
import 'package:fudikoclient/components/apptext.dart';
import 'package:fudikoclient/screens/tabs/profile/menu.dart';
import 'package:fudikoclient/utils/constants.dart';

class RestaurantProfile extends StatefulWidget {
  const RestaurantProfile({super.key});

  @override
  State<RestaurantProfile> createState() => _RestaurantProfileState();
}

class _RestaurantProfileState extends State<RestaurantProfile> {
  bool isRatingOnClick = false;
  bool isMenuOpen = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: isMenuOpen
            ? Menu()
            : SingleChildScrollView(
          child: Column(
                  children: [
                    Stack(
                      children: [
                        Image.asset(
                          'assets/images/restaurantBanner.png',
                          height: 180.h,
                          width: double.infinity.w,
                          fit: BoxFit.cover,
                        ),

                        Positioned.fill(
                          child: Container(
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),

                        Positioned(
                          top: 30.h,
                          right: 30.w,
                          child:  Icon(
                            Icons.favorite,
                            color: Colors.white,
                            size: 30.w,
                          ),
                        ),

                        Positioned(
                          bottom: 20.h,
                          right: 30.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _badge(Icons.location_on, '12 km'),
                              SizedBox(height: 8.h),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    isRatingOnClick = !isRatingOnClick;
                                  });
                                },
                                child: _badge(Icons.star, '4.8'),
                              ),
                            ],
                          ),
                        ),

                        Positioned(
                          left: 30.w,
                          bottom: 20.h,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                text: "Bollywood",
                                size: 35,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                              AppText(
                                text: "Restaurant",
                                size: 25,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                              SizedBox(height: 8.h),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.location_on,
                                    size: 15,
                                    color: Colors.white,
                                  ),
                                  SizedBox(width: 4.w),
                                  AppText(
                                    text: "Ulitsa Serpukhovskiy Val-14",
                                    size: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 20.h),

                    SizedBox(
                      height: 180.h,
                      child: ListView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        padding:  EdgeInsets.only(
                          left: 15.w,
                          right: 15.w,
                          bottom: 15.h,
                        ),
                        children: List.generate(5, (index) {
                          final discounts = [
                            '-40%',
                            '-40%',
                            '-30%',
                            '-25%',
                            '-40%',
                          ];
                          final texts = [
                            'for entire menu',
                            'for entire menu',
                            'for entire menu',
                            'for entire drinks',
                            'for entire menu',
                          ];
                          final times = [
                            '12:00PM',
                            '12:30PM',
                            '01:00PM',
                            '05:00PM',
                            '12:00PM',
                          ];
                          final dates = [
                            'TODAY',
                            'TODAY',
                            'TODAY',
                            'TODAY',
                            'MAY 1',
                          ];

                          return Padding(
                            padding: const EdgeInsets.only(right: 5),
                            child: Container(
                              height: 100.h,
                              width: 100.w,
                              decoration: BoxDecoration(
                                color: Colors.green.shade700,
                                borderRadius: BorderRadius.circular(10.r),
                              ),
                              child: Stack(
                                children: [
                                  Padding(
                                    padding:  EdgeInsets.all(10.r),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          discounts[index],
                                          style: const TextStyle(
                                            fontSize: 20,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          texts[index],
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontSize: 12,
                                            color: Colors.white,
                                          ),
                                        ),
                                         Divider(
                                          color: Colors.white,
                                          thickness: 1,
                                        ),
                                        Text(
                                          dates[index],
                                          style:  TextStyle(
                                            fontSize: 10,
                                            color: Colors.white70,
                                          ),
                                        ),
                                        Container(
                                          padding:  EdgeInsets.all(5.r),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                          ),
                                          child: Text(
                                            times[index],
                                            style:  TextStyle(
                                              fontSize: 12,
                                              color: Colors.green,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 50.h,
                                    right: -30.w,
                                    child: Container(
                                      width: 50.w,
                                      height: 50.h,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                        bottom: 50.h,
                                    left: -30.w,
                                    child: Container(
                                      width: 50.w,
                                      height: 50.h,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    SizedBox(
                      height: 150.h,
                      child: ListView.builder(
                        itemCount: 6,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 5.w),
                            child: Image.asset(
                              'assets/images/restaurantPic.png',
                              height: 150.h,
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      ),
                    ),

                    Padding(
                      padding:  EdgeInsets.all(20.r),
                      child: Container(
                        padding:  EdgeInsets.all(16.r),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 10.r,
                              offset: Offset(0, 4.r),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 10.h),
                            Row(
                              children: [
                                AppText(
                                  text: "About",
                                  size: 12,
                                  fontWeight: FontWeight.w600,
                                  color: appTextColor2,
                                ),
                                SizedBox(width: 10.w),
                                Expanded(
                                  child: Container(
                                    height: 0.5,
                                    color: appTextColor3,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:  EdgeInsets.only(
                                top: 15.h,
                                right: 10.w,
                                left: 30.w,
                                bottom: 15.h,
                              ),
                              child: AppText(
                                text:
                                    "Step into the glitz and glamour of Indian cinema at our uniquely designed restaurant where every corner tells a story. Enjoy ...",
                                size: 12,
                                fontWeight: FontWeight.w400,
                                color: appTextColor2,
                              ),
                            ),
                            Row(
                              children: [
                                AppText(
                                  text: "Cuisine",
                                  size: 12,
                                  fontWeight: FontWeight.w600,
                                  color: appTextColor2,
                                ),
                                SizedBox(width: 10.w),
                                Expanded(
                                  child: Container(
                                    height: 0.5,
                                    color: appTextColor3,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:  EdgeInsets.only(
                                top: 15.h,
                                right: 10.w,
                                left: 30.w,
                                bottom: 15.h,
                              ),
                              child: AppText(
                                text: "Chineese, Arabic, Indian,",
                                size: 12,
                                fontWeight: FontWeight.w400,
                                color: appTextColor2,
                              ),
                            ),
                            Row(
                              children: [
                                AppText(
                                  text: "Address",
                                  size: 12,
                                  fontWeight: FontWeight.w600,
                                  color: appTextColor2,
                                ),
                                SizedBox(width: 10.w),
                                Expanded(
                                  child: Container(
                                    height: 0.5,
                                    color: appTextColor3,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:  EdgeInsets.only(
                                top: 15.h,
                                right: 10.w,
                                left: 30.w,
                                bottom: 15.h,
                              ),
                              child: AppText(
                                text:
                                    "Ultisa Serpukhovskiy Val- 14 , Near Street mall Cinema Hub, North Metro Moscow",
                                size: 12,
                                fontWeight: FontWeight.w400,
                                color: appTextColor2,
                              ),
                            ),
                            Row(
                              children: [
                                AppText(
                                  text: "Contact Info",
                                  size: 12,
                                  fontWeight: FontWeight.w600,
                                  color: appTextColor2,
                                ),
                                SizedBox(width: 10.w),
                                Expanded(
                                  child: Container(
                                    height: 0.5,
                                    color: appTextColor3,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:  EdgeInsets.only(
                                top: 15.h,
                                right: 10.w,
                                left: 30.w,
                                bottom: 15.h,
                              ),
                              child: AppText(
                                text: "+7 9856412878    +7 895624158",
                                size: 12,
                                fontWeight: FontWeight.w400,
                                color: appTextColor2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 150.w,
                      height: 40.h,
                      child: AppButton(
                        text: "View Menu",
                          size: 12,
                        borderRadius: 10.r,
                        onPressed: () {
                          setState(() {
                            isMenuOpen = !isMenuOpen;
                          });
                        },
                        // icon: Icons.fastfood,
                      ),
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _badge(IconData icon, String text) {
    return Container(
      padding:  EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
            Icon(icon, size: 10, color: Colors.white),
          SizedBox(width: 4.w),
          Text(text, style:  TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
