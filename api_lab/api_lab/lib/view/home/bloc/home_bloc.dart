import 'dart:async';

import 'package:api_lab/model/product_model.dart';
import 'package:api_lab/services/product_api/product_api.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  List<ProductModel> products = [];
  List<ProductModel> allProducts = [];
  HomeBloc() : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {});
    on<HomeLoadDataEvent>(loadDataMethod);
    on<HomeGetProductEvent>(getProductDetailsMethod);
  }

  FutureOr<void> loadDataMethod(
      HomeLoadDataEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    try {
      var loadProductList = await ProductServices().getAllProducts();
      var loadCategoryList = await ProductServices().getAllCategory();
      allProducts = loadProductList;
      emit(HomeLoadDataState(
          productList: loadProductList, category: loadCategoryList));
    } catch (e) {
      emit(HomeErrorState());
    }
  }

  FutureOr<void> getProductDetailsMethod(
      HomeGetProductEvent event, Emitter<HomeState> emit) async {
    emit(HomeLoadingState());
    Future.delayed(Duration(seconds: 2));
    try {
      var loadData = await ProductServices().getProduct(id: event.id);
      emit(HomeLoadDataState(product: loadData, productList: [], category: []));
    } catch (e) {
      emit(HomeErrorState());
    }
  }

  List<ProductModel> getCategoryProducts(String category) {
    products.clear();
    for (var element in allProducts) {
      if (element.category!.name == category) {
        products.add(element);
      }
    }
    return products;
  }
}
