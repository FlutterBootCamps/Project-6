part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

final class HomeLoadDataEvent extends HomeEvent{}


final class HomeGetProductEvent extends HomeEvent{
  int id;
  HomeGetProductEvent({required this.id});
}

