import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_week6_day3_lab/bloc/product_bloc.dart';
import 'package:flutter_week6_day3_lab/data_layer/home_data_layer.dart';
import 'package:flutter_week6_day3_lab/helpers/extensions/screen_helper.dart';
import 'package:flutter_week6_day3_lab/utils/colors.dart';
import 'package:flutter_week6_day3_lab/utils/fonts.dart';
import 'package:flutter_week6_day3_lab/widgets/product_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ProductBloc>().add(GetAllProductsEvent());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocConsumer<ProductBloc, ProductState>(
        listener: (context, state) {
          if (state is DisplayProductsErrorState) {
            context.showErrorSnackBar(context, state.msg);
          }
        },
        builder: (context, state) {
          if (state is DisplayProductsLoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                color: blackColor,
              ),
            );
          } else if (state is DisplayProductsState) {
            return DefaultTabController(
              length: state.categoryList.length + 1,
              child: Column(
                children: [
                  TabBar(
                      dividerColor: glassColor,
                      isScrollable: true,
                      tabAlignment: TabAlignment.start,
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelStyle: const TextStyle(
                          color: blackColor,
                          fontFamily: workSansFont,
                          fontWeight: FontWeight.w600),
                      indicator: const UnderlineTabIndicator(
                          borderRadius: BorderRadius.all(Radius.circular(0)),
                          borderSide: BorderSide(
                            color: blackColor,
                            width: 2,
                          )),
                      tabs: [
                        const Tab(
                          text: "All",
                        ),
                          ...List.generate(locator.categoryList.length, (index) {
                          return Tab(
                            text: state.categoryList[index].name,
                          );
                        },),
                      ]),
                  SizedBox(
                    width: context.getWidth(context),
                    height: context.getHeight(context) * 0.7,
                    child: TabBarView(
                      children: [
                      GridView.count(
                        padding: const EdgeInsets.only(top: 32),
                        clipBehavior: Clip.none,
                        childAspectRatio: 0.9,
                        mainAxisSpacing: 16,
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        children: [
                          ...List.generate(
                              state.allProductsList.length,
                              (index) => Center(
                                      child: ProductCard(
                                    product: state.allProductsList[index],
                                    
                                  ))),
                        ],
                      ),
                      ...List.generate(state.categoryList.length, (index) {
                        return (locator.getCategoryProducts(
                              state.categoryList[index].name).isNotEmpty) ? GridView.count(
                          childAspectRatio: 0.75,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 32,
                          padding: const EdgeInsets.only(left: 16, right: 16, top: 32),
                          crossAxisCount: 2,
                          shrinkWrap: true,
                          children: locator.getCategoryProducts(
                              state.categoryList[index].name)
                        ) : const Center(
              child: Text(
                "No Items Found",
                style: TextStyle(
                    color: blackColor, fontFamily: workSansFont, fontSize: 24),
              ),
            );
                      })
                    ]),
                  )
                ],
              ),
            );
          } else {
            return const Center(
              child: Text(
                "No Data Found",
                style: TextStyle(
                    color: blackColor, fontFamily: workSansFont, fontSize: 24),
              ),
            );
          }
        },
      ),
    );
  }
}
