import 'dart:async';

import 'package:api_app/models/proudect_model.dart';
import 'package:api_app/view/cart_screen.dart';
import 'package:api_app/view/home_screen.dart';
import 'package:api_app/view/user_screen.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';


part 'bottom_nav_bloc_event.dart';
part 'bottom_nav_bloc_state.dart';

class BottomNavBlocBloc extends Bloc<BottomNavBlocEvent, BottomNavBlocState> {
  final List views =[
    HomeScreen(),
    CartScreen(),
    UserScreen(),
  ];
  int screenindex =0;
  BottomNavBlocBloc() : super(BottomNavBlocInitial()) {
    on<BottomNavBlocEvent>((event, emit) {
      // TODO: implement event handler
    });
        on<ShowEvent>((event, emit) async{
          //final network =AlProduct();
    //  emit(SuccessProudectState(proudect1:AlProduct.map((e) => AllProduct.fromJson(e)).toList()));
    // await network.createAllProductApi(productapi: null);
  });
 
on<MoveScreenEvent>(changeview);
  }
  FutureOr<void> changeview(
MoveScreenEvent event, Emitter<BottomNavBlocState>emit){
    print(event.selectindex);
    screenindex = event.selectindex;
    emit(SuccessState());
  }
}
