import 'package:flutter/material.dart';
import 'package:flutter_week6_day3_lab/utils/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    super.key,
    this.onTap,
  });
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: onTap,
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(16),
        color: whiteColor,
        child: const FaIcon(
          FontAwesomeIcons.plus,
          color: blackColor,
          size: 30,
        ));
  }
}
