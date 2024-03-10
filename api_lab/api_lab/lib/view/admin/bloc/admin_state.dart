part of 'admin_bloc.dart';

@immutable
sealed class AdminState {}

final class AdminInitial extends AdminState {}

final class AdminLoadingState extends AdminState {}

final class AdminLoadState extends AdminState {
  final List<UserModel> users;
  AdminLoadState({required this.users});
}

final class AdminSearchState extends AdminState {
  final UserModel user;
  AdminSearchState({required this.user});
}

final class AdminSuccessState extends AdminState {
  final String msg;
  AdminSuccessState({required this.msg});
}

final class AdminErrorState extends AdminState {
  final String msg;
  AdminErrorState({required this.msg});
}
