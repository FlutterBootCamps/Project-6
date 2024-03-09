import 'package:flutter/material.dart';
import 'package:flutter_week6_day3_lab/utils/colors.dart';
import 'package:flutter_week6_day3_lab/utils/fonts.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    super.key,
    required this.text,
    required this.minWidth,
    this.onTap,
  });
  final String text;
  final double minWidth;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onTap,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(40),
      ),
      color: blackColor,
      minWidth: minWidth,
      child: Text(
        text,
        style: const TextStyle(
            color: whiteColor,
            fontFamily: workSansFont,
            fontSize: 18,
            fontWeight: FontWeight.w600),
      ),
    );
  }
}
