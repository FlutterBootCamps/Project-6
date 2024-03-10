part of 'store_bloc.dart';

@immutable
sealed class StoreEvent {}

class ShowProductEvent extends StoreEvent{}

class ShowCategoryEvent extends StoreEvent{}