part of 'product_bloc.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}

final class ProductLoadingState extends ProductState {}

final class ProductSuccessState extends ProductState {
  final List<ProdutModel> productsList;
  ProductSuccessState({required this.productsList});
}

final class ErrorState extends ProductState {}
