import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:my_store/model/productsModel.dart';
import 'package:my_store/service/networking_catagory.dart';
import 'package:my_store/service/networking_products.dart';

part 'filter_event.dart';
part 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  List categories=[];
  List<Product> products=[];
  late String filtter;
  FilterBloc() : super(TabBarInitial()) {
    on<FilterEvent>((event, emit) async{
      NetworkingCategories network= NetworkingCategories();
      List categoriesRaw=await network.getAllCategories();
      for(CategoryModel e in categoriesRaw){
        categories.add(e);
      }
      emit(TabBarLoading());
    });
    on<LoadingProdactsEvent>((event, emit) async{
      emit(ProductsLoading());
      NetworkingProducts network= NetworkingProducts();
      List<Product> productsRaw = await network.getAllProducts();
      //if(products.isEmpty)
        for (Product productDetails in productsRaw) {
          if(filtter==productDetails.category!.name)
        products.add(productDetails);
        
      }

       emit(ProductsLoading());
       
    },);
        on<TabSelect>((event, emit) {
      // TODO: implement event handler
      emit(TabState(event.index));
    });
  }
}
