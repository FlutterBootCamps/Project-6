import 'package:flutter/material.dart';

class FieldAuth extends StatelessWidget {
  const FieldAuth(
      {super.key,
      this.labelText = "Email",
      this.hintText = "Enter your email",
      this.controller});
  final String labelText;
  final String hintText;

  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          decoration: BoxDecoration( color: Colors.amber[50],borderRadius: BorderRadius.circular(10),border: Border.all(color: Colors.blueGrey,width: 2)),
     padding: const EdgeInsets.all(8.0),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
             border: InputBorder.none,
            labelText: labelText, hintText: hintText),
        ),
      ),
    );
  }
}
