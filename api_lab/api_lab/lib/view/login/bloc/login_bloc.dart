import 'dart:async';

import 'package:api_lab/services/user_api/user_services.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  String tokenKey = '';
  LoginBloc() : super(LoginInitial()) {
    on<Login>(methodLogin);
  }

  FutureOr<void> methodLogin(Login event, Emitter<LoginState> emit) async {
    String email = event.email;
    String password = event.password;
    try {
      if (email != null && password != null) {
        var token =
            await UserServices().loginUser(email: email, password: password);
        tokenKey = token["access_token"];
        emit(LoginSuccessState(
            msg: "Login Successful", token: token["access_token"]));
      } else {
        emit(LoginErrorState(msg: "Error filling the require field"));
      }
    } catch (e) {
      emit(LoginErrorState(msg: "Login Unsuccessful"));
    }
  }
}
