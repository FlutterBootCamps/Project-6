import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:project/services/log_in_end_point.dart';
import 'package:project/views/Log%20In%20Screen/bloc/login_event.dart';
import 'package:project/views/Log%20In%20Screen/bloc/login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  String token="";
  LoginBloc() : super(LoginInitial()) {
    on<LoginAccountEvent>((event, emit)async {
      try {
        final res = await UserLogin().login(email: event.email, password: event.password);
        token=res['access_token'];
        emit(LoginAccountState(accessToken: token));
        
      } catch (e) {
        emit(ErrorLoginState(Text("error")));
        
      }
    });
  }
}
