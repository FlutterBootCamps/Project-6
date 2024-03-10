part of 'bottom_navigation_bar_bloc.dart';

@immutable
sealed class BottomNavigationBarEvent {}


class ChangeIndexEvent extends BottomNavigationBarEvent{
  final int index;
  ChangeIndexEvent(this.index);
}