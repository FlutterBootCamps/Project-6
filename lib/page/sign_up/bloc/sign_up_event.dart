part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpEvent {}

class CreateAccountEvent extends SignUpEvent {}

class ChangeImageEvent extends SignUpEvent {}

class UpdateUserEvent extends SignUpEvent{}

class ShowProfileEvent extends SignUpEvent{
  final String token;
  ShowProfileEvent({required this.token});
}
