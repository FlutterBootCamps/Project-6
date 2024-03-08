import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_week6_day3_lab/bloc/product_bloc.dart';
import 'package:flutter_week6_day3_lab/bloc/user_bloc.dart';
import 'package:flutter_week6_day3_lab/screens/navigation_page.dart';
import 'package:flutter_week6_day3_lab/screens/signup_page.dart';
import 'package:flutter_week6_day3_lab/utils/setup.dart';

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
          create: (context) => UserBloc(),
        ),
        BlocProvider(
          create: (context) => ProductBloc(),
        ),
      ],
      child: const MaterialApp(
          debugShowCheckedModeBanner: false, home: NavigationPage()),
    );
  }
}
