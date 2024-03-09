part of 'user_bloc.dart';

@immutable
sealed class UserEvent {}

final class SignupEvent extends UserEvent {
  final String name;
  final String email;
  final String password;
  final String imgPath;

  SignupEvent({required this.imgPath,required this.email, required this.name, required this.password});
}

final class LoginEvent extends UserEvent {
  final String email;
  final String password;

  LoginEvent({required this.email, required this.password});
}


final class ViewProfileEvent extends UserEvent {
  final String bearerToken;

  ViewProfileEvent({required this.bearerToken});
}

final class PickProfilePictureEvent extends UserEvent {
}

final class UserSignoutEvent extends UserEvent {
  final String name;

  UserSignoutEvent({required this.name});
}