import 'package:api_lab/constant/colors.dart';
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  TextFieldWidget(
      {super.key,
      this.controller,
      required this.label,
      required this.icon,
      required this.isObscure});
  TextEditingController? controller;
  String label;
  IconData icon;
  bool isObscure;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      obscureText: isObscure ,
      decoration: InputDecoration(
          fillColor: light,
          filled: true,
          label: Text(
            label,
            style: TextStyle(color: darkblue),
          ),
          prefixIcon: Icon(icon),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(40),
              borderSide: BorderSide.none),
          hintText: "Enter Your $label"),
    );
  }
}
