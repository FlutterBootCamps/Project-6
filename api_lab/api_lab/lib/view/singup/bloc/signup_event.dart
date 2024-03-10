part of 'signup_bloc.dart';

@immutable
sealed class SignupEvent {}

class CreateUserEvent extends SignupEvent {
  final String userName;
  final String email;
  final String password;
  CreateUserEvent(
      {required this.userName, required this.email, required this.password});
}

class UploadImageEvent extends SignupEvent{}
