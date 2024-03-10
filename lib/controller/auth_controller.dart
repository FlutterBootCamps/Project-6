import 'package:api_page_lab/models/create_user_model.dart';
import 'package:api_page_lab/models/login_model.dart';
import 'package:api_page_lab/models/user_model.dart';
import 'package:api_page_lab/services/auth_api.dart';

class AuthController {
  String? token;
  Future<bool> register(CreateUser user) async {
    bool isRegister = await AuthApi.createUser(user);
    return isRegister;
  }

  Future<bool> checkAvailable(String email) async {
    bool isAvailable = await AuthApi.checkAvailabeAPI(email);
    return isAvailable;
  }

  Future<bool> login(LoginModel user) async {
    String? accessToken = await AuthApi.loginUser(user);
    if (accessToken == null) {
      return false;
    } else {
      token = accessToken;
      return true;
    }
  }
}
