import 'package:api_app/models/proudect_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppInitial()) {
    on<AppEvent>((event, emit) {
      // TODO: implement event handler
    });
     on<ShowCategoryEvent>((event, emit) {
    
    });
     on<ShowProudectEvent>((event, emit) async{
     
      // emit(SuccessProudectState(allproudectlist: AllProduct.map((e) => AllProduct.fromJson(e)).toList()));
 
  });
  }
}
