import 'package:api_page_lab/controller/auth_controller.dart';
import 'package:api_page_lab/controller/home_controller.dart';
import 'package:api_page_lab/controller/profile_controller.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final locater = GetIt.I;
SharedPreferences? prefs;

setup() async {
  locater.registerSingleton<AuthController>(AuthController());
  locater.registerSingleton<HomeController>(HomeController());
  locater.registerSingleton<ProfileController>(ProfileController());

  prefs = await SharedPreferences.getInstance();
}
