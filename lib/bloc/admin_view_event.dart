part of 'admin_view_bloc.dart';

@immutable
sealed class AdminViewEvent {}

final class ShowAllCategoriesEvent extends AdminViewEvent {}

final class ShowAllProductsEvent extends AdminViewEvent {}

final class ShowAllUsersEvent extends AdminViewEvent {}

final class ShowOneCategoryEvent extends AdminViewEvent {
  final int id;

  ShowOneCategoryEvent({required this.id});
}

final class ShowOneProductEvent extends AdminViewEvent {
  final int id;

  ShowOneProductEvent({required this.id});
}

final class ShowOneUserEvent extends AdminViewEvent {
  final int id;

  ShowOneUserEvent({required this.id});
}

final class AddCategoryEvent extends AdminViewEvent {
  final String text;

  AddCategoryEvent({required this.text});
}

final class EditCategoryEvent extends AdminViewEvent {
  final String text;
  final int id;

  EditCategoryEvent({required this.text, required this.id});
}

final class AddProductEvent extends AdminViewEvent {
  final String title;
  final int price;
  final String description;
  final int categoryId;
  final String image;

  AddProductEvent(
      {required this.description,
      required this.categoryId,
      required this.image,
      required this.title,
      required this.price});
}

final class EditProductEvent extends AdminViewEvent {
  final String title;
  final int price;
  final String image;
  final int id;

  EditProductEvent({required this.id, required this.title, required this.price, required this.image,});
}
