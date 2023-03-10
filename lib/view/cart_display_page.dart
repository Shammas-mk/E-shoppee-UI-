import 'package:cached_network_image/cached_network_image.dart';
import 'package:eshopee/utils/colors.dart';
import 'package:eshopee/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CartDisplayPage extends StatefulWidget {
  const CartDisplayPage({super.key});

  @override
  State<CartDisplayPage> createState() => _CartDisplayPageState();
}

class _CartDisplayPageState extends State<CartDisplayPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "Cart",
                style: kNormalStyle.copyWith(
                    fontSize: 22, fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              Container(
                height: 40,
                width: 40,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: kGreyColor.withOpacity(0.8)),
                child: Stack(
                  children: [
                    const Icon(
                      FontAwesomeIcons.bell,
                      color: Colors.black87,
                      size: 20,
                    ),
                    Positioned(
                      right: 0,
                      child: Container(
                        height: 8,
                        width: 8,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: kOrangeColor),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(width: 20),
              ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: CachedNetworkImage(
                  imageUrl: "assets/5.jpeg",
                  height: 40,
                  width: 40,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
