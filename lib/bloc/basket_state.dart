part of 'basket_bloc.dart';

@immutable
sealed class BasketState {}

final class BasketInitial extends BasketState {}

final class ModfiedBasketState extends BasketState {
  final String msg;
  final bool isAdding;

  ModfiedBasketState({required this.isAdding, required this.msg});
}

final class ModfiedBasketErrorState extends BasketState {
  final String msg;

  ModfiedBasketErrorState({required this.msg});
}