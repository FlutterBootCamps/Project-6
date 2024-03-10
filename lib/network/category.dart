import 'dart:convert';

import 'package:api_app/models/proudect_model.dart';
import 'package:http/http.dart' as http;
class Category {

  Future<List<CategoryModel>>getAllProudect()async{

    const url = 'https://api.escuelajs.co/api/v1/categories/';

    final uri = Uri.parse(url);
    try{
      final response =await http.get(uri);
      final List jsonlist =await jsonDecode(response.body);
      final List<CategoryModel> categorylist = List.generate(jsonlist.length, (index) {
        return CategoryModel.fromJson(jsonlist[index]);
      });
      return categorylist;
    }catch(e){
      throw const FormatException();
    }
  }
  
}