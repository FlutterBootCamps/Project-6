import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_week6_day3_lab/bloc/navigation_bloc.dart';
import 'package:flutter_week6_day3_lab/data_layer/home_data_layer.dart';
import 'package:flutter_week6_day3_lab/utils/colors.dart';
import 'package:flutter_week6_day3_lab/utils/fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AdminNavigationPage extends StatelessWidget {
  const AdminNavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationBloc(),
      child: Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: blackColor,
              )),
          title: const Text(
            "Admin Page",
            style: TextStyle(
                color: blackColor,
                fontFamily: workSansFont,
                fontSize: 22,
                fontWeight: FontWeight.w500),
          ),
        ),
        bottomNavigationBar: Container(
          padding: const EdgeInsets.only(left: 12, right: 12, bottom: 12),
          decoration: const BoxDecoration(boxShadow: [
            BoxShadow(
                color: shadowBlackColor,
                spreadRadius: 0,
                blurRadius: 56,
                offset: Offset(0, 14))
          ]),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(40),
            child: BlocBuilder<NavigationBloc, NavigationState>(
              builder: (context, state) {
                return BottomNavigationBar(
                  onTap: (index) {
                    context
                        .read<NavigationBloc>()
                        .add(ChangeAdminPageEvent(index: index));
                  },
                  selectedItemColor: blackColor,
                  showUnselectedLabels: false,
                  showSelectedLabels: true,
                  type: BottomNavigationBarType.fixed,
                  currentIndex: locator.currentAdminPageIndex,
                  backgroundColor: whiteColor,
                  items: const [
                    BottomNavigationBarItem(
                      label: "Categories",
                      activeIcon: Icon(
                        Icons.grid_view_rounded,
                        color: blackColor,
                      ),
                      icon: Icon(
                        Icons.grid_view_rounded,
                        color: greyColor,
                      ),
                    ),
                    BottomNavigationBarItem(
                      label: "Products",
                      activeIcon: FaIcon(
                        FontAwesomeIcons.cubes,
                        color: blackColor,
                      ),
                      icon: FaIcon(
                        FontAwesomeIcons.cubes,
                        color: greyColor,
                      ),
                    ),
                    BottomNavigationBarItem(
                      label: "Users",
                      activeIcon: FaIcon(
                        FontAwesomeIcons.userGroup,
                        color: blackColor,
                      ),
                      icon: FaIcon(
                        FontAwesomeIcons.userGroup,
                        color: greyColor,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
        body: BlocBuilder<NavigationBloc, NavigationState>(
          builder: (context, state) {
            return locator.adminPageList[locator.currentAdminPageIndex];
          },
        ),
      ),
    );
  }
}
