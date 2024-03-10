part of 'admin_bloc.dart';

@immutable
sealed class AdminState {}

final class AdminInitial extends AdminState {}

final class LoadingState extends AdminState {}

final class SuccessState extends AdminState {}

final class UpdateState extends AdminState {}

final class ErrorState extends AdminState {}

final class UpdateImageState extends AdminState {}
