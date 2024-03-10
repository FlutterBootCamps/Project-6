
import 'package:asignmet4/helper/colors.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../pages/account_screen.dart';
import '../pages/explore_screen.dart';
import '../pages/home_screen.dart';

class NavBottom extends StatefulWidget {
  const NavBottom({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NavBottomState createState() => _NavBottomState();
}

class _NavBottomState extends State<NavBottom> {
  
  int _selectedIndex = 0;

  final List<Widget> _pages = [
      HomeScreen(),
      ExploreScreen(),
     const AccountScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
backgroundColor: dark,
    
      body: _pages.elementAt(_selectedIndex),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: dark,
        color: white,
        animationDuration: const Duration(milliseconds: 300),
       onTap: _onItemTapped,
        items: const [

            Icon(Icons.home,color: dark),

            Icon(Icons.explore_outlined,color: dark),

         Icon(Icons.account_circle_outlined,color: dark),
          
        ],
       
       
      ),
    );
  }
}
