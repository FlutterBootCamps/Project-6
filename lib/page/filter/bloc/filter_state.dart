part of 'filter_bloc.dart';

@immutable
sealed class FilterState {}

final class TabBarInitial extends FilterState {}

final class TabBarLoading extends FilterState {}

final class ProductsLoading extends FilterState {}

final class ProductsShow extends FilterState {}


final class TabState extends FilterState {
  final int index;
  TabState(this.index);
}
