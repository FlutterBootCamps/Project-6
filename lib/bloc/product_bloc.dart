import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_week6_day3_lab/data_layer/home_data_layer.dart';
import 'package:flutter_week6_day3_lab/models/category_model.dart';
import 'package:flutter_week6_day3_lab/models/product_model.dart';
import 'package:flutter_week6_day3_lab/services/category_service.dart';
import 'package:flutter_week6_day3_lab/services/product_service.dart';
import 'package:flutter_week6_day3_lab/widgets/product_card.dart';
import 'package:meta/meta.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<ProductEvent>((event, emit) {});

    on<GetAllProductsEvent>(getAllProducts);
    on<GetSearchedProductsEvent>(getSearchedProducts);
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

  FutureOr<void> getSearchedProducts(
      GetSearchedProductsEvent event, Emitter<ProductState> emit) async {
    emit(DisplaySearchedProductsLoadingState());
    if (event.searchText.trim().isEmpty) {
      emit(DisplaySearchedProductsErrorState(
          msg: "Please fill the search field to search for products"));
    } else {
      try {
        List<ProductCard> productCardList =
            await locator.getSearchedProducts(event.searchText);
        emit(DisplaySearchedProductsState(productCardList: productCardList));
      } catch (e) {
        emit(DisplaySearchedProductsErrorState(
            msg:
                "There's a problem with our serivce, please try again later..."));
      }
    }
  }

}
