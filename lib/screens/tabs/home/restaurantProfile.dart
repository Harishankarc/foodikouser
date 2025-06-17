import 'package:flutter/material.dart';
import 'package:fudikoclient/components/appbutton.dart';
import 'package:fudikoclient/components/apptext.dart';
import 'package:fudikoclient/screens/tabs/home/rating.dart';
import 'package:fudikoclient/utils/constants.dart';

class RestaurantProfile extends StatefulWidget {
  const RestaurantProfile({super.key});

  @override
  State<RestaurantProfile> createState() => _RestaurantProfileState();
}

class _RestaurantProfileState extends State<RestaurantProfile> {
  bool isRatingOnClick = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: isRatingOnClick
              ? RatingPage()
              : Column(
                  children: [
                    Stack(
                      children: [
                        // Background image
                        Image.asset(
                          'assets/images/restaurantBanner.png',
                          height: 180,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),

                        Positioned.fill(
                          child: Container(
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),

                        Positioned(
                          top: 30,
                          right: 30,
                          child: const Icon(
                            Icons.favorite,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),

                        Positioned(
                          bottom: 20,
                          right: 30,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _badge(Icons.location_on, '12 km'),
                              const SizedBox(height: 8),
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
                          left: 30,
                          bottom: 20,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                text: "Bollywood",
                                size: 32,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                              AppText(
                                text: "Restaurant",
                                size: 20,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.location_on,
                                    size: 15,
                                    color: Colors.white,
                                  ),
                                  const SizedBox(width: 4),
                                  AppText(
                                    text: "Ulitsa Serpukhovskiy Val-14",
                                    size: 13,
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

                    SizedBox(height: 20),

                    SizedBox(
                      height: 180,
                      child: ListView(
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.only(
                          left: 15,
                          right: 15,
                          bottom: 15,
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
                              width: 150,
                              decoration: BoxDecoration(
                                color: Colors.green.shade700,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Stack(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          discounts[index],
                                          style: const TextStyle(
                                            fontSize: 25,
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
                                        const Divider(
                                          color: Colors.white,
                                          thickness: 1,
                                        ),
                                        Text(
                                          dates[index],
                                          style: const TextStyle(
                                            fontSize: 10,
                                            color: Colors.white70,
                                          ),
                                        ),
                                        Container(
                                          padding: const EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                          ),
                                          child: Text(
                                            times[index],
                                            style: const TextStyle(
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
                                    bottom: 40,
                                    right: -30,
                                    child: Container(
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 40,
                                    left: -30,
                                    child: Container(
                                      width: 50,
                                      height: 50,
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
                    SizedBox(height: 10),
                    SizedBox(
                      height: 150,
                      child: ListView.builder(
                        itemCount: 6,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Image.asset(
                              'assets/images/restaurantPic.png',
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                          );
                        },
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              blurRadius: 10,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.edit_square,
                                  size: 20,
                                  color: Colors.black54,
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                AppText(
                                  text: "About",
                                  size: 12,
                                  fontWeight: FontWeight.w600,
                                  color: appTextColor2,
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Container(
                                    height: 0.5,
                                    color: appTextColor3,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 15,
                                right: 10,
                                left: 30,
                                bottom: 15,
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
                                SizedBox(width: 10),
                                Expanded(
                                  child: Container(
                                    height: 0.5,
                                    color: appTextColor3,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 15,
                                right: 10,
                                left: 30,
                                bottom: 15,
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
                                SizedBox(width: 10),
                                Expanded(
                                  child: Container(
                                    height: 0.5,
                                    color: appTextColor3,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 15,
                                right: 10,
                                left: 30,
                                bottom: 15,
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
                                SizedBox(width: 10),
                                Expanded(
                                  child: Container(
                                    height: 0.5,
                                    color: appTextColor3,
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                top: 15,
                                right: 10,
                                left: 30,
                                bottom: 15,
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
                      width: 250,
                      child: AppButton(
                        text: "View Menu",
                        onPressed: () {},
                        icon: Icons.fastfood,
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _badge(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: Colors.white),
          const SizedBox(width: 4),
          Text(text, style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}
