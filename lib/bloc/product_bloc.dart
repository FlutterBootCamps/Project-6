import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_week6_day3_lab/data_layer/home_data_layer.dart';
import 'package:flutter_week6_day3_lab/models/category_model.dart';
import 'package:flutter_week6_day3_lab/models/product_model.dart';
import 'package:flutter_week6_day3_lab/services/category_service.dart';
import 'package:flutter_week6_day3_lab/services/product_service.dart';
import 'package:meta/meta.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<ProductEvent>((event, emit) {});

    on<GetAllProductsEvent>(getAllProducts);
  }

  FutureOr<void> getAllProducts(
      GetAllProductsEvent event, Emitter<ProductState> emit) async {
    emit(DisplayProductsLoadingState());

    try {
      List<ProductCategory> categoryList =
          await CategoryService().getAllCategories();
      locator.categoryList = categoryList;
      List<Product> productList = await ProductService().getAllProducts();
      locator.productList = productList;
      emit(DisplayProductsState(
          categoryList: categoryList, allProductsList: productList));
    } catch (e) {
      emit(DisplayProductsErrorState(
          msg:
              "There's a problem with our serivce, please try again later..."));
    }
  }
}
