part of 'app_bloc.dart';

@immutable
sealed class AppEvent {}

class ShowProudectEvent extends AppEvent{}

class ShowCategoryEvent extends AppEvent{}
