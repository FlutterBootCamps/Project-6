part of 'admin_bloc.dart';

@immutable
sealed class AdminEvent {}

class AdminLoadEvent extends AdminEvent {}

class AdminCreateProductEvent extends AdminEvent {
  String title;
  String description;
  int price;
  int categoryId;
  AdminCreateProductEvent({required this.title,required this.description,required this.price, required this.categoryId});
}

class AdminCreateCategoryEvent extends AdminEvent {
  String category;
  AdminCreateCategoryEvent({required this.category});
}

class AdminSearchEvent extends AdminEvent {
  String search;
  AdminSearchEvent({required this.search});
}
