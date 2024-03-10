import 'dart:convert';
import "package:http/http.dart" as http;
import "package:my_store/model/productsModel.dart";

class NetworkingProducts {
////////////////// products get  /////////////////////////////
  String baseUrlOfTheProducts = "https://api.escuelajs.co/api/v1/products/";
  Future<List<Product>> getAllProducts() async {
    final urlApi = Uri.parse(baseUrlOfTheProducts);
    final response = await http.get(urlApi);
    List<Product> products = [];
    if (response.statusCode == 200) {
      for (var productDetails in json.decode(response.body)) {
        Product product = Product.fromJson(productDetails);
        products.add(product);
      }
      return products;
    } else {
      throw Exception("no data from Api");
    }
  }

  Future<Product> getOneProduct({required int id}) async {
    final urlApi = Uri.parse("$baseUrlOfTheProducts$id");
    final response = await http.get(urlApi);
    if (response.statusCode == 200) {
      Product product = Product.fromJson(json.decode(response.body));
      return product;
    } else {
      throw Exception("no data from Api");
    }
  }

  Future<List<Product>> getNumberOfProducts(
      {required int offset, required int limit}) async {
    final urlApi =
        Uri.parse("${baseUrlOfTheProducts}?offset=${offset}&limit=$limit");
    final response = await http.get(urlApi);
    List<Product> products = [];
    if (response.statusCode == 200) {
      for (var productDetails in json.decode(response.body)) {
        Product product = Product.fromJson(productDetails);
        products.add(product);
      }
      return products;
    } else {
      throw Exception("no data from Api");
    }
  }
////////////////// products put  /////////////////////////////

  Future<Product> updateProduct(
      {required Product product}) async {
    final urlApi = Uri.parse("$baseUrlOfTheProducts${product.id}");
    final itemBody = {
      "title": product.title,
      "price": product.price,
      "images": product.images,
      "description":product.description,
    };
    final response =
        await http.put(urlApi, body: json.encode(itemBody), headers: {
      "Content-Type": "application/json",
    });

    if (response.statusCode >=200||response.statusCode<300) {
      return Product.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to update product");
    }
  }

////////////////// products post  /////////////////////////////

  Future<Product> createProduct(
      {required Product product}) async {
    final urlApi = Uri.parse("$baseUrlOfTheProducts");
    final itemBody = {
      "title": product.title,
      "price": product.price,
      "description": product.description,
      "categoryId": product.category!.id,
      "images": product.images,
    };
    final response =
        await http.post(urlApi, body: json.encode(itemBody), headers: {
      "Content-Type": "application/json",
    });

    if (response.statusCode == 200) {
      return Product.fromJson(json.decode(response.body));
    } else {
      throw Exception("Failed to create product");
    }
  }
}
