import 'dart:io';

import 'package:flutter/material.dart';
import 'package:shop_app_with_api/constant/color.dart';
import 'package:shop_app_with_api/helper/get_image.dart';

class ImagePickerWidget extends StatelessWidget {
  const ImagePickerWidget({super.key, 
  this.isSelected, 
  this.urlPath, 
  this.selectedPath, 
  this.onTap});
  
  final bool? isSelected;
  final String? urlPath;
  final String? selectedPath;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
     assert((isSelected != true || selectedPath != null),
        "isSelected == true & selected  == null ");


    return Center(
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(50),
        child: Container(
          height: 100,
          width: 100,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              color: lightTiffany,
              shape: BoxShape.circle,
              boxShadow: kElevationToShadow[1],
              border: Border.all(color:white, width: 4)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isSelected == false && urlPath == null)
                const Icon(
                  Icons.add,
                  size: 50,
                  color: white,
                )
              else if (isSelected == false && urlPath != null)
                Image.network(
                  urlPath!,
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                )
              else
              // FileImage(File(selectedPath!))
                // Image.file(
                  Image.memory(
                    pathImage[0],
                  // File(selectedPath!),
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                )
            ],
          ),
        ),
      ),
    );
 
  }
}