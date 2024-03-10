part of 'bottom_navigation_bar_bloc.dart';

@immutable
sealed class BottomNavigationBarState {}


final class BottomNavigationBarInitial extends BottomNavigationBarState {}


final class  SuccessChangeIndex extends BottomNavigationBarState {
  SuccessChangeIndex();
}

