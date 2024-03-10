import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'navigation_bar_event.dart';
part 'navigation_bar_state.dart';

class NavigationBarBloc extends Bloc<NavigationBarEvent, NavigationBarState> {
  NavigationBarBloc() : super(SuccessState(0)) {
    on<NavigationBarEvent>((event, emit) {
      int currentIndex = 0;
      emit(SuccessState(currentIndex));
    });
    on<ChangeThePageEvent>(ChangePageMethod);
  }

  //change the Navigator index when there are event on tabs
  FutureOr<void> ChangePageMethod(
      ChangeThePageEvent event, Emitter<NavigationBarState> emit) {
    emit(SuccessState(event.currentIndex));
  }
}
