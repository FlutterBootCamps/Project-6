part of 'store_bloc.dart';

@immutable
sealed class StoreState {}

final class StoreInitial extends StoreState {}
class LoadingState extends StoreState {}
class ErrorState extends StoreState {}
class SuccessState extends StoreState{
 
  
   
 
}

class SuccessStateProduct extends StoreState{
  
  
    final List<ProductModel> product;
  SuccessStateProduct({required this.product});
}
class SuccessStateCategories extends StoreState{
  
  
    final List<CategoryModel> category;
  SuccessStateCategories({required this.category});
}