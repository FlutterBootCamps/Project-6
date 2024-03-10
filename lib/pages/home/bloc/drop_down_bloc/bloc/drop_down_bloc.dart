import 'package:api_page_lab/models/categorise_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'drop_down_event.dart';
part 'drop_down_state.dart';

class DropDownBloc extends Bloc<DropDownEvent, DropDownState> {
  DropDownBloc() : super(ResultState()) {
    on<ChangeResutlEvent>((event, emit) {
      emit(ResultState(categorisModel: event.categorisModel));
    });
  }
}
