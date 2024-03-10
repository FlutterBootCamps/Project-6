part of 'bottom_nav_bar_bloc_bloc.dart';

@immutable
sealed class BottomNavBarBlocState {}

final class BottomNavBarBlocInitial extends BottomNavBarBlocState {}

final class SuccessChangeNavState extends BottomNavBarBlocState {
  int index;
  SuccessChangeNavState({required this.index});
}