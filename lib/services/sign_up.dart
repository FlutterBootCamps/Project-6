import 'dart:convert';

import 'package:http/http.dart' as http;

class UserSignUp {
  Future create(
      {required String name,
      required String email,
      required String password}) async {
    const  url = "https://api.escuelajs.co/api/v1/users/";
    final uri = Uri.parse(url);

    final userInfo = {
      "name": name,
      "email": email,
      "password": password,
      "avatar": "https://api.lorem.space/image/face?w=640&h=480"
    };

    final request = await http.post(uri, body: userInfo);

    final res = json.decode(request.body);
    print(res);
    print(request.statusCode);
  }
}
