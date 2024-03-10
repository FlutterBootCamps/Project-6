part of 'app_bloc.dart';

@immutable
sealed class AppState {}

final class AppInitial extends AppState {}

final class LoadingState extends AppState {}

final class SuccessProudectState extends AppState {
final List<AllProduct> allproudectlist;
  SuccessProudectState(list, {required this.allproudectlist, required proudect1 });
}
final class SuccessCategotyState extends AppState {
final List<AllProduct> categorylist;
  SuccessCategotyState({required this.categorylist });
}
