import 'package:api_lab/constant/colors.dart';
import 'package:api_lab/extensions/screen_handler.dart';
import 'package:api_lab/view/admin/admin_screen.dart';
import 'package:api_lab/view/home/bloc/home_bloc.dart';
import 'package:api_lab/view/home/product_details_screen.dart';
import 'package:api_lab/view/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/product_container.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: darkblue,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            actionsIconTheme: IconThemeData(color: cold),
            title: Text(
              "Store",
              style: TextStyle(
                  color: cold, fontWeight: FontWeight.bold, fontSize: 35),
            ),
            actions: [
              IconButton(
                onPressed: () {
                  context.pushTo(view: AdminScreen());
                },
                icon: Icon(Icons.category_rounded),
              ),
              IconButton(
                onPressed: () {
                  context.pushTo(view: LoginScreen());
                },
                icon: Icon(Icons.logout_outlined),
              ),
            ],
          ),
          body: SafeArea(
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                final bloc = context.read<HomeBloc>();
                if (state is HomeLoadingState) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is HomeLoadDataState) {
                  return DefaultTabController(
                    length: state.category.length + 1,
                    child: Column(
                      children: [
                        Divider(
                          color: cold,
                        ),
                        TabBar(
                          isScrollable: true,
                          tabAlignment: TabAlignment.start,
                          indicatorColor: text,
                          indicatorSize: TabBarIndicatorSize.tab,
                          labelColor: text,
                          labelStyle: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                          unselectedLabelColor: cold,
                          indicatorPadding: EdgeInsets.symmetric(horizontal: 8),
                          labelPadding: EdgeInsets.symmetric(horizontal: 32),
                          dividerColor: Colors.transparent,
                          tabs: [
                            Tab(
                              text: "All",
                            ),
                            ...List.generate(
                              state.category.length,
                              (index) {
                                return Tab(
                                  text: "${state.category[index].name}",
                                );
                              },
                            ),
                          ],
                        ),
                        SingleChildScrollView(
                          child: SizedBox(
                            width: context.getWidth(),
                            height: context.getHeight() * 0.70,
                            child: TabBarView(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: GridView.builder(
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                              childAspectRatio: 0.5,
                                              crossAxisSpacing: 10,
                                              mainAxisSpacing: 10),
                                      itemCount: state.productList.length,
                                      itemBuilder: (context, index) {
                                        final product =
                                            state.productList[index];
                                        return ProductContainer(
                                          image: product.images![0]
                                              .replaceAll('"', '')
                                              .replaceAll('[', '')
                                              .replaceAll(']', ''),
                                          price: product.price!,
                                          title: product.title!,
                                          onTap: () {
                                            context.read<HomeBloc>().add(
                                                HomeGetProductEvent(
                                                    id: product.id!));
                                            context.pushTo(
                                                view: ProductDetails());
                                          },
                                        );
                                      }),
                                ),
                                ...List.generate(state.category.length,
                                    (index) {
                                  return Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: GridView.builder(
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        childAspectRatio: 0.5,
                                        crossAxisSpacing: 10,
                                        mainAxisSpacing: 10,
                                      ),
                                      itemCount: bloc
                                          .getCategoryProducts(
                                              state.category[index].name!)
                                          .length,
                                      itemBuilder: (context, index) {
                                        final categoryProducts =
                                            bloc.getCategoryProducts(
                                                state.category[index].name!);
                                        if (categoryProducts != null &&
                                            index < categoryProducts.length) {
                                          final product =
                                              categoryProducts[index];
                                          return ProductContainer(
                                            image: product.images![0]
                                                .replaceAll('"', '')
                                                .replaceAll('[', '')
                                                .replaceAll(']', ''),
                                            price: product.price!,
                                            title: product.title!,
                                            onTap: () {
                                              context.read<HomeBloc>().add(
                                                  HomeGetProductEvent(
                                                      id: product.id!));
                                              context.pushTo(
                                                  view: ProductDetails());
                                            },
                                          );
                                        } else {
                                          return SizedBox();
                                        }
                                      },
                                    ),
                                  );
                                }),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Center(
                    child: Text(
                      "Error",
                      style: TextStyle(color: text),
                    ),
                  );
                }
              },
            ),
          ),
        );
      },
    );
  }
}
