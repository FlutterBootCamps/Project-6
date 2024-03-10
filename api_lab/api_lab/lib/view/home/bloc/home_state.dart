part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoadingState extends HomeState {}

final class HomeLoadDataState extends HomeState {
  List<ProductModel> productList = [];
  ProductModel? product;
  List<Category> category;
  HomeLoadDataState({required this.productList, this.product , required this.category});
}

final class HomeErrorState extends HomeState {}
