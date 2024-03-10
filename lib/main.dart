import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/views/Categories%20Screen/bloc/categorie_bloc.dart';
import 'package:project/views/Log%20In%20Screen/bloc/login_bloc.dart';
import 'package:project/views/Products%20Screen/bloc/product_bloc.dart';
import 'views/Sign Up Screen/sign_up.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => ProductBloc(),
      ),
      BlocProvider(
        create: (context) => CategoriesBloc(),
      ),
      BlocProvider(
        create: (context) => LoginBloc(),
      ),
    ],
    child: const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SignUpScreen(),
    ),
  ));
}
