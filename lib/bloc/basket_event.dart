part of 'basket_bloc.dart';

@immutable
sealed class BasketEvent {}

final class AddProductToCartEvent extends BasketEvent {
  final Product product;

  AddProductToCartEvent({required this.product});
}

final class RemoveProductFromCartEvent extends BasketEvent {
  final Product product;

  RemoveProductFromCartEvent({required this.product});
}