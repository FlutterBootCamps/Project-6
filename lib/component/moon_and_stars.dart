
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_store/helper/extention/screen_helper.dart';

class MoonAndStars extends StatelessWidget {
  const MoonAndStars({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(children: [ Positioned(top: 40,left: 40,child: Container(decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.yellow.shade100,blurRadius: 1000000,spreadRadius: 20,blurStyle:BlurStyle.normal)]),child: SvgPicture.asset("assets/image/crescent-moon-svgrepo-com.svg",color: Colors.yellow.shade400, width: 70,height: 70,))),
              Positioned(top: 10,left: 10,child: Container(decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.yellow.shade100,blurRadius: 1000000,spreadRadius: 5,blurStyle:BlurStyle.normal)]),child: SvgPicture.asset("assets/image/star-solid-svgrepo-com.svg",color: Colors.yellow.shade400, width: 30,height: 30,))),
              Positioned(top: 10,left:context.getWidth()/2,child: Container(decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.yellow.shade100,blurRadius: 1000000,spreadRadius: 5,blurStyle:BlurStyle.normal)]),child: SvgPicture.asset("assets/image/star-solid-svgrepo-com.svg",color: Colors.yellow.shade400, width: 30,height: 30,))),
              Positioned(top: 50,left: context.getWidth()/4,child: Container(decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.yellow.shade100,blurRadius: 1000000,spreadRadius: 5,blurStyle:BlurStyle.normal)]),child: SvgPicture.asset("assets/image/star-solid-svgrepo-com.svg",color: Colors.yellow.shade400, width: 30,height: 30,))),
              Positioned(top: 30,left: 70,child: Container(decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.yellow.shade100,blurRadius: 1000000,spreadRadius: 5,blurStyle:BlurStyle.normal)]),child: SvgPicture.asset("assets/image/star-solid-svgrepo-com.svg",color: Colors.yellow.shade400, width: 30,height: 30,))),
         Positioned(top: 80,left: 120,child: Container(decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.yellow.shade100,blurRadius: 1000000,spreadRadius: 5,blurStyle:BlurStyle.normal)]),child: SvgPicture.asset("assets/image/star-solid-svgrepo-com.svg",color: Colors.yellow.shade400, width: 30,height: 30,))),
              Positioned(top: 100,left: 30,child: Container(decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.yellow.shade100,blurRadius: 1000000,spreadRadius: 5,blurStyle:BlurStyle.normal)]),child: SvgPicture.asset("assets/image/star-solid-svgrepo-com.svg",color: Colors.yellow.shade400, width: 30,height: 30,))),
    
              Positioned(top: 30,right: 70,child: Container(decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.yellow.shade100,blurRadius: 1000000,spreadRadius: 5,blurStyle:BlurStyle.normal)]),child: SvgPicture.asset("assets/image/star-solid-svgrepo-com.svg",color: Colors.yellow.shade400, width: 30,height: 30,))),
              Positioned(top: 80,right: 120,child: Container(decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.yellow.shade100,blurRadius: 1000000,spreadRadius: 5,blurStyle:BlurStyle.normal)]),child: SvgPicture.asset("assets/image/star-solid-svgrepo-com.svg",color: Colors.yellow.shade400, width: 30,height: 30,))),
              Positioned(top: 10,right: 10,child: Container(decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.yellow.shade100,blurRadius: 1000000,spreadRadius: 5,blurStyle:BlurStyle.normal)]),child: SvgPicture.asset("assets/image/star-solid-svgrepo-com.svg",color: Colors.yellow.shade400, width: 30,height: 30,))),
              Positioned(top: 50,right: context.getWidth()/4,child: Container(decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.yellow.shade100,blurRadius: 1000000,spreadRadius: 5,blurStyle:BlurStyle.normal)]),child: SvgPicture.asset("assets/image/star-solid-svgrepo-com.svg",color: Colors.yellow.shade400, width: 30,height: 30,))),
              Positioned(top: 10,right:context.getWidth()/2,child: Container(decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.yellow.shade100,blurRadius: 1000000,spreadRadius: 5,blurStyle:BlurStyle.normal)]),child: SvgPicture.asset("assets/image/star-solid-svgrepo-com.svg",color: Colors.yellow.shade400, width: 30,height: 30,))),
              Positioned(top: 100,right: 30,child: Container(decoration: BoxDecoration(boxShadow: [BoxShadow(color: Colors.yellow.shade100,blurRadius: 1000000,spreadRadius: 5,blurStyle:BlurStyle.normal)]),child: SvgPicture.asset("assets/image/star-solid-svgrepo-com.svg",color: Colors.yellow.shade400, width: 30,height: 30,))),
    ],);
  }
}
