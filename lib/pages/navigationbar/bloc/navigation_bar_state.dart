part of 'navigation_bar_bloc.dart';

@immutable
sealed class NavigationBarState {}


final class SuccessState extends NavigationBarState {
  final int currentIndex;
  SuccessState(this.currentIndex);
}
