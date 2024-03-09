part of 'product_bloc.dart';

@immutable
sealed class ProductEvent {}

final class GetAllProductsEvent extends ProductEvent {
  
}

final class GetSearchedProductsEvent extends ProductEvent {
  final String searchText;

  GetSearchedProductsEvent({required this.searchText});
}

