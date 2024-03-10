
import 'package:flutter/material.dart';
import 'package:project/model/products.model.dart';

@immutable
sealed class ProductState {}

final class ProductInitial extends ProductState {}
class LoadingState extends ProductState{}

class ErrorState extends ProductState{}

class SuccessState extends ProductState{
  final List<Products> product;
  
   
  SuccessState({required this.product});
}


