import 'dart:convert';
import 'dart:io';

import 'package:api_app/models/response_upload.dart';
import 'package:api_app/models/user_models.dart';
import 'package:api_app/network/constent_api.dart';
import 'package:api_app/network/endpoint_auth.dart';
import 'package:http/http.dart' as http;

class LoginApi with Api, AuthENdPoint {
  Future signUpMethod({required UserModel user}) async {
    try {
      await http.post(Uri.parse(api + signUpENDPOINT),
          body: json.encode(user.toMapSend()));
    } catch (error) {
      throw FormatException(error.toString());
    }
  }

  Future<ResponseUpload> uploadImageMethod({required String path}) async {
    try {
      final response = await http.post(
          Uri.parse('https://api.escuelajs.co/api/v1/files/upload'),
          body: json.encode(await File(path).readAsBytes()));

      return ResponseUpload.fromJson(json.decode(response.body));
    } catch (error) {
      throw FormatException(error.toString());
    }
  }
}
