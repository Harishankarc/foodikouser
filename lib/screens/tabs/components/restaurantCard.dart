import 'package:flutter/material.dart';
import 'package:fudikoclient/utils/constants.dart';

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.all(20),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 4,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                child: Image.asset(
                  'assets/images/restaurantBanner.png',
                  height: 180,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              Positioned(
                top: 10,
                left: 10,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.location_on, size: 14, color: Colors.white),
                      SizedBox(width: 4),
                      Text(
                        '12 km',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: Icon(Icons.favorite, color: Colors.orange),
              ),
              Positioned(
                bottom: 10,
                left: 20,
                child: RichText(
                  text: const TextSpan(
                    children: [
                      TextSpan(
                        text: "Bollywood ",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      TextSpan(
                        text: "Restaurant",
                        style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(Icons.location_on, color: appTextColor3, size: 18),
                        SizedBox(width: 5),
                        Text(
                          "Ulitsa Serpukhovskiy Val-14",
                          style: TextStyle(color: appTextColor3),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Row(
                        children: [
                          Icon(Icons.star, size: 14, color: Colors.white),
                          SizedBox(width: 4),
                          Text('4.8', style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                 Row(
                  children: [
                    Icon(Icons.restaurant_menu, size: 18, color: appTextColor3),
                    SizedBox(width: 5),
                    Text(
                      "Chinese - Arabic - Indian",
                      style: TextStyle(color: appTextColor3),
                    ),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(
            height: 180,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15),
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
                            mainAxisAlignment: MainAxisAlignment.center,
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
                              const Divider(color: Colors.white, thickness: 1),
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
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child:  Text(
                                times[index],
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: Colors.green,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              )
                            ],
                          ),
                        ),
                        Positioned(
                          bottom: 45,
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
                          bottom: 45,
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
        ],
      ),
    );
  }
}
