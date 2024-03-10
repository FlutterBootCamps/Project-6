
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:project/core/utils/constant_color.dart';
import 'package:project/views/Cart%20Screen/cart.dart';
import 'package:project/views/Categories%20Screen/categories.dart';
import 'package:project/views/Products%20Screen/products.dart';
import 'package:project/views/Profile%20Screen/profile.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /// Controller to handle PageView and also handles initial page
  final _pageController = PageController(initialPage: 0);

  /// Controller to handle bottom nav bar and also handles initial page
  final _controller = NotchBottomBarController(index: 0);

  int maxCount = 5;

  @override
  
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  /// widget list
  final List<Widget> bottomBarPages = [
     DisplayProductsScreen(),
    CategoriesScreen(),
    CartScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: List.generate(bottomBarPages.length, (index) => bottomBarPages[index]),
      ),
      extendBody: true,
      bottomNavigationBar: (bottomBarPages.length <= maxCount)
          ? AnimatedNotchBottomBar(
              notchBottomBarController: _controller,
              color: Colors.white,
              showLabel: false,
              shadowElevation: 5,
              kBottomRadius: 28.0,
      
              notchColor: grey1,

              removeMargins: false,
              bottomBarWidth: 500,
              durationInMilliSeconds: 300,
              bottomBarItems: const [
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.home_filled,
                    color: Colors.blueGrey,
                  ),
                  activeItem: Icon(
                    Icons.home_filled,
                    color: bc,
                  ),
                  itemLabel: 'Page 1',
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.star,
                    color: Colors.blueGrey,
                  ),
                  activeItem: Icon(
                    Icons.star,
                    color: Colors.blueAccent,
                  ),
                  itemLabel: 'Page 2',
                ),

                ///svg example
                
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.shopping_basket_outlined,
                    color: Colors.blueGrey,
                  ),
                  activeItem: Icon(
                    Icons.shopping_basket_outlined,
                    color: Colors.pink,
                  ),
                  itemLabel: 'Page 3',
                ),
                BottomBarItem(
                  inActiveItem: Icon(
                    Icons.person,
                    color: Colors.blueGrey,
                  ),
                  activeItem: Icon(
                    Icons.person,
                    color: Colors.yellow,
                  ),
                  itemLabel: 'Page 4',
                ),
              ],
              onTap: (index) {
              
                _pageController.jumpToPage(index);
              },
              kIconSize: 24.0,
            )
          : null,
    );
  }
}


// class BottomNavBar extends StatefulWidget {
//   const BottomNavBar({Key? key}) : super(key: key);

//   @override
//   _BottomNavBarState createState() => _BottomNavBarState();
// }

// class _BottomNavBarState extends State<BottomNavBar> {
//   int _currentIndex = 0;

//   final List<Widget> _screens = [
//     DisplayProductsScreen(),
//     CategoriesScreen(),
//     CartScreen(),
//     ProfileScreen(),
//   ];

//   final List<String> _screenTitles = [
//     'Home',
//     'Categories',
//     'Cart',
//     'Profile',
//   ];

//   bool _showSearchIcon(int index) {
//     return index == 0 || index == 1;
//   }
//   void _onItemTapped(int index) {
//     setState(() {
//       _currentIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: green,
//         shadowColor: bc,
//         title: Text(_showSearchIcon(_currentIndex) ? "Search" : _screenTitles[_currentIndex]),
//         // Conditionally show search icon based on screen index
//         actions: _showSearchIcon(_currentIndex)
//             ? [
//                 IconButton(
//                   icon: Icon(Icons.search),
//                   onPressed: () {
//                     // Handle search action
//                   },
//                 ),
//               ]
//             : null,
//       ),
//       body: _screens[_currentIndex],
//       bottomNavigationBar: BottomNavigationBar(
        
      

//         currentIndex: _currentIndex,
//         unselectedItemColor: grey,
//         selectedItemColor: bc,
//         onTap: _onItemTapped,
//         items: const [
//           BottomNavigationBarItem(
//                   backgroundColor: lb,

//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//                   backgroundColor: am,

//             icon: Icon(Icons.category),
//             label: 'Categories',
//           ),
//           BottomNavigationBarItem(
//                   backgroundColor: am,

//             icon: Icon(Icons.shopping_cart),
//             label: 'Cart',
//           ),
//           BottomNavigationBarItem(
//                   backgroundColor: am,

//             icon: Icon(Icons.person),
//             label: 'Profile',
//           ),
//         ],
//       ),
//     );
//   }
// }
