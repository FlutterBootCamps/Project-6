import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
   TextFieldWidget({super.key, required this.hint, required this.label ,required this.controller});
  final String hint;
  final String label;
  TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller:controller,
      decoration: InputDecoration(
        hintText: hint,
        label: Text(label),
        
      ),
    );
  }
}
