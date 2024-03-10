part of 'category_bloc.dart';

@immutable
sealed class CategoryState {}

final class CategoryInitial extends CategoryState {}

final class LoadingState extends CategoryState {}

final class SuccessState extends CategoryState {
  final List<CategorisModel> categories;
  SuccessState({required this.categories});
}

final class ErrorState extends CategoryState {}
