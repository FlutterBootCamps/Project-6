import 'package:flutter/material.dart';
import 'package:flutter_week6_day3_lab/helpers/extensions/screen_helper.dart';
import 'package:flutter_week6_day3_lab/models/category_model.dart';
import 'package:flutter_week6_day3_lab/utils/colors.dart';
import 'package:flutter_week6_day3_lab/utils/fonts.dart';
import 'package:flutter_week6_day3_lab/widgets/modfiy_category_bottom_sheet.dart';

class CategoryBar extends StatelessWidget {
  const CategoryBar({
    super.key, required this.category,
  });
  final ProductCategory category;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.getWidth(context),
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: const BoxDecoration(color: productBgColor, borderRadius: BorderRadius.all(Radius.circular(40))),
      child: Row(
        children: [
          Text("${category.id}", style: const TextStyle(color: blackColor, fontFamily: workSansFont, fontSize: 18, fontWeight: FontWeight.w500),),
          const SizedBox(width: 16,),
          Expanded(child: Text(category.name, style: const TextStyle(color: blackColor, fontFamily: workSansFont, fontWeight: FontWeight.w600),),),
          IconButton(onPressed: (){
            TextEditingController nameController = TextEditingController();
            nameController.text = category.name;
            showModalBottomSheet(context: context, builder: (context) {
              return ModifyCategoryBottomSheet(nameController: nameController, category: category, isEdit: true,);
            },);
          }, icon: const Icon(Icons.edit_rounded, color: blackColor,))
        ],
      ),
    );
  }
}