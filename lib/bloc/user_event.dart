part of 'user_bloc.dart';

@immutable
sealed class UserEvent {}

class SuccessSignInEvent extends UserEvent{
final String email;
final String password;

SuccessSignInEvent({required this.email,required this.password});
}

