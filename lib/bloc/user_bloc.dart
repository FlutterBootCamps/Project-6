import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../services/user.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  String token="";
  UserBloc() : super(UserInitial()) {
    on<SuccessSignInEvent>((event, emit)async {
     try{
      final res=await Catagories().logIn(email: event.email, password: event.password);

      token=res["access_token"];
      emit(SignInState(Token: token));


     }catch (m){
      emit( ErrorState(wrongSignIn: 'Your Email or Password  not Correct Try Again'

      ));
     }
    });
  }
}
