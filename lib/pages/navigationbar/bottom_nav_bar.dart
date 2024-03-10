import 'package:api_page_lab/constant/colors.dart';
import 'package:api_page_lab/pages/categoris_page.dart';
import 'package:api_page_lab/pages/home/home_page.dart';
import 'package:api_page_lab/pages/profile/profile_page.dart';
import 'package:api_page_lab/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/navigation_bar_bloc.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBar();
}

class _BottomNavBar extends State<BottomNavBar> {
  final List<Widget> _pages = [
    const HomePage(),
     CategorisPage(),
    const ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NavigationBarBloc, NavigationBarState>(
      builder: (context, state) {
        if (state is SuccessState) {
          return Scaffold(
              body: _pages[state.currentIndex],
              bottomNavigationBar: Container(
                child: BottomNavigationBar(
                  selectedLabelStyle:
                      const TextStyle(fontWeight: FontWeight.bold),
                  unselectedLabelStyle:
                      const TextStyle(fontWeight: FontWeight.bold),
                  unselectedFontSize: 9,
                  selectedFontSize: 9,
                  showUnselectedLabels: true,
                  currentIndex: state.currentIndex,
                  backgroundColor: whiteColor,
                  selectedItemColor: blackColor,
                  unselectedItemColor: Colors.grey,
                  onTap: (index) {
                    context
                        .read<NavigationBarBloc>()
                        .add(ChangeThePageEvent(currentIndex: index));
                  },
                  items: const [
                    BottomNavigationBarItem(
                      // backgroundColor: blackColor,
                      icon: Icon(Icons.home_outlined),
                      label: ("HOME"),
                    ),
                    BottomNavigationBarItem(
                        // backgroundColor: blackColor,
                        icon: Icon(Icons.category_outlined),
                        label: "CATEGORIES"),
                    BottomNavigationBarItem(
                        // backgroundColor: blackColor,
                        icon: Icon(Icons.person_outline_sharp),
                        label: "PROFILE"),
                  ],
                ),
              ));
        }
        return const Text("Error");
      },
    );
  }
}
