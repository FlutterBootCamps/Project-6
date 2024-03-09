import 'dart:convert';
import 'package:flutter_week6_day3_lab/models/category_model.dart';
import 'package:http/http.dart' as http;

class CategoryService {
  Future<List<ProductCategory>> getAllCategories() async {
    const url = "https://api.escuelajs.co/api/v1/categories/";

    final uri = Uri.parse(url);
    try {
      final response = await http.get(uri);
      final List jsonList = await json.decode(response.body);
      final List<ProductCategory> categoryList =
          List.generate(jsonList.length, (index) {
        return ProductCategory.fromJson(jsonList[index]);
      });
      return categoryList;
    } catch (e) {
      throw const FormatException();
    }
  }

  Future<ProductCategory> getOneCategory(int id) async {
    String url = "https://api.escuelajs.co/api/v1/categories/$id";

    final uri = Uri.parse(url);

    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final ProductCategory category =
          ProductCategory.fromJson(json.decode(response.body));
      return category;
    }else {
      throw const FormatException();
    }

    
  }

  Future<void> addCategory({required String name}) async {
    const url = "https://api.escuelajs.co/api/v1/categories/";

    final uri = Uri.parse(url);

    var category = {
      "name": name,
      "image": "https://api.lorem.space/image/$name?w=150&h=220"
    };

    final request = await http.post(uri, body: category);

    final response = await json.decode(request.body);
    
    if (request.statusCode == 201){
      print(request.statusCode);
      print(response);
    }else {
      throw const FormatException();
    }
  }

  Future<void> editCategory({required String name, required int id}) async{
    String url = "https://api.escuelajs.co/api/v1/categories/$id";

    final uri = Uri.parse(url);

    var category = {
      "name": name,
    };

    final request = await http.put(uri, body: category);

    final response = await json.decode(request.body);

    if (request.statusCode == 200){
      print(request.statusCode);
      print(response);
    }else {
      throw const FormatException();
    }
  }
}
