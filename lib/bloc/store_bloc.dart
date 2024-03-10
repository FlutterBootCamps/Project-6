import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../models/products.dart';
import '../services/user.dart';

part 'store_event.dart';
part 'store_state.dart';

class StoreBloc extends Bloc<StoreEvent, StoreState> {
  StoreBloc() : super(StoreInitial()) {
    on<StoreEvent>((event, emit) async {      
   
    });
    on<ShowProductEvent>((event, emit) async{

      emit(LoadingState());
         
      try {
        final output = await Catagories().getDataProduct();
              emit(SuccessStateProduct(product: output,  ));
              print(output);
      } catch (e) {
        emit(ErrorState());
      }
      
    },);
     on<ShowCategoryEvent>((event, emit) async{

      emit(LoadingState());
         
      try {
        final charactersd = await Catagories().getDataCatagories();
              emit(SuccessStateCategories(category: charactersd,  ));
              print(charactersd);
      } catch (e) {
        emit(ErrorState());
      }
      
    },);
  }
}
