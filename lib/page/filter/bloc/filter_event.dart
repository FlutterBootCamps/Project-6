part of 'filter_bloc.dart';

@immutable
sealed class FilterEvent {}

class LoadingEvent extends FilterEvent {}



class LoadingProdactsEvent extends FilterEvent {}



class TabSelect extends FilterEvent {
  final int index;
  TabSelect(this.index);
}