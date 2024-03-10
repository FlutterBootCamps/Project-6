import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_with_api/bloc/registration_bloc.dart';
import 'package:shop_app_with_api/constant/color.dart';
import 'package:shop_app_with_api/constant/space.dart';
import 'package:shop_app_with_api/helper/helper_screen.dart';
import 'package:shop_app_with_api/models/category_model.dart';

class CategoryCard extends StatelessWidget {
  CategoryCard({super.key, required this.category});
  final Map<String, dynamic> category;

  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<RegistrationBloc>();

    return SizedBox(
      height: context.getWidth() * 0.95,
      width: context.getWidth() * 0.55,
      child: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(left: 16),
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
            height: context.getWidth() * 0.9,
            width: context.getWidth() * 0.5,
            decoration: BoxDecoration(
              image: DecorationImage(
                  opacity: 0.8,
                  image: NetworkImage("${category['image']}"),
                  fit: BoxFit.fill),
              color: Colors.green,
              borderRadius: BorderRadius.circular(15),
            ),
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24.0, vertical: 60),
                      child: Center(
                        child: SizedBox(
                          width: context.getWidth() * 0.7,
                          child: Column(
                            children: [
                              TextField(
                                style: const TextStyle(color: tiffany),
                                controller: nameController,
                                decoration: InputDecoration(
                                  hintText: "Enter category name",
                                  hintStyle: const TextStyle(
                                      color: grey,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                  labelText: "${category['name']}",
                                  labelStyle: const TextStyle(
                                      color: grey,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                  prefixIcon: const Icon(
                                    Icons.edit,
                                    color: grey,
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                              height32,
                              height32,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      if (nameController.text.isNotEmpty) {
                                        bloc.add(EditCategoryEvent(
                                          category: CategoryModel.fromJson(
                                              category), // userList['id'],
                                          name: nameController.text,
                                        ));
                                        Navigator.pop(context);
                                        context.snackBar(
                                            text:
                                                "Update category name Successfully");
                                      } else {
                                        // context.pop(context);
                                        context.snackBar(
                                            text:
                                                "Enter valid name, can't make it empty");
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "${category["name"]}",
                    style: const TextStyle(
                        color: white,
                        fontSize: 25,
                        fontWeight: FontWeight.w500),
                    // ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24.0, vertical: 60),
                      child: Center(
                        child: SizedBox(
                          width: context.getWidth() * 0.7,
                          child: Column(
                            children: [
                              TextField(
                                style: const TextStyle(color: tiffany),
                                controller: nameController,
                                decoration: InputDecoration(
                                  hintText: "Enter Category name",
                                  hintStyle: const TextStyle(
                                      color: grey,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                  labelText: "${category['name']}",
                                  labelStyle: const TextStyle(
                                      color: grey,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                  prefixIcon: const Icon(
                                    Icons.edit,
                                    color: grey,
                                  ),
                                  border: InputBorder.none,
                                ),
                              ),
                              height32,
                              height32,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      if (nameController.text.isNotEmpty) {
                                        bloc.add(EditCategoryEvent(
                                          category: CategoryModel.fromJson(
                                              category), // userList['id'],
                                          name: nameController.text,
                                        ));
                                        Navigator.pop(context);
                                        context.snackBar(
                                            text: "Update name Successfully");
                                      } else {
                                        // context.pop(context);
                                        context.snackBar(
                                            text:
                                                "Enter valid name, can't make it empty");
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

                // context.pushTo(
                //     view: EditCategory(
                //   selectedCategory: category['id'],
                // )); //!
              },
              child: Container(
                height: context.getWidth() * 0.05,
                width: context.getWidth() * 0.05,
                decoration: const BoxDecoration(
                  color: lightWhite,
                ),
                child: const Icon(
                  Icons.edit,
                  color: grey,
                  size: 20,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
