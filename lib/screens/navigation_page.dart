import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_week6_day3_lab/bloc/navigation_bloc.dart';
import 'package:flutter_week6_day3_lab/data_layer/home_data_layer.dart';
import 'package:flutter_week6_day3_lab/helpers/extensions/screen_helper.dart';
import 'package:flutter_week6_day3_lab/screens/profile_page.dart';
import 'package:flutter_week6_day3_lab/utils/colors.dart';
import 'package:flutter_week6_day3_lab/utils/fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class NavigationPage extends StatelessWidget {
  const NavigationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationBloc(),
      child: Scaffold(
        appBar: AppBar(
        leading: IconButton(onPressed: (){}, icon: const FaIcon(FontAwesomeIcons.barsStaggered, color: blackColor,)),
        title: const Text("Thingzz", style: TextStyle(color: blackColor, fontFamily: playFairFont, fontSize: 22, fontWeight: FontWeight.bold),),
        actions: [IconButton(onPressed: (){
          context.push(context, ProfilePage(), true);
        }, icon: const FaIcon(FontAwesomeIcons.solidUser, color: blackColor,))],
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
                        .add(ChangePageEvent(index: index));
                  },
                  selectedItemColor: blackColor,
                  showUnselectedLabels: false,
                  showSelectedLabels: true,
                  type: BottomNavigationBarType.fixed,
                  currentIndex: locator.currentPageIndex,
                  backgroundColor: whiteColor,
                  items: const [
                    BottomNavigationBarItem(
                      label: "Home",
                      activeIcon: FaIcon(
                        FontAwesomeIcons.house,
                        color: blackColor,
                      ),
                      icon: FaIcon(
                        FontAwesomeIcons.house,
                        color: greyColor,
                      ),
                    ),
                    BottomNavigationBarItem(
                      label: "Search",
                      activeIcon: FaIcon(
                        FontAwesomeIcons.magnifyingGlass,
                        color: blackColor,
                      ),
                      icon: FaIcon(
                        FontAwesomeIcons.magnifyingGlass,
                        color: greyColor,
                      ),
                    ),
                    BottomNavigationBarItem(
                      label: "Basket",
                      activeIcon: FaIcon(
                        FontAwesomeIcons.basketShopping,
                        color: blackColor,
                      ),
                      icon: FaIcon(
                        FontAwesomeIcons.basketShopping,
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
            return locator.pageList[locator.currentPageIndex];
          },
        ),
      ),
    );
  }
}
