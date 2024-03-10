import 'dart:convert';

import 'package:http/http.dart'as http;

Future<void> addProduct({
  required String title,
  required int price,
  required String description,
  required int categoryId,
  required String imageUrl,
}) async {
  const url = "https://api.escuelajs.co/api/v1/products/";

  final uri = Uri.parse(url);

  try {
    final Map<String, dynamic> product = {
      "title": title,
      "price": price,
      "description": description,
      "categoryId": categoryId.toString(), 
      "images": [imageUrl],
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
      print('Product added successfully!');
      print(responseBody);
    } else {
      print('Failed to add product.');
      throw const FormatException();
    }
  } catch (e) {
    print('Exception caught: $e');
    throw e;
  }
}