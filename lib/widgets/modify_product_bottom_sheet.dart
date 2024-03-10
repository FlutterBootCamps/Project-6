import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_week6_day3_lab/bloc/admin_view_bloc.dart';
import 'package:flutter_week6_day3_lab/helpers/extensions/screen_helper.dart';
import 'package:flutter_week6_day3_lab/models/product_model.dart';
import 'package:flutter_week6_day3_lab/utils/colors.dart';
import 'package:flutter_week6_day3_lab/widgets/bottom_button.dart';
import 'package:flutter_week6_day3_lab/widgets/text_field_iconed.dart';

class ModifyProductBottomSheet extends StatelessWidget {
  const ModifyProductBottomSheet({
    super.key,
    required this.titleController,
    required this.priceController,
    required this.descriptionController,
    required this.categoryIdController,
    this.isEdit = false,
    this.product,
  });

  final TextEditingController titleController;
  final TextEditingController priceController;
  final TextEditingController descriptionController;
  final TextEditingController categoryIdController;
  final bool? isEdit;
  final Product? product;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.getWidth(context),
      height: context.getHeight(context) * .6,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40), topRight: Radius.circular(40))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          TextFieldIconed(
            controller: titleController,
            hintText: "Enter Product name",
            label: "Product Name",
            icon: const Icon(
              Icons.shopping_bag_rounded,
            ),
          ),
          TextFieldIconed(
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            controller: priceController,
            hintText: "Enter Product price",
            label: "Product Price",
            icon: const Icon(
              Icons.attach_money,
            ),
          ),
          TextFieldIconed(
            controller: descriptionController,
            hintText: "Enter Product description",
            label: "Product Description",
            icon: const Icon(Icons.menu_open_rounded,
            ),
          ),
          (isEdit!) ? const SizedBox() : TextFieldIconed(
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            controller: categoryIdController,
            hintText: "Enter product's category ID",
            label: "Product Category ID",
            icon: const Icon(
              Icons.grid_view_rounded,
            ),
          ),
          BottomButton(
            text: (isEdit!) ? "Edit Product" : "Add Product",
            minWidth: 60,
            onTap: () async {
              if (isEdit!) {
                context.read<AdminViewBloc>().add(EditProductEvent(
                    title: titleController.text,
                    id: product!.id,
                    price: (priceController.text.trim().isNotEmpty) ? int.parse(priceController.text) : 0,
                    image: "https://api.lorem.space/image/any?w=150&h=220"));
                context.read<AdminViewBloc>().add(ShowAllProductsEvent());
                Navigator.pop(context);
              } else {
                context.read<AdminViewBloc>().add(AddProductEvent(
                    title: titleController.text,
                    categoryId: (categoryIdController.text.trim().isNotEmpty) ? int.parse(categoryIdController.text) : 0,
                    description: descriptionController.text,
                    price: (priceController.text.trim().isNotEmpty) ? int.parse(priceController.text) : 0,
                    image: "https://api.lorem.space/image/${titleController.text}?w=150&h=220"));
                context.read<AdminViewBloc>().add(ShowAllProductsEvent());
                Navigator.pop(context);
              }
            },
          )
        ],
      ),
    );
  }
}