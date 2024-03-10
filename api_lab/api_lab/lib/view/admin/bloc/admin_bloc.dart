import 'dart:async';

import 'package:api_lab/model/product_model.dart';
import 'package:api_lab/model/user_model.dart';
import 'package:api_lab/services/product_api/product_api.dart';
import 'package:api_lab/services/user_api/user_services.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'admin_event.dart';
part 'admin_state.dart';

class AdminBloc extends Bloc<AdminEvent, AdminState> {
  AdminBloc() : super(AdminInitial()) {
    on<AdminEvent>((event, emit) {});
    on<AdminLoadEvent>(methodLoadData);
    on<AdminSearchEvent>(methodSearch);
    on<AdminCreateCategoryEvent>(methodCerateCategory);
    on<AdminCreateProductEvent>(methodCerateProduct);
  }

  FutureOr<void> methodLoadData(
      AdminLoadEvent event, Emitter<AdminState> emit) async {
    emit(AdminLoadingState());
    try {
      var loadUsersList = await UserServices().getAllUsers();
      emit(AdminLoadState(users: loadUsersList));
    } catch (e) {
      emit(AdminErrorState(msg: "Error"));
    }
  }

  FutureOr<void> methodSearch(
      AdminSearchEvent event, Emitter<AdminState> emit) async {
    emit(AdminLoadingState());

    if (event.search.trim() == "") {
      try {
        var loadUsersList = await UserServices().getAllUsers();
        emit(AdminLoadState(users: loadUsersList));
      } catch (e) {
        emit(AdminErrorState(msg: "Error"));
      }
    } else {
      try {
        int id = int.parse(event.search);
        var loadUser = await UserServices().getUser(id: id);
        emit(AdminSearchState(user: loadUser));
      } catch (e) {
        emit(AdminErrorState(msg: "ُError"));
      }
    }
  }

  FutureOr<void> methodCerateCategory(
      AdminCreateCategoryEvent event, Emitter<AdminState> emit) async {
    emit(AdminLoadingState());
    try {
      await ProductServices().createCategory(name: event.category);
      if (event.category.trim().isNotEmpty) {
        emit(AdminSuccessState(msg: "Category added Successful"));
      } else {
        emit(AdminErrorState(msg: "Error field is empty"));
      }
    } catch (e) {
      emit(AdminErrorState(msg: "Error"));
    }
  }

  FutureOr<void> methodCerateProduct(
      AdminCreateProductEvent event, Emitter<AdminState> emit) async {
    emit(AdminLoadingState());

    try {
      await ProductServices().createProduct(
          title: event.title,
          price: event.price,
          categoryId: event.categoryId,
          description: event.description);

      if (event.title.trim().isNotEmpty &&
          event.description.trim().isNotEmpty) {
        emit(AdminSuccessState(msg: "Product added successfully"));
      } else {
        emit(AdminErrorState(msg: "Error: Required field is empty"));
      }
    } catch (e) {
      print(e);
      emit(AdminErrorState(msg: "Error: $e"));
    }
  }
}
