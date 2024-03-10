part of 'drop_down_bloc.dart';

@immutable
sealed class DropDownEvent {}

final class ChangeResutlEvent extends DropDownEvent {
  CategorisModel categorisModel;
  ChangeResutlEvent({required this.categorisModel});
}
