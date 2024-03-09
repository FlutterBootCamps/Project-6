import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_week6_day3_lab/data_layer/home_data_layer.dart';
import 'package:flutter_week6_day3_lab/models/product_model.dart';
import 'package:meta/meta.dart';

part 'basket_event.dart';
part 'basket_state.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  BasketBloc() : super(BasketInitial()) {
    on<BasketEvent>((event, emit) {
      // TODO: implement event handler
    });
    on<AddProductToCartEvent>(addProduct);
    on<RemoveProductFromCartEvent>(removeProduct);
  }

  
  

  FutureOr<void> addProduct(AddProductToCartEvent event, Emitter<BasketState> emit) {
    bool isAdded = locator.addProductToCart(event.product);
    if(isAdded){
      emit(ModfiedBasketState(msg: "Product has been added to basket", isAdding: true));
    }else {
      emit(ModfiedBasketErrorState(msg: "Product is already in basket"));
    }
  }
  

  FutureOr<void> removeProduct(RemoveProductFromCartEvent event, Emitter<BasketState> emit) {
    locator.removeProductFromCart(event.product);
    emit(ModfiedBasketState(msg: "Product has been removed from basket", isAdding: false));
  }
}