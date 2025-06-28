import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fudikoclient/utils/constants.dart';

class RestaurantCard extends StatelessWidget {
  final VoidCallback? onRatingOnClick;
  final VoidCallback? onBoxClicked;
  const RestaurantCard({super.key,this.onRatingOnClick,this.onBoxClicked});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin:  EdgeInsets.all(20.w),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: onBoxClicked,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                  child: Image.asset(
                    'assets/images/restaurantBanner.png',
                    height: 180.h,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),

                Positioned(
                  top: 10,
                  left: 10,
                  child: Container(
                    padding:  EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 4.h,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Row(
                          children: [
                        Icon(Icons.location_on, size: 14.w, color: Colors.white),
                        SizedBox(width: 4.w),
                        Text(
                          '12 km',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  top: 10,
                  right: 10,
                  child: Icon(Icons.favorite, color: Colors.orange,size: 20.w,),
                ),
                Positioned(
                  bottom: 10,
                  left: 20,
                  child: RichText(
                    text:  TextSpan(
                      children: [
                        TextSpan(
                          text: "Bollywood ",
                          style: TextStyle(
                            fontSize: 30.sp,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                          ),
                        ),
                        TextSpan(
                          text: "Restaurant",
                          style: TextStyle(fontSize: 20.sp,fontWeight: FontWeight.w400, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          Padding(
            padding: EdgeInsets.all(15.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.location_on, color: appTextColor3, size: 18.w),
                        SizedBox(width: 5.w),
                        Text(
                          "Ulitsa Serpukhovskiy Val-14",
                          style: TextStyle(color: appTextColor3,fontSize: 14.sp),
                        ),
                      ],
                    ),
                    Container(
                      padding:  EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: GestureDetector(
                        onTap: onRatingOnClick,
                        child:  Row(
                          children: [
                            Icon(Icons.star, size: 14.w, color: Colors.white),
                            SizedBox(width: 4.w),
                            Text('4.8', style: TextStyle(color: Colors.white,fontSize: 14.sp)),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5.h),
                 Row(
                  children: [
                    Icon(Icons.restaurant_menu, size: 18.w, color: appTextColor3),
                    SizedBox(width: 5.w),
                    Text(
                      "Chinese - Arabic - Indian",
                      style: TextStyle(color: appTextColor3,fontSize: 14.sp),
                    ),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(
            height: 180.h,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding:  EdgeInsets.only(left: 15.w, right: 15.w, bottom: 15.h),
              children: List.generate(5, (index) {
                final discounts = ['-40%', '-40%', '-30%', '-25%', '-40%'];
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
                final dates = ['TODAY', 'TODAY', 'TODAY', 'TODAY', 'MAY 1'];

                return Padding(
                  padding:  EdgeInsets.only(right: 5.w),
                  child: Container(
                    width: 100.w,
                    decoration: BoxDecoration(
                      color: Colors.green.shade700,
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Stack(
                      children: [
                        Padding(
                          padding:  EdgeInsets.all(10.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                discounts[index],
                                style:  TextStyle(
                                  fontSize: 20.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                texts[index],
                                textAlign: TextAlign.center,
                                style:  TextStyle(
                                  fontSize: 10.sp,
                                  color: Colors.white,
                                ),
                              ),
                              Divider(color: Colors.white, thickness: 1.w),
                              Text(
                                dates[index],
                                style:  TextStyle(
                                  fontSize: 10.sp,
                                  color: Colors.white70,
                                ),
                              ),
                              Container(
                                padding:  EdgeInsets.all(5.w),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                                child:  Text(
                                times[index],
                                style:  TextStyle(
                                  fontSize: 10.sp,
                                  color: Colors.green,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              )
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 45.h,
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
                          bottom: 45.h,
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
        ],
      ),
    );
  }
}
