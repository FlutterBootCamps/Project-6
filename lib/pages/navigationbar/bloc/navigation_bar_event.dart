part of 'navigation_bar_bloc.dart';

@immutable
sealed class NavigationBarEvent {}

final class ChangeThePageEvent extends NavigationBarEvent{
  late int currentIndex;

  ChangeThePageEvent({required this.currentIndex});
}
