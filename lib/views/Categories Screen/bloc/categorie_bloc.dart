import 'package:project/services/categories_api.dart';
import 'package:project/views/Categories%20Screen/bloc/categorie_event.dart';
import 'package:project/views/Categories%20Screen/bloc/categorie_state.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
class CategoriesBloc extends Bloc<CategoriesEvent, CategoriesState> {
  CategoriesBloc() : super(CategoriesInitial()) {
    on<ShowCategoriesEvent>((event, emit) async{
      emit(LoadingCategoriesState());
      try {
        final loadCategories = await GetApi().getCategories();
        emit(SuccessCategoriesState(categories:loadCategories ));
      } catch (e) {
        emit(ErrorCategoriesState());
      }
    });
  }
}



