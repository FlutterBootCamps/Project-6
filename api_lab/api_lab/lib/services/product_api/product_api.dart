import 'dart:convert';

import 'package:api_lab/model/product_model.dart';
import 'package:http/http.dart' as http;

class ProductServices {
  //get all Products
  Future<List<ProductModel>> getAllProducts() async {
    final requset =
        await http.get(Uri.parse("https://api.escuelajs.co/api/v1/products/"));
    final res = json.decode(requset.body);

    List<ProductModel> products = [];
    for (var element in res) {
      products.add(ProductModel.fromJson(element));
    }
    return products;
  }

  //get one Product
  Future<ProductModel> getProduct({required int id}) async {
    final request = await http
        .get(Uri.parse("https://api.escuelajs.co/api/v1/products/$id"));
    final ProductModel product =
        ProductModel.fromJson(json.decode(request.body));

    return product;
  }

  //Get all Category
  Future<List<Category>> getAllCategory() async {
    final requset = await http
        .get(Uri.parse("https://api.escuelajs.co/api/v1/categories/"));
    final res = json.decode(requset.body);

    List<Category> category = [];
    for (var element in res) {
      category.add(Category.fromJson(element));
    }
    return category;
  }

  //Create Product
  Future<void> createProduct(
      {required String title,
      required int price,
      required int categoryId,
      required String description}) async {
    const url = "https://api.escuelajs.co/api/v1/products/";

    final uri = Uri.parse(url);

    try {
      final Map<String, dynamic> product = {
        "title": title,
        "price": price,
        "description": description,
        "categoryId": categoryId.toString(),
        "images": ["https://demofree.sirv.com/nope-not-here.jpg"],
      };

      final http.Response response = await http.post(
        uri,
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(product),
      );

      final dynamic responseBody = jsonDecode(response.body);

      if (response.statusCode == 201) {

      } else {
        throw const FormatException();
      }
    } catch (e) {
      throw e;
    }
  }

  //Create Category
  Future<Category> createCategory({
    required String name,
  }) async {
    final url = "https://api.escuelajs.co/api/v1/categories/";
    final uri = Uri.parse(url);

    final categoryInfo = {
      "name": name,
      "image": "https://api.lorem.space/image/$name?w=150&h=220"
    };

    final request = await http.post(uri, body: categoryInfo);
    final res = json.decode(request.body);
    Category category = Category.fromJson(res);
    return category;
  }
}
