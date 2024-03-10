import 'package:asignmet4/services/user.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
    on<SuccessSignUpEvent>((event, emit) async{
      try{
    final res =await Catagories().createUser(name: event.name, email: event.email, password: event.password);
     emit (SuccessState());
      }catch (m){
        emit (ErrorState());
      }
    });
  }
}
