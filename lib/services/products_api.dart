import 'dart:convert';

import 'package:api_page_lab/models/categorise_model.dart';
import 'package:api_page_lab/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductAPI {
  static Future<List<ProdutModel>?> productsAPI(String token) async {
    const urlString = "https://api.escuelajs.co/api/v1/products/";

    final headers = {"authorization": "Bearer $token"};

    try {
      final reg = await http.get(Uri.parse(urlString), headers: headers);
      print(reg.body);

      List res = json.decode(reg.body);
      List<ProdutModel> productList =
          res.map((proudct) => ProdutModel.fromJson(proudct)).toList();

      if (reg.statusCode == 200) {
        return productList;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  static Future<bool> addProductsAPI(ProdutModel productModel ,String token) async {
    const urlString = "https://api.escuelajs.co/api/v1/products/";

    final headers = {"authorization": "Bearer $token", 'Content-Type': 'application/json; charset=UTF-8'};

    final body = {
      "title": productModel.title,
      "price": productModel.price,
      "description": productModel.description,
      "categoryId": productModel.category?.id,
      "images": productModel.images
    };

    print(body);

      print("bef");
      final reg = await http.post(Uri.parse(urlString), body: jsonEncode(body) , headers: headers);
      print(reg.body);

      if (reg.statusCode == 201) {
        return true;
      } else {
        return false;
      }

  }
}
