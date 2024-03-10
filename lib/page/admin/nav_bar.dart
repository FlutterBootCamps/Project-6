

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/page/admin/admin_user_page.dart';
import 'package:my_store/page/admin/bloc/nav_bar_admin_bloc.dart';
import 'package:my_store/helper/extention/const_color.dart';
import 'package:my_store/page/admin/category/admin_category_page.dart';
import 'package:my_store/page/admin/product/admin_product_page.dart';

class NavBarAdmin extends StatelessWidget {
  const NavBarAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = <Widget>[
      const AdminUsersPage(),
      const AdminProductPage(),
      const AdminCategoryPage()
    ];

    return BlocProvider(
      create: (context) => NavBarAdminBloc(),
      child: BlocBuilder<NavBarAdminBloc, NavBarAdminState>(
        builder: (context, state) {
          final navBloc = context.read<NavBarAdminBloc>();

          return Scaffold(
            bottomNavigationBar: BottomNavigationBar(
                backgroundColor: bodyColor,
                currentIndex: navBloc.selectIndex,
            showUnselectedLabels: true,selectedItemColor: Colors.yellow.shade400,unselectedItemColor:Colors.white,
                onTap: (value) {
                  navBloc.add(ChangeIndexEvent(value));
                },
                items: [

                  BottomNavigationBarItem(
                      icon: const Icon(Icons.person),
                      backgroundColor: bodyColor,
                      label: "profile"),
                                        BottomNavigationBarItem(
                      icon: const Icon(Icons.shelves),
                      backgroundColor: bodyColor,
                      label: "product"),
                                        BottomNavigationBarItem(
                      icon: const Icon(Icons.filter_alt),
                      backgroundColor: bodyColor,
                      label: "category"),
                ]),
            body: pages[navBloc.selectIndex],
          );
        },
      ),
    );
  }
}
