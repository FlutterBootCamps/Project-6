import 'dart:convert';
import 'package:flutter_week6_day3_lab/models/product_model.dart';
import 'package:http/http.dart' as http;

class ProductService {
  Future<List<Product>> getAllProducts() async{

    const url = "https://api.escuelajs.co/api/v1/products/";

    final uri = Uri.parse(url);
    try {
      final response = await http.get(uri);
      final List jsonList = await json.decode(response.body);
    final List<Product> productList = List.generate(jsonList.length, (index) {
      return Product.fromJson(jsonList[index]);
    } );
    return productList;
    } catch (e) {
      throw const FormatException();
    }

    
  }
}