import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_week6_day3_lab/data_layer/home_data_layer.dart';
import 'package:meta/meta.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc() : super(NavigationInitial()) {
    on<NavigationEvent>((event, emit) {
    });

    on<ChangePageEvent>(changePage);
  }

  FutureOr<void> changePage(ChangePageEvent event, Emitter<NavigationState> emit) {
    locator.currentPageIndex = event.index;
    emit(ShowCurrentPageState());
  }
}
