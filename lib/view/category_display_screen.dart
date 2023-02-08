import 'package:flutter/material.dart';

class CategoryDisplayPage extends StatefulWidget {
  const CategoryDisplayPage({super.key});

  @override
  State<CategoryDisplayPage> createState() => _CategoryDisplayPageState();
}

class _CategoryDisplayPageState extends State<CategoryDisplayPage> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Category"),
    );
  }
}
