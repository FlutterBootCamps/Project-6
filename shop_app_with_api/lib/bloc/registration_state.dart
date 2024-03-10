part of 'registration_bloc.dart';

@immutable
sealed class RegistrationState {}

final class RegistrationInitial extends RegistrationState {}

final class LoadingState extends RegistrationState {}

final class UpdateUserLoadedState extends RegistrationState {
  final UserModel user;
  UpdateUserLoadedState({required this.user});
}
final class UpdateCategoryLoadedState extends RegistrationState {
  final CategoryModel category;
  UpdateCategoryLoadedState({required this.category});
}

final class SuccessState extends RegistrationState {}
final class LogInSuccessState extends RegistrationState {}
final class ErrorState extends RegistrationState {}
final class UpdateImageState extends RegistrationState {}

final class GetAllUsersState extends RegistrationState {
  final users;
  GetAllUsersState({required this.users});
}
final class GetOneUsersState extends RegistrationState {
  final users;
  GetOneUsersState({required this.users});
}

final class GetAllDataState extends RegistrationState {
  final List allData;
  GetAllDataState({required this.allData});
}
// final class GetAllCategoriesState extends RegistrationState {
//   final List categories;
//   GetAllCategoriesState({required this.categories});
// }
