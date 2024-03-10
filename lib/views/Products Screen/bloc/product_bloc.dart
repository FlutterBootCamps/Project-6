
import 'package:project/services/get_all_products_end_point.dart';
import 'package:project/views/Products%20Screen/bloc/product_event.dart';
import 'package:project/views/Products%20Screen/bloc/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<ShowEvent>((event, emit) async{
      emit(LoadingState());
      try {
        final loadproduct = await GetApiCat().getProduct();
        emit(SuccessState(product: loadproduct));
      } catch (e) {
        emit(ErrorState());
      }
    }
    );
  }
}
