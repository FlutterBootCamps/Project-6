part of 'sign_up_bloc.dart';

@immutable
sealed class SignUpState {}

final class SignUpInitial extends SignUpState {}

final class LoadingState extends SignUpState {}

final class SuccessState extends SignUpState {}

final class UpdateState extends SignUpState {}

final class ShowProfileState extends SignUpState {
  final User user;
  ShowProfileState({required this.user});
}


final class ErrorState extends SignUpState {}

final class UpdateImageState extends SignUpState {}
