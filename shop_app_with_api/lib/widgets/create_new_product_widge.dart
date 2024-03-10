import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_with_api/bloc/registration_bloc.dart';
import 'package:shop_app_with_api/constant/color.dart';
import 'package:shop_app_with_api/constant/space.dart';
import 'package:shop_app_with_api/helper/helper_screen.dart';
import 'package:shop_app_with_api/widgets/image_picker_for_product.dart';

class CreateNewProduct extends StatelessWidget {
  const CreateNewProduct({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController productTitleController = TextEditingController();
    TextEditingController productPriceController = TextEditingController();
    TextEditingController productDescriptionController = TextEditingController();
    TextEditingController categoryIdController = TextEditingController();
    
    final bloc = context.read<RegistrationBloc>();
    return Positioned(
      bottom: 35,
      right: 26,
      child: InkWell(
        onTap: () {
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24.0, vertical: 60),
                child: Center(
                  child: SizedBox(
                    width: context.getWidth() * 0.7,
                    child: Column(
                      children: [
                        Row(mainAxisAlignment: MainAxisAlignment.start, children: [InkWell(onTap: (){ Navigator.pop(context);}, child: const Icon(Icons.close, color: grey))],),
                        ListView(
                          shrinkWrap: true,
                          children: [
                            TextField(
                              style: const TextStyle(color: tiffany),
                              controller: productTitleController,
                              decoration: const InputDecoration(
                                hintText: "Enter product title",
                                hintStyle: TextStyle(
                                    color: grey,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                                labelText: "Product Name",
                                labelStyle: TextStyle(
                                    color: grey,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                                prefixIcon: Icon(
                                  Icons.edit,
                                  color: grey,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                            height32,
                            TextField(
                              style: const TextStyle(color: tiffany),
                              controller: productPriceController,
                              decoration: const InputDecoration(
                                hintText: "Enter product price",
                                hintStyle: TextStyle(
                                    color: grey,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                                labelText: "Product Price",
                                labelStyle: TextStyle(
                                    color: grey,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                                prefixIcon: Icon(
                                  Icons.edit,
                                  color: grey,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                            height32,
                            TextField(
                              style: const TextStyle(color: tiffany),
                              controller: productDescriptionController,
                              decoration: const InputDecoration(
                                hintText: "Enter product description",
                                hintStyle: TextStyle(
                                    color: grey,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                                labelText: "Product description",
                                labelStyle: TextStyle(
                                    color: grey,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                                prefixIcon: Icon(
                                  Icons.edit,
                                  color: grey,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                            height32,
                            TextField(
                              style: const TextStyle(color: tiffany),
                              controller: categoryIdController,
                              decoration: const InputDecoration(
                                hintText: "Enter Category id",
                                hintStyle: TextStyle(
                                    color: grey,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w500),
                                labelText: "Category Id",
                                labelStyle: TextStyle(
                                    color: grey,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500),
                                prefixIcon: Icon(
                                  Icons.edit,
                                  color: grey,
                                ),
                                border: InputBorder.none,
                              ),
                            ),
                            height32,
                            ProductImagePickerWidget(
                              isSelected: bloc.isSelected,
                              urlPath: bloc.urlImage,
                              selectedPath: bloc.pathImage,
                              onTap: () async {
                                bloc.add(ChangeImageEvent());
                              },
                            ),
                          
                            height32,
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    if (productTitleController.text.isNotEmpty &&
                                    productPriceController.text.isNotEmpty &&
                                    productDescriptionController.text.isNotEmpty &&
                                    categoryIdController.text.isNotEmpty
                                    ) {
                                      bloc.add(CreateNewProductsEvent(
                                        title: productTitleController.text,
                                        price: double.parse(productPriceController.text),
                                        description: productDescriptionController.text,
                                        categoryId: int.parse(categoryIdController.text),
                                      ));
                                      Navigator.pop(context);
                                      context.snackBar(text: "Create product Successfully");
                                    } else {
                                      // context.pop(context);
                                      context.snackBar(text: "Enter valid name product, can't make it empty");
                                    }
                                  },
                                  child: const Text(
                                    "Create",
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        color: tiffany,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
        child: Container(
          width: context.getWidth() * 0.15,
          height: context.getWidth() * 0.15,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: lightTiffany,
            border: Border.all(color: white, width: 2),
          ),
          child: const Icon(
            Icons.add,
            size: 50,
            color: white,
          ),
        ),
      ),
    );
  }
}
