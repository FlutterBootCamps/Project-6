part of 'drop_down_bloc.dart';

@immutable
sealed class DropDownState {}

final class DropDownInitial extends DropDownState {}

final class ResultState extends DropDownState {
  CategorisModel? categorisModel;
  ResultState({this.categorisModel});
}
