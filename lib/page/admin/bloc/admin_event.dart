part of 'admin_bloc.dart';

@immutable
sealed class AdminEvent {}
class CreateCategoryEvent extends AdminEvent {}

class CreateProductEvent extends AdminEvent {}

class LoadingCategoryEvent extends AdminEvent {}

class LoadingProductsEvent extends AdminEvent {}

class LoadingUsersEvent extends AdminEvent {}

class UpdateProductEvent extends AdminEvent{}

class UpdateCategoryEvent extends AdminEvent{}


class ChangeImageEvent extends AdminEvent {}

class UpdateUserEvent extends AdminEvent{}

class ShowProfileEvent extends AdminEvent{
  final String token;
  ShowProfileEvent({required this.token});
}
