import 'package:flutter/material.dart';
import 'package:fudikoclient/components/appbutton.dart';
import 'package:fudikoclient/components/apptext.dart';
import 'package:fudikoclient/utils/constants.dart';

class FilterBottomModal extends StatefulWidget {
  const FilterBottomModal({super.key});

  @override
  State<FilterBottomModal> createState() => _FilterBottomModalState();
}

class _FilterBottomModalState extends State<FilterBottomModal> {
  List<String> menuList = [
    "Up to 10%",
    "Up to 20%",
    "Up to 30%",
    "Up to 40%",
    "Up to 50%",
    "Up to 60%",
    "Up to 70%",
    "Up to 80%",
  ];

  List<String> typeList = ["Restaurant", "Cafe", "Cool Bar", "Bar", "Buffet"];

  int? selectedDiscountIndex = 0;
  int? selectedTypeIndex = 0;
  double _currentDistance = 0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
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
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.5,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.tune, size: 20, color: Colors.black),
                      SizedBox(width: 10),
                      AppText(
                        text: "Filter",
                        size: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ],
                  ),
                  const SizedBox(height: 50),
                  Wrap(
                    alignment: WrapAlignment.start,
                    spacing: 10,
                    runSpacing: 10,
                    children: List.generate(
                      menuList.length,
                      (index) => _discountBox(
                        menuList[index],
                        selectedDiscountIndex == index,
                        () {
                          setState(() {
                            selectedDiscountIndex = index;
                          });
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 50),
                  Wrap(
                    alignment: WrapAlignment.start,
                    spacing: 10,
                    runSpacing: 10,
                    children: List.generate(
                      typeList.length,
                      (index) => _discountBox(
                        typeList[index],
                        selectedTypeIndex == index,
                        () {
                          setState(() {
                            selectedTypeIndex = index;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  Row(
                    children: [
                      Expanded(
                        child: SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                            activeTrackColor: Colors.orange,
                            inactiveTrackColor: Colors.grey[300],
                            thumbColor: Colors.orange,
                            overlayColor: Colors.orange.withAlpha(32),
                            thumbShape: const RoundSliderThumbShape(
                              enabledThumbRadius: 6,
                            ),
                            overlayShape: const RoundSliderOverlayShape(
                              overlayRadius: 14,
                            ),
                          ),
                          child: Slider(
                            min: 0,
                            max: 100,
                            value: _currentDistance,
                            onChanged: (value) {
                              setState(() {
                                _currentDistance = value;
                              });
                            },
                          ),
                        ),
                      ),
                      // Text showing distance
                      const SizedBox(width: 10),
                      Text(
                        "${_currentDistance.toInt()} km",
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppText(
                          text: "Clear all",
                          size: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          isCentered: true,
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          width: 150,
                          child: AppButton(text: "Apply", onPressed: () {}),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _discountBox(String text, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? appTextColor3 : Colors.grey[400],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected
                ? Colors.white
                : isSelected
                ? Colors.white
                : Colors.black,
          ),
        ),
      ),
    );
  }
}
