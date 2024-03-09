import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_week6_day3_lab/bloc/admin_view_bloc.dart';
import 'package:flutter_week6_day3_lab/helpers/extensions/screen_helper.dart';
import 'package:flutter_week6_day3_lab/models/category_model.dart';
import 'package:flutter_week6_day3_lab/utils/colors.dart';
import 'package:flutter_week6_day3_lab/widgets/bottom_button.dart';
import 'package:flutter_week6_day3_lab/widgets/text_field_iconed.dart';

class ModifyCategoryBottomSheet extends StatelessWidget {
  const ModifyCategoryBottomSheet({
    super.key,
    required this.nameController, this.isEdit = false, this.category,
  });

  final TextEditingController nameController;
  final bool? isEdit;
  final ProductCategory? category;
  

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.getWidth(context),
      height: context.getHeight(context) * .4,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          TextFieldIconed(
            controller: nameController,
            hintText: "Enter category name",
            label: "Category Name",
            icon: const Icon(
              Icons.grid_view_rounded,
            ),
          ),
          BottomButton(text: (isEdit!) ? "Edit Category" : "Add Category", minWidth: 60, onTap: () async{
            if(isEdit!){
              context.read<AdminViewBloc>().add(EditCategoryEvent(text: nameController.text, id: category!.id));
              context.read<AdminViewBloc>().add(ShowAllCategoriesEvent());
              Navigator.pop(context);
            }else{
              context.read<AdminViewBloc>().add(AddCategoryEvent(text: nameController.text));
              context.read<AdminViewBloc>().add(ShowAllCategoriesEvent());
              Navigator.pop(context);
            }
          },)
        ],
      ),
    );
  }
}