part of 'signup_bloc.dart';

@immutable
sealed class SignupEvent {}


class SuccessSignUpEvent extends SignupEvent{
final String email;
final String password;
final String name;

SuccessSignUpEvent({required this.email,required this.password,required this.name});
}