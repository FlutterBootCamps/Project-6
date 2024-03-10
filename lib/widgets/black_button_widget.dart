import 'package:api_page_lab/constant/colors.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  ButtonWidget({super.key, required this.text, required this.onPress});
  String text;
  Function() onPress;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            backgroundColor: blackColor),
        onPressed: onPress,
        child: Text(
          text,
          style: TextStyle(color: whiteColor),
        ));
  }
}
