import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_with_api/bloc/registration_bloc.dart';
import 'package:shop_app_with_api/bottom_van/bloc/bottom_nav_bar_bloc_bloc.dart';
import 'package:shop_app_with_api/bottom_van/bottom_nav_bar.dart';
import 'package:shop_app_with_api/screens/sign_up_screen.dart';
import 'package:shop_app_with_api/screens/test.dart';
// import 'package:shop_app_with_api/screens/all_user.dart';
// import 'package:shop_app_with_api/screens/categories_screen.dart';
// import 'package:shop_app_with_api/screens/home_screen.dart';
// import 'package:shop_app_with_api/screens/login_screen.dart';
// import 'package:shop_app_with_api/screens/product_details_screen.dart';
// import 'package:shop_app_with_api/screens/sign_up_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => BottomNavBarBlocBloc(),
        ),
        BlocProvider(
          create: (context) => RegistrationBloc(),
        ),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: 
        BottomNavBar(),
      ),
    );
  }
}
