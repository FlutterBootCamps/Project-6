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
//------------------------------------------------------
final class DisplaySearchedProductsLoadingState extends ProductState {

}

final class DisplaySearchedProductsState extends ProductState {
  final List<ProductCard> productCardList;

  DisplaySearchedProductsState({required this.productCardList});
}

final class DisplaySearchedProductsErrorState extends ProductState {
  final String msg;

  DisplaySearchedProductsErrorState({required this.msg});
}

