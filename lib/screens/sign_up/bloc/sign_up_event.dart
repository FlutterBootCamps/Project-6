part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpEvent {}

class CreateAccountEvent extends SignUpEvent {}

class LoginAccountEvent extends SignUpEvent {}

class ChangeImageEvent extends SignUpEvent {}
