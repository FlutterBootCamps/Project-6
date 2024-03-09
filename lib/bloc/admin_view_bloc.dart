import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_week6_day3_lab/models/category_model.dart';
import 'package:flutter_week6_day3_lab/models/product_model.dart';
import 'package:flutter_week6_day3_lab/models/user_model.dart';
import 'package:flutter_week6_day3_lab/services/category_service.dart';
import 'package:flutter_week6_day3_lab/services/product_service.dart';
import 'package:meta/meta.dart';

part 'admin_view_event.dart';
part 'admin_view_state.dart';

class AdminViewBloc extends Bloc<AdminViewEvent, AdminViewState> {
  AdminViewBloc() : super(AdminViewInitial()) {
    on<AdminViewEvent>((event, emit) {
    });

    on<ShowAllCategoriesEvent>(showAllCategories);
    on<ShowOneCategoryEvent>(showOneCategory);
    on<AddCategoryEvent>(addCategory);
    on<EditCategoryEvent>(editCategory);

    on<ShowAllProductsEvent>(showAllProducts);
    on<ShowOneProductEvent>(showOneProduct);
    on<AddProductEvent>(addProduct);
    on<EditProductEvent>(editProduct);
  }

  FutureOr<void> showAllCategories(ShowAllCategoriesEvent event, Emitter<AdminViewState> emit) async{
    emit(LoadingState());

    try {
      List<ProductCategory> categoryList = await CategoryService().getAllCategories();
      emit(ShowingCategoriesState(categoryList: categoryList));
    } catch (e) {
      emit(ErrorState(msg: "Error in getting all categories"));
    }
  }

  FutureOr<void> showOneCategory(ShowOneCategoryEvent event, Emitter<AdminViewState> emit) async{
    emit(LoadingState());

    try {
      ProductCategory category = await CategoryService().getOneCategory(event.id);
      emit(ShowingOneCategoryState(category: category));
    } catch (e) {
      emit(ErrorState(msg: "No category found for this id"));
    }
  }

  FutureOr<void> addCategory(AddCategoryEvent event, Emitter<AdminViewState> emit) {
    if (event.text.trim().isNotEmpty){
      try {
        CategoryService().addCategory(name: event.text);
        emit(AddedEditiedCategoryState(msg: "${event.text} category has been added"));
      } catch (e) {
        emit(ErrorState(msg: "Our services are currntly unavilable, please try again later..."));
      }
    }else {
      emit(ErrorState(msg: "Please fill the name textfield."));
    }
    
  }

  FutureOr<void> editCategory(EditCategoryEvent event, Emitter<AdminViewState> emit) {
    if(event.text.trim().isNotEmpty){
      try {
        CategoryService().editCategory(name: event.text, id: event.id);
        emit(AddedEditiedCategoryState(msg: "category's name has been changed to ${event.text}"));
      } catch (e) {
        emit(ErrorState(msg: "Our services are currntly unavilable, please try again later..."));
      }
    }else {
      emit(ErrorState(msg: "Please fill the name textfield."));
    }
  }

  FutureOr<void> showAllProducts(ShowAllProductsEvent event, Emitter<AdminViewState> emit) async{
    emit(LoadingState());

    try {
      List<Product> productList = await ProductService().getAllProducts();
      emit(ShowingProductsState(productList: productList));
    } catch (e) {
      emit(ErrorState(msg: "Error in getting all Products"));
    }
  }

  FutureOr<void> showOneProduct(ShowOneProductEvent event, Emitter<AdminViewState> emit) async{
    emit(LoadingState());

    try {
      Product product = await ProductService().getOneProduct(event.id);
      emit(ShowingOneProductState(product: product));
    } catch (e) {
      emit(ErrorState(msg: "No product found for this id"));
    }
  }

  FutureOr<void> addProduct(AddProductEvent event, Emitter<AdminViewState> emit) {
    if (event.title.trim().isNotEmpty && event.price.toString().trim().isNotEmpty && event.description.trim().isNotEmpty && event.categoryId.toString().trim().isNotEmpty){
      try {
        ProductService().addProduct(title: event.title, price: event.price, description: event.description, categoryId: event.categoryId, imageUrl: event.image);
        emit(AddedEditiedCategoryState(msg: "${event.title} product has been added"));
      } catch (e) {
        emit(ErrorState(msg: "Our services are currntly unavilable, please try again later..."));
      }
    }else {
      emit(ErrorState(msg: "Please fill all text fields."));
    }
  }

  FutureOr<void> editProduct(EditProductEvent event, Emitter<AdminViewState> emit) {
    if(event.title.trim().isNotEmpty && event.price.toString().trim().isNotEmpty && event.image.trim().isNotEmpty){
      try {
        ProductService().editProduct(title: event.title, price: event.price, imageUrl: event.image, id: event.id);
        emit(AddedEditiedProductState(msg: "${event.title} product has been edited."));
      } catch (e) {
        emit(ErrorState(msg: "Our services are currntly unavilable, please try again later..."));   
      }
    }else {
      emit(ErrorState(msg: "Please fill all text fields."));
    }
  }
}
