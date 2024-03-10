part of 'signup_bloc.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}

final class UpdateImageState extends SignupState {}

final class SignupSuccessState extends SignupState {
  final String msg;
  SignupSuccessState({required this.msg});
}

final class SignupErrorState extends SignupState {
  final String msg;
  SignupErrorState({required this.msg});
}
