import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

part 'bottom_navigation_bar_event.dart';
part 'bottom_navigation_bar_state.dart';

class BottomNavigationBarBloc extends Bloc<BottomNavigationBarEvent, BottomNavigationBarState> {
    int selectIndex=0;
  BottomNavigationBarBloc() : super(BottomNavigationBarInitial()) {
    on<BottomNavigationBarEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<ChangeIndexEvent>(ChangeIndex);
  }

  FutureOr<void> ChangeIndex(ChangeIndexEvent event, Emitter<BottomNavigationBarState> emit) {
    print(event.index);
    selectIndex=event.index;
emit(SuccessChangeIndex());
  }
}
