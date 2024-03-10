part of 'registration_bloc.dart';

@immutable
sealed class RegistrationEvent {}


class CreateNewAccountEvent extends RegistrationEvent {
  //  String name;
  // String email;
  // String password;
  // CreateNewAccountEvent({required this.name, required this.email, required this.password })
}

class ChangeImageEvent extends RegistrationEvent {}

class LogInEvent extends RegistrationEvent {
  String email;
  String password;
  LogInEvent({required this.email, required this.password});
}

class GetAllUsersEvent extends RegistrationEvent{}

class GetAllCategoriesEvent extends RegistrationEvent{}

class GetAllProductsEvent extends RegistrationEvent{}

class CreateNewCategoriesEvent extends RegistrationEvent{
  String name;
  CreateNewCategoriesEvent({required this.name, });
}

class CreateNewProductsEvent extends RegistrationEvent{
   String title;
      double price;
      String description;
      int categoryId;
  CreateNewProductsEvent({required this.title, required this.price, required this.description, required this.categoryId });
}

class GetOneUsersEvent extends RegistrationEvent{
  final int id;
  GetOneUsersEvent({required this.id});
}

class EditUserEvent extends RegistrationEvent{
  final int? id;
  final String name;
  final UserModel user;

  EditUserEvent({ this.id, required this.name, required this.user});
}

class EditCategoryEvent extends RegistrationEvent{
  final int? id;
  final String name;
  final CategoryModel category;

  EditCategoryEvent({ this.id, required this.name, required this.category});
}

class GetOneCategoriesEvent extends RegistrationEvent{
   final int id;
   GetOneCategoriesEvent({required this.id});
}

class GetOneProductsEvent extends RegistrationEvent{
  final int id;
  GetOneProductsEvent({required this.id});
}


