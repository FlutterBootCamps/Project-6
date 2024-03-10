import 'package:asignmet4/bloc/store_bloc.dart';

import 'package:asignmet4/pages/welcome_screen.dart';
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
      create: (context) => StoreBloc(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
         home: WelcomePage()),
    );
  }
}
