import 'package:flutter/material.dart';
import 'package:flutter_week6_day3_lab/utils/colors.dart';

class AdminProductPage extends StatelessWidget {
  const AdminProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("Product Page", style: TextStyle(color: blackColor)),),
    );
  }
}