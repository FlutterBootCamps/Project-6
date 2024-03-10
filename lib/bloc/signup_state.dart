part of 'signup_bloc.dart';

@immutable
sealed class SignupState {}

final class SignupInitial extends SignupState {}

class ErrorState extends SignupState{}

class SuccessState extends SignupState{
 
}