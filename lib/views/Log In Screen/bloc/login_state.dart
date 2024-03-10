import 'package:flutter/src/widgets/text.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}


class ErrorLoginState extends LoginState {
  ErrorLoginState(Text text);
}
class LoginAccountState extends LoginState {
 final String accessToken;

  LoginAccountState({required this.accessToken});
} 