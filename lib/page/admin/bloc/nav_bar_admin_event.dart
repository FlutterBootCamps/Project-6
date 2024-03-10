part of 'nav_bar_admin_bloc.dart';

@immutable
sealed class NavBarAdminEvent {}

class ChangeIndexEvent extends NavBarAdminEvent{
  final int index;
  ChangeIndexEvent(this.index);
}