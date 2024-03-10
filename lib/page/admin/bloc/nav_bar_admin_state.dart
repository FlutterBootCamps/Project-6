part of 'nav_bar_admin_bloc.dart';

@immutable
sealed class NavBarAdminState {}

final class NavBarAdminInitial extends NavBarAdminState {}

final class  SuccessChangeIndex extends NavBarAdminState {
  SuccessChangeIndex();
}
