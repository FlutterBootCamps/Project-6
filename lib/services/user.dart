import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../models/products.dart';

class Catagories {
  Future createUser(
      {required String name,
      required String email,
      required String password}) async {
    final url = "https://api.escuelajs.co/api/v1/users/";

    final uri = Uri.parse(url);

    //   Body
    final userInfo = {
      
        "name": name,
        "email": email,
        "password": password,
        "avatar": "https://api.lorem.space/image/face?w=640&h=480"
      
    };
    //Request
    final request = await http.post(uri,body: userInfo);
final res =json.decode(request.body);
    print(request.statusCode);
    print(res);
//      
  }

  //-------------------- Log in function-----------------
  Future logIn( {
      required String email,
      required String password})async{
     final url = "https://api.escuelajs.co/api/v1/auth/login";

    final uri = Uri.parse(url);

     final userInfo = {
      
       
        "email": email,
        "password": password,
     
      
    };
     //Request
    final request = await http.post(uri,body: userInfo);
final res =json.decode(request.body);
return res;
    

  }
  //----------View User Profile
   Future viewProfile( String token)async{
     final url = "https://api.escuelajs.co/api/v1/auth/profile";

    final uri = Uri.parse(url);
//Token
final headerInfo ={
  "Authorization" : "Bearer $token",
};
    
     //Request
    final request = await http.get(uri,headers:headerInfo);

    print(request.statusCode);
    print(request.body);

  }
  //get all broducts
   Future<List<ProductModel>>getDataProduct()async{
  String link ="https://api.escuelajs.co/api/v1/products/";
  final uri = Uri.parse(link);
  final Response response = await http.get(uri);

final responsejson =json.decode(response.body);
print(responsejson);

List<ProductModel> productList = List.generate(responsejson.length, (index) => ProductModel.fromJson(responsejson[index]));

return productList;

}

//get all Catagories
   Future<List<CategoryModel>>getDataCatagories()async{
  String link ="https://api.escuelajs.co/api/v1/categories/";
  final uri = Uri.parse(link);
  final Response response = await http.get(uri);

final responsejson =json.decode(response.body);
print(responsejson);

List<CategoryModel> categoryList = List.generate(responsejson.length, (index) => CategoryModel.fromJson(responsejson[index]));

return categoryList;

}
}
