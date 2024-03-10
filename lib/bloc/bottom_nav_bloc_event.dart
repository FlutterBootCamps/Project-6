part of 'bottom_nav_bloc_bloc.dart';

@immutable
sealed class BottomNavBlocEvent {}
class MoveScreenEvent extends BottomNavBlocEvent {
   final int selectindex;

  MoveScreenEvent({required this.selectindex});
}
class ShowEvent extends BottomNavBlocEvent{}
