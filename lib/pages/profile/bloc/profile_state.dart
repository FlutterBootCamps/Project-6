part of 'profile_bloc.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class LoadingState extends ProfileState {}

final class SuccessState extends ProfileState {
  final UserModel userModel;
  SuccessState({required this.userModel});
}

final class ErrorState extends ProfileState {}
