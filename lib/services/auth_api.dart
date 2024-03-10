import 'dart:convert';

import 'package:api_page_lab/models/create_user_model.dart';
import 'package:api_page_lab/models/login_model.dart';
import 'package:http/http.dart' as http;

class AuthApi {
  static Future<bool> createUser(CreateUser user) async {
    const urlString = "https://api.escuelajs.co/api/v1/users/";

    final body = {
      "name": user.name,
      "email": user.email,
      "password": user.password,
      "avatar": "https://t4.ftcdn.net/jpg/03/83/25/83/360_F_383258331_D8imaEMl8Q3lf7EKU2Pi78Cn0R7KkW9o.jpg"
    };

    final  http.Response response = await http.post(Uri.parse(urlString), body: body);

    print(response.body);

    final res = json.decode(response.body);

    if (response.statusCode == 201) {
      return true;
    } else {
      return false;
    }
  }

  static Future<String?> loginUser(LoginModel user) async {
    const urlString = "https://api.escuelajs.co/api/v1/auth/login";

    final body = {"email": user.email, "password": user.password};

    final reg = await http.post(Uri.parse(urlString), body: body);
    print(reg.body);

    final res = json.decode(reg.body);

    if (reg.statusCode == 201) {
      return res["access_token"];
    } else {
      return null;
    }
  }

  static Future<bool> checkAvailabeAPI(String email) async {
    const urlString = "https://api.escuelajs.co/api/v1/users/is-available";

    final body = {"email": email, };

    final reg = await http.post(Uri.parse(urlString), body: body);
    print(reg.body);

    final res = json.decode(reg.body);

    if (reg.statusCode == 201) {
      return res["isAvailable"];
    } else {
      return false;
    }
  }

}
