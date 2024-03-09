import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_week6_day3_lab/bloc/product_bloc.dart';
import 'package:flutter_week6_day3_lab/data_layer/home_data_layer.dart';
import 'package:flutter_week6_day3_lab/helpers/extensions/screen_helper.dart';
import 'package:flutter_week6_day3_lab/utils/colors.dart';
import 'package:flutter_week6_day3_lab/utils/fonts.dart';
import 'package:flutter_week6_day3_lab/widgets/text_field_iconed.dart';

// ignore: must_be_immutable
class SearchPage extends StatelessWidget {
  SearchPage({super.key});
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
            controller: searchController,
            hintText: "Search for a product",
            label: "Search",
            icon: const Icon(Icons.search),
            onEditingComplete: () {
              if (locator.productList.isEmpty){
                context.read<ProductBloc>().add(
                  GetSearchedProductsEvent(searchText: searchController.text));
              }
            },
            onChanged: (text){
              if(locator.productList.isNotEmpty && text.trim().isNotEmpty){
                context.read<ProductBloc>().add(
                  GetSearchedProductsEvent(searchText: text));
              }
            },
          ),
          SizedBox(
            width: context.getWidth(context),
            height: context.getHeight(context) * 0.7,
            child: BlocConsumer<ProductBloc, ProductState>(
              listener: (context, state) {
                if (state is DisplaySearchedProductsErrorState){
                  context.showErrorSnackBar(context, state.msg);
                }
              },
              builder: (context, state) {
                if (state is DisplaySearchedProductsLoadingState){
                  return const Center(child: CircularProgressIndicator(color: blackColor,),);
                }else if (state is DisplaySearchedProductsState){
                  return (state.productCardList.isNotEmpty) ? GridView.count(
                  padding: const EdgeInsets.only(top: 16),
                  crossAxisCount: 2,
                  childAspectRatio: 0.80,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  shrinkWrap: true,
                  children: state.productCardList              
                  ,
                ) : const Center(
                  child: Text(
                  "No Items found based on your search",
                  style: TextStyle(
                      color: greyColor, fontFamily: workSansFont, fontSize: 24),
                                ),
                );
                }
                return const Center(
                  child: Text(
                  "Search for items",
                  style: TextStyle(
                      color: greyColor, fontFamily: workSansFont, fontSize: 24),
                                ),
                );
              },
            ),
          )
        ],
      ),
    ));
  }
}
