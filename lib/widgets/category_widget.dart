import 'package:api_page_lab/constant/colors.dart';
import 'package:api_page_lab/models/categorise_model.dart';
import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget({super.key, required this.categorisModel});
  CategorisModel categorisModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: greyColor)),
      child: Center(
          child: Text(
        categorisModel.name!,
        style: const TextStyle(fontWeight: FontWeight.bold),
      )),
    );
  }
}
