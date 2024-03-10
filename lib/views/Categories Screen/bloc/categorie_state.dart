
import 'package:flutter/material.dart';
import 'package:project/model/categories_model.dart';

@immutable
sealed class CategoriesState {}

final class CategoriesInitial extends CategoriesState {}
class LoadingCategoriesState extends CategoriesState{}

class ErrorCategoriesState extends CategoriesState{}

class SuccessCategoriesState extends CategoriesState{
  final List<Categories> categories;
  
   
  SuccessCategoriesState({required this.categories});
}


