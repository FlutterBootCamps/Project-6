import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:shop_app_with_api/constant/color.dart';
import 'package:shop_app_with_api/helper/helper_screen.dart';

class ProductImagePickerWidget extends StatelessWidget {
  const ProductImagePickerWidget(
      {super.key,
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
        child: DottedBorder(
          color: grey,
          strokeWidth: 1,
          child: Container(
            padding: const EdgeInsets.all(12),
            width: context.getWidth() * 0.8,
            height: context.getHeight() * 0.12,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (isSelected == false && urlPath == null)
                  const Column(
                    children: [
                      Icon(
                        Icons.image,
                        color: grey,
                        size: 40,
                      ),
                      Text(
                        "Select image for this Category",
                        style: TextStyle(
                            color: grey,
                            fontSize: 16,
                            fontWeight: FontWeight.w500),
                      )
                    ],
                  )
                //     ),
                // )

                else if (isSelected == false && urlPath != null)
                  Image.network(
                    urlPath!,
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  )
                else
                  Image.file(
                    File(selectedPath!),
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
