part of 'admin_view_bloc.dart';

@immutable
sealed class AdminViewState {}

final class AdminViewInitial extends AdminViewState {}

final class ShowingCategoriesState extends AdminViewState {
  final List<ProductCategory> categoryList;

  ShowingCategoriesState({required this.categoryList});
}

final class ShowingProductsState extends AdminViewState {
  final List<Product> productList;

  ShowingProductsState({required this.productList});
}

final class ShowingUsersState extends AdminViewState {
  final List<User> userList;

  ShowingUsersState({required this.userList});
}

final class ShowingOneCategoryState extends AdminViewState {
  final ProductCategory category;

  ShowingOneCategoryState({required this.category});
}

final class ShowingOneProductState extends AdminViewState {
  final Product product;

  ShowingOneProductState({required this.product});
}

final class ShowingOneUserState extends AdminViewState {
  final User user;

  ShowingOneUserState({required this.user});
}

final class LoadingState extends AdminViewState {

}

final class ErrorState extends AdminViewState {
  final String msg;

  ErrorState({required this.msg});
}

final class AddedEditiedCategoryState extends AdminViewState {
  final String msg;

  AddedEditiedCategoryState({required this.msg});
}

final class AddedEditiedProductState extends AdminViewState {
  final String msg;

  AddedEditiedProductState({required this.msg});
}