import "dart:convert";

import "package:http/http.dart" as http;
import "package:my_store/model/user_model.dart";

class NetworkingUser {
  String baseUrlOfTheUsers = "https://api.escuelajs.co/api/v1/users/";

////////////////// user create  /////////////////////////////

  Future<User> CreateUser(
      {required User user,}) async {
    final urlApi = Uri.parse(baseUrlOfTheUsers);
    final userInfo = {
      "name": user.name,
      "email": user.email,
      "password": user.password,
      "avatar": user.avatar
    };

    final response = await http.post(urlApi, body: userInfo);

    if (response.statusCode >= 200 || response.statusCode <= 299) {
      User user = User.fromJson(json.decode(response.body));
      return user;
    } else {
      throw Exception("no data from Api");
    }
  }

  Future<List<User>> getAlltUser() async {
    final urlApi = Uri.parse(baseUrlOfTheUsers);
    final response = await http.get(urlApi);
    List<User> users = [];
    if (response.statusCode == 200) {
      for (var productDetails in json.decode(response.body)) {
        User user = User.fromJson(productDetails);
        users.add(user);
      }
      return users;
    } else {
      throw Exception("no data from Api");
    }
  }



  Future<User> getOneUser({required int id}) async {
    final urlApi = Uri.parse("$baseUrlOfTheUsers$id");
    final response = await http.get(urlApi);
    if (response.statusCode == 200) {
      User user = User.fromJson(json.decode(response.body));
      return user;
    } else {
      throw Exception("no data from Api");
    }
  }

  Future<User> updateUser(
      {required User userData}) async {
    final urlApi = Uri.parse(baseUrlOfTheUsers);
    final user = {
      "name": userData.name,
      "email": userData.email,
      "password": userData.password,
      "avatar": userData.avatar
    };

    final response = await http.put(urlApi, body: user);

    if (response.statusCode == 200) {
      User user = User.fromJson(json.decode(response.body));
      return user;
    } else {
      throw Exception("no data from Api");
    }
  }

  Future<User> isAvailableUser(
      {required String name,
      required String email,
      required String password,
      required String image}) async {
    final urlApi = Uri.parse(baseUrlOfTheUsers);
    final user = {"email": email};

    final response = await http.post(urlApi, body: user);

    if (response.statusCode == 200) {
      User user = User.fromJson(json.decode(response.body));
      return user;
    } else {
      throw Exception("no data from Api");
    }
  }

  ////////////////// categories create  /////////////////////////////

  Future<List> Login({required String email, required String password}) async {
    final urlApi = Uri.parse("https://api.escuelajs.co/api/v1/auth/login");
    final user = {"email": email.toLowerCase(), "password": password};

    final response = await http.post(urlApi, body: user);
    List result = [];
    var jsonData = json.decode(response.body);
    print(response.body);
    if (response.statusCode == 201) {
      result.add(response.statusCode);
      result.add(jsonData["access_token"]);
      
      return result;
    } else {
      result.add("the email or password is incorrect");
      return result;
    }
    // If jsonData is a list, loop through it
  }

////////////////// categories create  /////////////////////////////

  Future<User> Profile({required token}) async {
    final urlApi = Uri.parse("https://api.escuelajs.co/api/v1/auth/profile");
    final key = {"Authorization": "Bearer $token"};

    final response = await http.get(urlApi, headers: key);

    var jsonData = User.fromJson(json.decode(response.body));
    print(response.body);
    return jsonData;
    // If jsonData is a list, loop through it
  }
}
