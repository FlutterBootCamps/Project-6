import 'package:flutter/material.dart';
import 'package:flutter_week6_day3_lab/utils/colors.dart';

class AdminUserPage extends StatelessWidget {
  const AdminUserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: Text("User Page", style: TextStyle(color: blackColor)),),
    );
  }
}