import 'package:flutter/material.dart';
import 'package:flutter_week6_day3_lab/utils/colors.dart';

class AdminCategoryPage extends StatelessWidget {
  const AdminCategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Category Page", style: TextStyle(color: blackColor),),),
    );
  }
}