import 'package:api_page_lab/controller/home_controller.dart';
import 'package:api_page_lab/models/categorise_model.dart';
import 'package:api_page_lab/models/product_model.dart';
import 'package:api_page_lab/services/setup.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final categoryController = locater.get<HomeController>();
  CategoryBloc() : super(CategoryInitial()) {
    on<CategoryEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<fetchCategoriesEvent>((event, emit) async {
      emit(LoadingState());
      List<CategorisModel>? categoriesList =
          await categoryController.fetchCategories();
      if (categoriesList == null) {
        emit(ErrorState());
      }else{
        emit(SuccessState(categories: categoriesList));
      }
    });
  }
}
