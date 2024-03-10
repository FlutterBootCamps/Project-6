// import 'package:api_page_lab/models/categorise_model.dart';
// import 'package:api_page_lab/models/create_user_model.dart';
// import 'package:http/http.dart' as http;

// class CategoryApi {
//   Future<bool> createUser(CategorisModel category) async {
//     const urlString = "https://api.escuelajs.co/api/v1/categories/";

//     // final body = {
//     //   "id": category.id,
//     //   "name": category.name,
//     //   "image": category.image,
//     //   "creationAt": category.creationAt,
//     //   "updatedAt": category.updatedAt
//     // };

//     final reg = await http.get(Uri.parse(urlString));

//     final res = json.decode(reg.body);

//     if (reg.statusCode == 200) {
//       return true;
//     } else {
//       return false;
//     }
//   }
// }

import 'dart:convert';

import 'package:api_page_lab/models/categorise_model.dart';
import 'package:http/http.dart' as http;

class CategoryAPI {
  static Future<List<CategorisModel>?> categoryAPI(String token) async {
    const urlString = "https://api.escuelajs.co/api/v1/categories/";

    final headers = {"authorization": "Bearer $token"};

    try {
      final reg = await http.get(Uri.parse(urlString), headers: headers);
      print(reg.body);

      List res = json.decode(reg.body);
      List<CategorisModel> categiresList =
          res.map((category) => CategorisModel.fromJson(category)).toList();

      if (reg.statusCode == 200) {
        return categiresList;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  static Future<bool> addCategoryAPI(String name ,String token) async {
    const urlString = "https://api.escuelajs.co/api/v1/categories/";

    final headers = {"authorization": "Bearer $token",};

    final body = {

        "name": name,
        "image": "https://api.lorem.space/image/book?w=150&h=220"

    };

    print(body);

    final reg = await http.post(Uri.parse(urlString), body: (body) , headers: headers);
    print(reg.body);

    if (reg.statusCode == 201) {
      return true;
    } else {
      return false;
    }

  }


}
