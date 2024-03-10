import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_with_api/bloc/registration_bloc.dart';
import 'package:shop_app_with_api/constant/color.dart';
import 'package:shop_app_with_api/constant/space.dart';
import 'package:shop_app_with_api/helper/helper_screen.dart';
import 'package:shop_app_with_api/widgets/image_picker_for_product.dart';

class CreateNewCategory extends StatelessWidget {
  const CreateNewCategory({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController categoryNameController = TextEditingController();

    final bloc = context.read<RegistrationBloc>();
    return Positioned(
      bottom: 35,
      right: 26,
      child: InkWell(
        onTap: () {
          showModalBottomSheet(
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
                        TextField(
                          style: const TextStyle(color: tiffany),
                          controller: categoryNameController,
                          decoration: const InputDecoration(
                            hintText: "Enter category name",
                            hintStyle: TextStyle(
                                color: grey,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                            labelText: "Category Name",
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
                                if (categoryNameController.text.isNotEmpty) {
                                  bloc.add(CreateNewCategoriesEvent(
                                    name: categoryNameController.text,
                                    // image: bloc.pathImage!,
                                  ));
                                  Navigator.pop(context);
                                  context.snackBar(text: "Create Category Successfully");
                                } else {
                                  // context.pop(context);
                                  context.snackBar(text: "Enter valid name category, can't make it empty");
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
