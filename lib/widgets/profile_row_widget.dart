import 'package:flutter/material.dart';

class ProfileRowWidget extends StatelessWidget {
  ProfileRowWidget({super.key, required this.icon, required this.title});
  String title;
  Icon icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          icon,
          const SizedBox(
            width: 10,
          ),
          Text(title),
          const Spacer(),
          const Icon(Icons.arrow_forward_ios_outlined)
        ],
      ),
    );
  }
}
