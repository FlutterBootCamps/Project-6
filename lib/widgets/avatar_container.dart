import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_week6_day3_lab/utils/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AvatarContainer extends StatelessWidget {
  const AvatarContainer({
    super.key, required this.imgPath, this.onTap,
  });
  
  final String imgPath;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        (imgPath != "https://www.nicepng.com/png/full/73-730154_open-default-profile-picture-png.png") ? CircleAvatar(
          backgroundImage: FileImage(File(imgPath)),
        backgroundColor: lightGreyColor,
        radius: 55,
      ) : const CircleAvatar(
          backgroundImage: CachedNetworkImageProvider("https://www.nicepng.com/png/full/73-730154_open-default-profile-picture-png.png"),
        backgroundColor: lightGreyColor,
        radius: 55,
      ),
      Positioned(
        top: 70,
        left: 75,
        child: IconButton(
          style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(whiteColor), ),
          onPressed: onTap, icon: const FaIcon(FontAwesomeIcons.pencil, color: blackColor,))),
      ]
    );
  }
}
