import 'package:api_lab/view/admin/admin_screen.dart';
import 'package:api_lab/view/admin/bloc/admin_bloc.dart';
import 'package:api_lab/view/bottom_nav_bar/bloc/bottom_nav_bar_bloc.dart';
import 'package:api_lab/view/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:api_lab/view/home/bloc/home_bloc.dart';
import 'package:api_lab/view/login/bloc/login_bloc.dart';
import 'package:api_lab/view/profile/bloc/profile_bloc.dart';
import 'package:api_lab/view/profile/profile_screen.dart';
import 'package:api_lab/view/singup/bloc/signup_bloc.dart';
import 'package:api_lab/view/singup/singup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SignupBloc(),
        ),
        BlocProvider(
          create: (context) => LoginBloc(),
        ),
        BlocProvider(
          create: (context) => HomeBloc()..add(HomeLoadDataEvent()),
        ),
        BlocProvider(
          create: (context) => ProfileBloc(),
        ),
        BlocProvider(
          create: (context) => AdminBloc()..add(AdminLoadEvent()),
        ),
        BlocProvider(
          create: (context) => BottomNavBarBloc(),
        ),
      ],
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SignupScreen(),
      ),
    );
  }
}
