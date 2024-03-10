import 'package:api_app/bloc/bottom_nav_bloc_bloc.dart';

import 'package:api_app/screens/sign_up/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => BottomNavBlocBloc(),
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LogInScreen()));
  }
}
