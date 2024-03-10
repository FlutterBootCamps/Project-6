import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:project/model/categories_model.dart';

class GetApi {
  Future<List<Categories>> getCategories() async {
    String link = "https://api.escuelajs.co/api/v1/categories/";
    final uri = Uri.parse(link);
    final Response response = await http.get(uri);

    final responsejson = json.decode(response.body); 

    List<Categories> CategoriesList = List.generate(
        responsejson.length, (index) => Categories.fromJson(responsejson[index]));
    return CategoriesList;
  }
}