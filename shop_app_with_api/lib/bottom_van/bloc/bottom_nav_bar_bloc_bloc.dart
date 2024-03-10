import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shop_app_with_api/screens/all_user.dart';
import 'package:shop_app_with_api/screens/cart_screen.dart';
import 'package:shop_app_with_api/screens/categories_screen.dart';
import 'package:shop_app_with_api/screens/products_screen.dart';

part 'bottom_nav_bar_bloc_event.dart';
part 'bottom_nav_bar_bloc_state.dart';

class BottomNavBarBlocBloc extends Bloc<BottomNavBarBlocEvent, BottomNavBarBlocState> {
  
    int selectedScreen = 0 ;
  List<Widget> screens = [
    const CategoriesScreen(),
    const ProductsScreen(),
    const AllUsers(),
    ];
    
  BottomNavBarBlocBloc() : super(BottomNavBarBlocInitial()) {
   
    on<ChangeNavEvent>(methodChangeNav);
  }
  
  FutureOr<void> methodChangeNav(ChangeNavEvent event, Emitter<BottomNavBarBlocState> emit) {
     selectedScreen = event.index;
    emit(SuccessChangeNavState(index: selectedScreen));
  }
}

