import 'dart:convert';
import 'package:flutter_week6_day3_lab/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductService {
  Future<List<Product>> getAllProducts() async {
    const url = "https://api.escuelajs.co/api/v1/products/";

    final uri = Uri.parse(url);
    try {
      final response = await http.get(uri);
      final List jsonList = await json.decode(response.body);
      final List<Product> productList = List.generate(jsonList.length, (index) {
        return Product.fromJson(jsonList[index]);
      });
      return productList;
    } catch (e) {
      throw const FormatException();
    }
  }

  Future<Product> getOneProduct(int id) async {
    String url = "https://api.escuelajs.co/api/v1/products/$id";

    final uri = Uri.parse(url);

    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final Product product = Product.fromJson(json.decode(response.body));
      return product;
    } else {
      throw const FormatException();
    }
  }

  Future<void> addProduct(
      {required String title,
      required int price,
      required String description,
      required int categoryId,
      required String imageUrl}) async {
    const url = "https://api.escuelajs.co/api/v1/products/";

    final uri = Uri.parse(url);

    final Map<String, dynamic> product = {
      "title": title,
      "price": price,
      "description": description,
      "categoryId": categoryId.toString(),
      "images": [imageUrl],
    };

    final http.Response request = await http.post(uri, headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      }, body: jsonEncode(product));

    // final response = await json.decode(request.body);
    print(request.statusCode);
    if (request.statusCode == 201) {
      print(request.statusCode);
      // print(response);
    } else {
      throw const FormatException();
    }
  }

  Future<void> editProduct(
      {required String title,
      required int price,
      required String imageUrl,
      required int id}) async {
    String url = "https://api.escuelajs.co/api/v1/products/$id";

    final uri = Uri.parse(url);

    final Map<String, dynamic> product = {
      "title": title,
      "price": price.toString(),
      "images": [imageUrl],
    };

    final request = await http.put(uri, headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      }, body: jsonEncode(product));

    // final response = await json.decode(request.body);
    print(request.statusCode);
    if (request.statusCode == 200) {
      print(request.statusCode);
      // print(response);
    } else {
      throw const FormatException();
    }
  }
}
