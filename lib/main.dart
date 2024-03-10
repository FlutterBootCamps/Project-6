import 'package:api_page_lab/pages/home/bloc/category_bloc.dart';
import 'package:api_page_lab/pages/home/bloc/drop_down_bloc/bloc/drop_down_bloc.dart';
import 'package:api_page_lab/pages/home/bloc/product_bloc.dart';
import 'package:api_page_lab/pages/login/login_page.dart';
import 'package:api_page_lab/pages/navigationbar/bottom_nav_bar.dart';
import 'package:api_page_lab/pages/navigationbar/bloc/navigation_bar_bloc.dart';
import 'package:api_page_lab/pages/profile/bloc/profile_bloc.dart';
import 'package:api_page_lab/pages/signup_page.dart';
import 'package:api_page_lab/services/setup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NavigationBarBloc(),
        ),
        BlocProvider(
          create: (context) => CategoryBloc(),
        ),
        BlocProvider(
          create: (context) => ProductBloc(),
        ),
        BlocProvider(
          create: (context) => DropDownBloc(),
        ),
        BlocProvider(
          create: (context) => ProfileBloc(),
        ),
      ],
      child: MaterialApp(home: LoginPage()),
    );
  }
}
