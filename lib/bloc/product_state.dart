part of 'product_bloc.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

final class DisplayProductsLoadingState extends ProductState {}
final class DisplayProductsState extends ProductState {
  final List<ProductCategory> categoryList;
  final List<Product> allProductsList;

DisplayProductsState({required this.allProductsList, required this.categoryList});
}

final class DisplayProductsErrorState extends ProductState {
  final String msg;

  DisplayProductsErrorState({required this.msg});
}