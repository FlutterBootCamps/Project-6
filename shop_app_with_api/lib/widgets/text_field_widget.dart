import 'package:flutter/material.dart';
import 'package:shop_app_with_api/constant/color.dart';

class TextFieldWidget extends StatelessWidget {
  const TextFieldWidget({super.key, required this.hintText , required this.labelText, this.controller, this.secretPass = false});
  final bool? secretPass;
  final String labelText;
  final String hintText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: TextField(
        obscureText: secretPass!,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: white, ),
          labelText: labelText,
        ),
      ),
    );
  }
}
