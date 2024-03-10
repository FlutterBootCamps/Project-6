part of 'profile_bloc.dart';

@immutable
sealed class ProfileEvent {}

final class ProfileLoadDataEvent extends ProfileEvent {
  String tokenKey;
  ProfileLoadDataEvent({required this.tokenKey});
}

final class ProfileEditEvent extends ProfileEvent {
  UserModel user;
  String name;
  ProfileEditEvent({required this.name , required this.user});
}
