import 'package:api_page_lab/controller/auth_controller.dart';
import 'package:api_page_lab/models/login_model.dart';
import 'package:api_page_lab/pages/home/home_page.dart';
import 'package:api_page_lab/pages/navigationbar/bottom_nav_bar.dart';
import 'package:api_page_lab/pages/signup_page.dart';
import 'package:api_page_lab/services/setup.dart';
import 'package:api_page_lab/utils/snack_bar.dart';
import 'package:api_page_lab/widgets/button_widget.dart';
import 'package:flutter/material.dart';

import '../../widgets/text_field_widget.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  TextEditingController passController = TextEditingController(text: "123123");
  TextEditingController emailController =
      TextEditingController(text: "mrm@gmail.com");
  final serviceLocate = locater.get<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 30,
                ),
                const Text(
                  "Lets Sign you in",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  "Welcome Back , \nYou have been missed",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 40,
                ),
                TextFieldWidget(
                  hint: "Example@gmail.com",
                  label: "Email",
                  controller: emailController,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFieldWidget(
                  hint: "******",
                  label: "Password",
                  controller: passController,
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Forgot Password?",
                      style: TextStyle(decoration: TextDecoration.underline),
                    )),
                const SizedBox(
                  height: 20,
                ),
                purbleButton(
                  text: "Login",
                  onPressed: () async {
                    LoginModel user = LoginModel(
                        password: passController.text,
                        email: emailController.text);
                    bool isLogin = await serviceLocate.login(user);
                    if (isLogin) {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> BottomNavBar()));
                    } else {
                       SnackBarToast(
                         "you'r not register",
                      );
                    }
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don't have an aacount ?"),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignupPage()));
                        },
                        child: const Text("Register Now"))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
