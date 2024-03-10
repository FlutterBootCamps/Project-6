import 'dart:io';

import 'package:flutter/material.dart';

class PickerImageWidget extends StatelessWidget {
  const PickerImageWidget(
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
        child: Container(
          height: 100,
          width: 100,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
              boxShadow: kElevationToShadow[4]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (isSelected == false && urlPath == null)
                const Icon(
                  Icons.add,
                  size: 50,
                )
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
    );
  }
}
