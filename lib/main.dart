import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/page/nav_bar/bloc/bottom_navigation_bar_bloc.dart';
import 'package:my_store/page/nav_bar/nav_bar_bloc.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavigationBarBloc(),
      child: const MaterialApp(
        home: BottomNavigationBarPage(),
      ),
    );
  }
}
