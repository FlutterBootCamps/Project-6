import "dart:async";
import 'dart:convert';
import "package:http/http.dart" as http;
import "package:my_store/model/productsModel.dart";

////////////////// categories get  /////////////////////////////
class NetworkingCategories {
  String baseUrlOfTheCategories = "https://api.escuelajs.co/api/v1/categories/";

  Future<List<CategoryModel>> getAllCategories() async {
    final urlApi = Uri.parse(baseUrlOfTheCategories);
    final response = await http.get(urlApi);
    List<CategoryModel> categories = [];
    if (response.statusCode == 200) {
      for (var categoryDetails in json.decode(response.body)) {
        CategoryModel category = CategoryModel.fromJson(categoryDetails);
        categories.add(category);
      }
      return categories;
    } else {
      throw Exception("no data from Api");
    }
  }

  Future<List<String>> getTabCategories() async{
    List<String> tab=[]; 
   List<CategoryModel> c=await NetworkingCategories().getAllCategories();
   for(var e in c){
tab.add(e.name!);
   }
   return tab;
  }

  Future<CategoryModel> getOneCategory({required int id}) async {
    final urlApi = Uri.parse("$baseUrlOfTheCategories$id");
    final response = await http.get(urlApi);
    if (response.statusCode == 200) {
      CategoryModel category = CategoryModel.fromJson(json.decode(response.body));
      return category;
    } else {
      throw Exception("no data from Api");
    }
  }

////////////////// categories put  /////////////////////////////

  Future<CategoryModel> updateOneCategory(
      {required CategoryModel category}) async {
    final urlApi = Uri.parse("$baseUrlOfTheCategories${category.id}");
    final itemBody = {
      "name": category.name,
      "image": category.image,
    };
    final response = await http.put(urlApi, body: itemBody);

    if (response.statusCode >= 200||response.statusCode <= 299) {
      CategoryModel category = CategoryModel.fromJson(json.decode(response.body));
      return category;
    } else {
      throw Exception("no data from Api");
    }
  }

////////////////// categories create  /////////////////////////////

  Future<CategoryModel> createCategory(
      {required CategoryModel category}) async {
    final urlApi = Uri.parse("$baseUrlOfTheCategories");
    final itemBody = {
      "name": category.name,
      "image": category.image,
    };
    final response = await http.post(urlApi, body: itemBody);

    if (response.statusCode >= 200||response.statusCode <= 299) {
      CategoryModel category = CategoryModel.fromJson(json.decode(response.body));
      return category;
    } else {
      throw Exception("no data from Api");
    }
  }
}
