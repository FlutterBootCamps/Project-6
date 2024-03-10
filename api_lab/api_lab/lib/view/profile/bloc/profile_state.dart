part of 'profile_bloc.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}

final class ProfileLoadingState extends ProfileState {}

final class ProfileLoadState extends ProfileState {
  UserModel user;
  ProfileLoadState({required this.user});
}

final class ProfileErrorState extends ProfileState {}
