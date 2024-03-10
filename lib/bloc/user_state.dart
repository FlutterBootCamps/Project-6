part of 'user_bloc.dart';

@immutable
sealed class UserState {}

final class UserInitial extends UserState {}

class LoadingState extends UserState{}

class SignInState extends UserState{
  final String Token;
  SignInState({required this.Token,});
}

class ErrorState extends UserState{
   final String wrongSignIn;
  ErrorState({required this.wrongSignIn,});
}