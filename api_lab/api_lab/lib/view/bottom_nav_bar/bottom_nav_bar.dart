import 'package:api_lab/constant/colors.dart';
import 'package:api_lab/view/bottom_nav_bar/bloc/bottom_nav_bar_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavBarBloc, BottomNavBarState>(
      builder: (context, state) {
        final bloc = context.read<BottomNavBarBloc>();
        return Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: blue,
            unselectedItemColor:cold ,
            selectedItemColor: text,
            selectedFontSize: 20,
            unselectedFontSize: 20,
            type: BottomNavigationBarType.fixed,
            onTap: (value) {
              bloc.add(ChangePageEvent(indexPage: value));
            },
            currentIndex: bloc.currentIndex,
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.home,
                    size: 30,
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.person,
                    size: 30,
                  ),
                  label: 'Profile'),
            ],
          ),
          body: bloc.pages[bloc.currentIndex],
        );
      },
    );
  }
}
