import 'package:api_page_lab/controller/home_controller.dart';
import 'package:api_page_lab/models/product_model.dart';
import 'package:api_page_lab/services/setup.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final homeController = locater.get<HomeController>();

  ProductBloc() : super(ProductInitial()) {
    on<ProductEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<fetchProductsEvent>((event, emit) async {
      emit(ProductLoadingState());
      List<ProdutModel>? productsList = await homeController.fetchProducts();
      if (productsList == null) {
        emit(ErrorState());
      } else {
        emit(ProductSuccessState(productsList: productsList));
      }
    });
  }
}
