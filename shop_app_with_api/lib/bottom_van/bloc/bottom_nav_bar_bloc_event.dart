part of 'bottom_nav_bar_bloc_bloc.dart';

@immutable
sealed class BottomNavBarBlocEvent {}


class ChangeNavEvent extends BottomNavBarBlocEvent {
  final int index;
  ChangeNavEvent({required this.index});

}