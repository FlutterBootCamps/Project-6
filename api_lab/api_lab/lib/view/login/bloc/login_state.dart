part of 'login_bloc.dart';

@immutable
sealed class LoginState {}

final class LoginInitial extends LoginState {}

final class LoginSuccessState extends LoginState {
  final String msg;
  final String token;
  LoginSuccessState( {required this.token, required this.msg});
}

final class LoginErrorState extends LoginState {
  final String msg;
  LoginErrorState({required this.msg});
}
