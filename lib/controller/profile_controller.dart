

import 'package:api_page_lab/controller/auth_controller.dart';
import 'package:api_page_lab/models/user_model.dart';
import 'package:api_page_lab/services/profile_api.dart';
import 'package:api_page_lab/services/setup.dart';

class ProfileController{

  Future<UserModel?> getProfile() async {
    String? token = locater.get<AuthController>().token;
    UserModel? user = await ProfileAPI.fetchProfileAPI(token!);
    return user;
  }

}