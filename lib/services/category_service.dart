import 'dart:convert';
import 'package:flutter_week6_day3_lab/models/category_model.dart';
import 'package:http/http.dart' as http;

class CategoryService {


  Future<List<ProductCategory>> getAllCategories() async{

    const url = "https://api.escuelajs.co/api/v1/categories/";

    final uri = Uri.parse(url);
    try {
      final response = await http.get(uri);
      final List jsonList = await json.decode(response.body);
    final List<ProductCategory> categoryList = List.generate(jsonList.length, (index) {
      return ProductCategory.fromJson(jsonList[index]);
    } );
    return categoryList;
    } catch (e) {
      throw const FormatException();
    }

    
  }
}