import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:project/model/products.model.dart';

class GetOneApi {
  Future<List<Products>> getOneProduct() async {
    String link = "https://api.escuelajs.co/api/v1/products/1";
    final uri = Uri.parse(link);
    final Response response = await http.get(uri);

    final responsejson = json.decode(response.body); 

    List<Products> productList = List.generate(
        responsejson.length, (index) => Products.fromJson(responsejson[index]));
    return productList;
  }

}
