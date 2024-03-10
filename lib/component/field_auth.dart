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
      padding: const EdgeInsets.symmetric(horizontal: 32,vertical: 16),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(hintText: hintText,
                        labelText: labelText,
                        prefixIcon: const Icon(Icons.email_outlined),
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
    );
  }
}
