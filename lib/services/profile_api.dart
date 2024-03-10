

import 'dart:convert';

import 'package:api_page_lab/models/user_model.dart';
import 'package:http/http.dart' as http;

class ProfileAPI{

  static Future<UserModel?> fetchProfileAPI(String token) async {
    String url = "https://api.escuelajs.co/api/v1/auth/profile";
    final headers = {
      "authorization": "Bearer $token"
    };
    print(headers);

    final request = await http.get(Uri.parse(url), headers: headers);
    final res = json.decode(request.body);
    print(res);

    if(request.statusCode == 200){
      UserModel user = UserModel.fromJson(res);
      return user;
    }else{
      return null;
    }




  }


}