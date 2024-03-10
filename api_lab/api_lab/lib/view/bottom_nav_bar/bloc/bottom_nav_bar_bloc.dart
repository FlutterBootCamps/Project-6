import 'dart:async';

import 'package:api_lab/view/home/home_screen.dart';
import 'package:api_lab/view/profile/profile_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'bottom_nav_bar_event.dart';
part 'bottom_nav_bar_state.dart';

class BottomNavBarBloc extends Bloc<BottomNavBarEvent, BottomNavBarState> {
  int currentIndex = 0;
  List<Widget> pages = [
    HomeScreen(),
    ProfileScreen(),
  ];
  BottomNavBarBloc() : super(BottomNavBarInitial()) {
       on<ChangePageEvent>(methodChangePage);
    
  }

  FutureOr<void> methodChangePage(ChangePageEvent event, Emitter<BottomNavBarState> emit) {
    currentIndex = event.indexPage;
    emit(ChangePageState());
  }
}
