import 'dart:convert';
import 'dart:io';

import 'package:api_lab/model/upload_Image.dart';
import 'package:api_lab/model/user_model.dart';
import 'package:http/http.dart' as http;

class UserServices {
  // Create user
  Future<UserModel> createUser(
      {required String name,
      required String email,
      required String password,
      required String avatar}) async {
    final url = "https://api.escuelajs.co/api/v1/users/";
    final uri = Uri.parse(url);

    final userInfo = {
      "name": name,
      "email": email,
      "password": password,
      "avatar": avatar
    };

    final request = await http.post(uri, body: userInfo);
    final res = json.decode(request.body);
    UserModel user = UserModel.fromJson(res);
    return user;
  }

  //login
  Future<Map<String, dynamic>> loginUser(
      {required String email, required String password}) async {
    final url = "https://api.escuelajs.co/api/v1/auth/login";
    final uri = Uri.parse(url);

    final userInfo = {
      "email": email,
      "password": password,
    };

    final request = await http.post(uri, body: userInfo);
    final res = json.decode(request.body);

    return res;
  }

  //Profile
  Future<UserModel> getUserProfile({required String token}) async {
    final url = "https://api.escuelajs.co/api/v1/auth/profile";
    final uri = Uri.parse(url);

    final request =
        await http.get(uri, headers: {"Authorization": "Bearer $token"});
    final res = json.decode(request.body);
    UserModel user = UserModel.fromJson(res);
    return user;
  }

  //Update Profile
  Future<UserModel> getUpdateUserProfile({required UserModel user}) async {
    final url = "https://api.escuelajs.co/api/v1/users/${user.id}";
    final uri = Uri.parse(url);
    final userInfo = {
      "name": user.name,
    };
    final request = await http.put(uri,
        headers: {"Authorization": "Bearer ${user.token}"}, body: userInfo);
    final res = json.decode(request.body);
    user = UserModel.fromJson(res);
    return user;
  }

  //Upload image
  Future<UploadImage?> uploadAvatar({required String path}) async {
    try {
      final request = http.MultipartRequest(
          "POST", Uri.parse('https://api.escuelajs.co/api/v1/files/upload'));

      request.files.add(http.MultipartFile.fromBytes(
          'file', File(path).readAsBytesSync(),
          filename: "avatar"));
      var stream = await request.send();
      var res = await http.Response.fromStream(stream);

      return UploadImage.fromJson(json.decode(res.body));
    } catch (e) {
      throw FormatException(e.toString());
    }
  }

  //get All User
  Future<List<UserModel>> getAllUsers() async {
    final request =
        await http.get(Uri.parse("https://api.escuelajs.co/api/v1/users/"));
    final res = json.decode(request.body);

    List<UserModel> users = [];
    for (var element in res) {
      users.add(UserModel.fromJson(element));
    }
    return users;
  }

  //get one User
  Future<UserModel> getUser({required int id}) async {
    final request =
        await http.get(Uri.parse("https://api.escuelajs.co/api/v1/users/$id"));
    if (request.statusCode == 200) {
      final UserModel user = UserModel.fromJson(json.decode(request.body));
      return user;
    }else{
      throw FormatException();
    }
  }

  //get Profile Picture
  Future<UploadImage> getProfileAvatar({required String fileName}) async {
    final request = await http
        .get(Uri.parse("https://api.escuelajs.co/api/v1/files/$fileName"));
    final UploadImage image = UploadImage.fromJson(json.decode(request.body));

    return image;
  }
}
