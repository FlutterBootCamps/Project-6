import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_with_api/bottom_van/bloc/bottom_nav_bar_bloc_bloc.dart';
import 'package:shop_app_with_api/constant/color.dart';
import 'package:shop_app_with_api/screens/all_user.dart';
import 'package:shop_app_with_api/screens/categories_screen.dart';
import 'package:shop_app_with_api/screens/products_screen.dart';


class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<BottomNavBarBlocBloc>();
    return BlocBuilder<BottomNavBarBlocBloc, BottomNavBarBlocState>(
      builder: (context, state) {
        return DefaultTabController(
          length: 3,
          child: Scaffold(
            body: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("asset/background.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: const TabBarView(children: [
                // HomeScreen(),
                CategoriesScreen(),
                ProductsScreen(),
                AllUsers(),
                // ShoppingCart(),
              ]),
            ),
            bottomNavigationBar: Material(
              color: white,
              child: TabBar(
                onTap: (value) {
                  bloc.add(ChangeNavEvent(index: value));
                },
                indicatorSize: TabBarIndicatorSize.tab,
                tabAlignment: TabAlignment.center,
                indicatorColor: tiffany,
                indicator: const BoxDecoration(
                  border: Border(
                    top: BorderSide(color: tiffany, width: 3),
                  ),
                ),
                labelPadding: const EdgeInsets.symmetric(horizontal: 42),
                unselectedLabelStyle: const TextStyle(
                    fontSize: 14, fontWeight: FontWeight.bold, color: grey),
                labelStyle: const TextStyle(
                    fontSize: 14, fontWeight: FontWeight.bold, color: tiffany),
                tabs: const [
                  Tab(
                    icon: Icon(
                      Icons.home_filled,
                    ),
                    text: "Home",
                  ),
                  Tab(
                    icon: Icon(
                      Icons.menu,
                    ),
                    text: "Products",
                  ),
                  Tab(
                    icon: Icon(
                      Icons.person,
                      // Icons.shopping_bag,
                    ),
                    text: "Users",
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
