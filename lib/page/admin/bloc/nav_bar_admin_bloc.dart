import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'nav_bar_admin_event.dart';
part 'nav_bar_admin_state.dart';

class NavBarAdminBloc extends Bloc<NavBarAdminEvent, NavBarAdminState> {
     int selectIndex=0;

  NavBarAdminBloc() : super(NavBarAdminInitial()) {
    on<NavBarAdminEvent>((event, emit) {
      // TODO: implement event handler
    });
        on<ChangeIndexEvent>(ChangeIndex);

  }
    FutureOr<void> ChangeIndex(ChangeIndexEvent event, Emitter<NavBarAdminState> emit) {
    print(event.index);
    selectIndex=event.index;
emit(SuccessChangeIndex());
  }
}
