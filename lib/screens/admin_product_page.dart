import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_week6_day3_lab/bloc/admin_view_bloc.dart';
import 'package:flutter_week6_day3_lab/helpers/extensions/screen_helper.dart';
import 'package:flutter_week6_day3_lab/models/product_model.dart';
import 'package:flutter_week6_day3_lab/utils/colors.dart';
import 'package:flutter_week6_day3_lab/utils/fonts.dart';
import 'package:flutter_week6_day3_lab/widgets/add_button.dart';
import 'package:flutter_week6_day3_lab/widgets/bottom_button.dart';
import 'package:flutter_week6_day3_lab/widgets/modify_product_bottom_sheet.dart';
import 'package:flutter_week6_day3_lab/widgets/product_bar.dart';
import 'package:flutter_week6_day3_lab/widgets/text_field_iconed.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: must_be_immutable
class AdminProductPage extends StatelessWidget {
  AdminProductPage({super.key});
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    context.read<AdminViewBloc>().add(ShowAllProductsEvent());
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              TextFieldIconed(
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                controller: searchController,
                hintText: "Search products by ID",
                label: "Search",
                icon: const Icon(Icons.search),
                onEditingComplete: () {
                  if (searchController.text.trim().isNotEmpty) {
                    context.read<AdminViewBloc>().add(ShowOneProductEvent(
                        id: int.parse(searchController.text.trim())));
                  } else {
                    context.read<AdminViewBloc>().add(ShowAllProductsEvent());
                  }
                },
              ),
              const SizedBox(
                height: 16,
              ),
              BlocConsumer<AdminViewBloc, AdminViewState>(
                listener: (context, state) {
                  if (state is ErrorState) {
                    context.showErrorSnackBar(context, state.msg);
                  }else if (state is AddedEditiedProductState){
                    context.showSuccessSnackBar(context, state.msg);
                  }
                },
                builder: (context, state) {
                  if (state is LoadingState) {
                    return const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 240,
                        ),
                        CircularProgressIndicator(
                          color: blackColor,
                        ),
                      ],
                    );
                  } else if (state is ShowingProductsState) {
                    return SizedBox(
                      width: context.getWidth(context),
                      height: context.getHeight(context) * .69,
                      child: ListView(
                        children:
                            List.generate(state.productList.length, (index) {
                          return ProductBar(
                            product: state.productList[index],
                            isEdit: true,
                          );
                        }),
                      ),
                    );
                  } else if (state is ShowingOneProductState) {
                    return SizedBox(
                      width: context.getWidth(context),
                      height: context.getHeight(context) * .69,
                      child: ListView(
                        children: [
                          ProductBar(
                            product: state.product,
                            isEdit: true,
                          ),
                        ],
                      ),
                    );
                  } else {
                    return const Column(
                      children: [
                        SizedBox(
                          height: 240,
                        ),
                        Text(
                          "No Products Found",
                          style: TextStyle(
                              color: greyColor,
                              fontFamily: workSansFont,
                              fontSize: 24),
                        ),
                      ],
                    );
                  }
                },
              ),
            ],
          ),
        ),
        floatingActionButton: AddButton(onTap: () {
          TextEditingController titleController = TextEditingController();
          TextEditingController priceController = TextEditingController();
          TextEditingController descriptionController = TextEditingController();
          TextEditingController categoryIdController = TextEditingController();
          showModalBottomSheet(
            context: context,
            builder: (context) {
              return ModifyProductBottomSheet(
                titleController: titleController,
                priceController: priceController,
                categoryIdController: categoryIdController,
                descriptionController: descriptionController,
              );
            },
          );
        }));
  }
}


