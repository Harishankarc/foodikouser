import 'package:flutter/material.dart';
import 'package:fudikoclient/screens/tabs/profile/menucard.dart';
import 'package:fudikoclient/utils/constants.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  String selectedStatus = "PDF Menu";
  List<String> menuPdfList = List.generate(
    20,
    (index) => 'Menu Item ${index + 1}',
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: appSecondaryBackgroundColor,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 30),
              child: Row(
                children: [
                  buildStatusButton("PDF Menu"),
                  const SizedBox(width: 10),
                  buildStatusButton("Single Menu"),
                ],
              ),
            ),
            const SizedBox(height: 30),
            if (selectedStatus == "PDF Menu")
              Expanded(
                child: ListView.separated(
                  itemCount: menuPdfList.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 10),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: _pdfBox(menuPdfList[index]),
                    );
                  },
                ),
              ),
            if (selectedStatus == "Single Menu")
              Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30),
                      child: MenuCard(url: 'assets/images/dish.png'),
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _pdfBox(String text) {
    return Container(
      width: double.infinity,
      height: 70,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: 0,
            child: Image.asset(
              'assets/images/pdfLogo.png',
              height: 40,
              width: 40,
              fit: BoxFit.contain,
            ),
          ),
          Center(
            child: Text(
              text,
              style: const TextStyle(fontSize: 12),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
        ],
      ),
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
