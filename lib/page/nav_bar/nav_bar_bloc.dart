import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/page/filter/category_select_page.dart';
import 'package:my_store/page/log_in/login.dart';
import 'package:my_store/helper/extention/const_color.dart';
import 'bloc/bottom_navigation_bar_bloc.dart';

class BottomNavigationBarPage extends StatelessWidget {
  const BottomNavigationBarPage({super.key});


  @override
  Widget build(BuildContext context) {
    final navBloc = context.read<BottomNavigationBarBloc>();
  List<Widget> pages = <Widget>[CategoryPage(),MyLogin()];


    return BlocBuilder<BottomNavigationBarBloc, BottomNavigationBarState>(
      builder: (context, state) {
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: bodyColor,
            currentIndex:navBloc.selectIndex,
            showUnselectedLabels: true,selectedItemColor: Colors.yellow.shade400,unselectedItemColor:Colors.white,

              onTap: (value) {
                navBloc.add(ChangeIndexEvent(value));
              },
              items: [
                BottomNavigationBarItem(icon:Icon(Icons.store),backgroundColor: bodyColor, label: "Shop",),
                BottomNavigationBarItem(icon: Icon(Icons.person),backgroundColor: bodyColor, label: "profile"),
                ]),body: pages[navBloc.selectIndex],
        );
      },
    );
  }
}
