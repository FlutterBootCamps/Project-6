part of 'bottom_nav_bar_bloc.dart';

@immutable
sealed class BottomNavBarEvent {}

final class ChangePageEvent extends BottomNavBarEvent{
  final int indexPage;
  ChangePageEvent({required this.indexPage});
}