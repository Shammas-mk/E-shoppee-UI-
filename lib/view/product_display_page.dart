import 'package:eshopee/widgets/top_container.dart';
import 'package:flutter/material.dart';

class ProductDisplayPage extends StatefulWidget {
  const ProductDisplayPage({super.key});

  @override
  State<ProductDisplayPage> createState() => _ProductDisplayPageState();
}

class _ProductDisplayPageState extends State<ProductDisplayPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
      child: Column(
        children: const [
          TopContainer(title: "title", searchBarTitle: "searchBarTitle")
        ],
      ),
    );
  }
}
