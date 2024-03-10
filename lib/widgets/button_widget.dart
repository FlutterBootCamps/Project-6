import 'package:api_page_lab/constant/colors.dart';
import 'package:flutter/material.dart';

class purbleButton extends StatelessWidget {
  purbleButton({super.key, required this.text, required this.onPressed});
  final String text;
  Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: onPressed,
            style: ButtonStyle(
              backgroundColor: MaterialStateColor.resolveWith(
                (states) => purbleColor,
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            child: Text(
              text,
              style: const TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
