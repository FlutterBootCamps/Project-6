import 'dart:io';
import 'package:flutter/material.dart';

class ProfileImage extends StatelessWidget {
  ProfileImage({super.key, this.onTap, this.isSelected, this.path});
  Function()? onTap;
  bool? isSelected;
  String? path;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        clipBehavior: Clip.antiAlias,
        width: 100,
        height: 100,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
        child: isSelected == false
            ? Image.network(
                "https://img.freepik.com/premium-vector/user-profile-icon-flat-style-member-avatar-vector-illustration-isolated-background-human-permission-sign-business-concept_157943-15752.jpg",
                fit: BoxFit.cover,
              )
            : path != null
                ? Image.file(File(path!))
                : Image.network(
                    "https://img.freepik.com/premium-vector/user-profile-icon-flat-style-member-avatar-vector-illustration-isolated-background-human-permission-sign-business-concept_157943-15752.jpg",
                    fit: BoxFit.cover,
                  ),
      ),
    );
  }
}
