import 'dart:convert';

import 'package:flutter_week6_day3_lab/models/photo_model.dart';
import 'package:flutter_week6_day3_lab/models/user_model.dart';
import 'package:http/http.dart' as http;

class UserService {
  Future createUser({
    required String name,
    required String email,
    required String password,
    required String path,
  }) async {
    const url = 'https://api.escuelajs.co/api/v1/users/';

    final uri = Uri.parse(url);
     var user = {};
    if (path == "https://www.nicepng.com/png/full/73-730154_open-default-profile-picture-png.png"){
      user = {
      "name": name,
      "email": email,
      "password": password,
      "avatar": "https://www.nicepng.com/png/full/73-730154_open-default-profile-picture-png.png",
    };
    }else {
      Photo photo = await uploadPhoto(path);
      user = {
      "name": name,
      "email": email,
      "password": password,
      "avatar": photo.location,
    };
    }

    final request = await http.post(
      uri,
      body: user,
    );

    final response = json.decode(request.body);
    if (request.statusCode == 201) {
      print(request.statusCode);
      print(response);
    } else {
      throw const FormatException();
    }
  }

  Future<String> login(
      {required String email, required String password}) async {
    const url = 'https://api.escuelajs.co/api/v1/auth/login';

    final uri = Uri.parse(url);

    final user = {
      "email": email,
      "password": password,
    };

    final request = await http.post(
      uri,
      body: user,
    );
    final response = json.decode(request.body);
    if (request.statusCode == 201) {
      print(request.statusCode);
      print(response);
      final String token = response["access_token"];
      return token;
    } else {
      throw const FormatException();
    }
  }

  Future<User> viewProfile({required String bearerToken}) async {
    const url = 'https://api.escuelajs.co/api/v1/auth/profile';

    final uri = Uri.parse(url);

    final headers = {'Authorization': 'Bearer $bearerToken'};

    final response = await http.get(uri, headers: headers);

    if (response.statusCode == 200) {
      print(response.statusCode);
      print(response);
      final User user = User.fromJson(json.decode(response.body));
      return user;
    } else {
      throw const FormatException();
    }
  }

  Future<Photo> uploadPhoto(String imgUrl) async {
    const url = "https://api.escuelajs.co/api/v1/files/upload";

    final uri = Uri.parse(url);

    try {
      var request = http.MultipartRequest('POST', uri);
      request.files.add(await http.MultipartFile.fromPath('file', imgUrl));
      var response = await request.send();
      if (response.statusCode == 201) {
        final photo =
            Photo.fromJson(json.decode(await response.stream.bytesToString()));
        return photo;
      }else {
      throw const FormatException();
      }
    } catch (e) {
      throw const FormatException();
    }
  }

  // This service isn't working correctly from the API itself, it always returns false even if the email is available.
  Future<bool> isAvailable(String email) async{
    const url = "https://api.escuelajs.co/api/v1/users/is-available";

    final uri = Uri.parse(url);

    final emailToCheck = {
      "email": email,
    };
    final request = await http.post(uri, body: emailToCheck);

    print(request.statusCode);
    print(request.body);

    return await json.decode(request.body)["isAvailable"];
  }

  Future<List<User>> getAllUsersList() async{

    const url = "https://api.escuelajs.co/api/v1/users/";

    final uri = Uri.parse(url);

    try{
      final response = await http.get(uri);
      final List jsonList = await json.decode(response.body);
      final List<User> userList = List.generate(jsonList.length, (index) {
      return User.fromJson(jsonList[index]);
    } );
    return userList;

    }catch(e){
      throw const FormatException();
    }
  }

  Future<User> getOneUser(int id) async{
    String url = "https://api.escuelajs.co/api/v1/users/$id";

    final uri = Uri.parse(url);

    final response = await http.get(uri);

    if (response.statusCode == 200){
      final User user = User.fromJson(json.decode(response.body));
      return user;
    }else {
      throw const FormatException();
    }
  }
}
