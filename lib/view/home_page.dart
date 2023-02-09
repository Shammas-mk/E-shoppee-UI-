import 'package:eshopee/utils/colors.dart';
import 'package:eshopee/view/cart_display_page.dart';
import 'package:eshopee/view/category_display_screen.dart';
import 'package:eshopee/view/product_display_page.dart';
import 'package:eshopee/view/profile_display_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  HomePage({super.key, required this.title});
  String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int currentIndex = 0;

  final pageController = PageController(initialPage: 0);

  final tabBarIcons = [
    FontAwesomeIcons.house,
    FontAwesomeIcons.compass,
    FontAwesomeIcons.cartShopping,
    FontAwesomeIcons.user,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Stack(
          children: [
            PageView(
              controller: pageController,
              onPageChanged: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              children: const [
                ProductDisplayPage(),
                CategoryDisplayPage(),
                CartDisplayPage(),
                ProfileDisplayPage(),
              ],
            ),
            Positioned(
              bottom: 20,
              left: 20,
              right: 20,
              child: Container(
                alignment: Alignment.center,
                height: 70,
                decoration: BoxDecoration(
                    color: kBackgroundColor,
                    borderRadius: BorderRadius.circular(30.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ...tabBarIcons.map((icon) => IconButton(
                        onPressed: () {
                          if (icon == FontAwesomeIcons.house) {
                            pageController.jumpToPage(0);
                          } else if (icon == FontAwesomeIcons.compass) {
                            pageController.jumpToPage(1);
                          } else if (icon == FontAwesomeIcons.cartShopping) {
                            pageController.jumpToPage(2);
                          } else if (icon == FontAwesomeIcons.user) {
                            pageController.jumpToPage(3);
                          }
                        },
                        icon: Icon(
                          icon,
                          color: Colors.white60,
                          size: 22,
                        )))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
