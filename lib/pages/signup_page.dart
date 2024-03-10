import 'package:api_page_lab/controller/auth_controller.dart';
import 'package:api_page_lab/models/create_user_model.dart';
import 'package:api_page_lab/pages/home/home_page.dart';
import 'package:api_page_lab/pages/login/login_page.dart';
import 'package:api_page_lab/services/setup.dart';
import 'package:api_page_lab/utils/snack_bar.dart';
import 'package:api_page_lab/widgets/button_widget.dart';
import 'package:api_page_lab/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final serviceLocate = locater.get<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                const Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Lets Register\nAccount",
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.w800),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Hello user, you\nhave a greatful journey",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
                TextFieldWidget(
                  hint: "name",
                  label: "Name",
                  controller: nameController,
                ),
                TextFieldWidget(
                  hint: "email",
                  label: "Email",
                  controller: emailController,
                ),
                TextFieldWidget(
                  hint: "*********",
                  label: "Password",
                  controller: passController,
                ),
                const SizedBox(
                  height: 20,
                ),
                purbleButton(
                  text: "Sign up",
                  onPressed: () async {
                    CreateUser user = CreateUser(
                        name: nameController.text,
                        password: passController.text,
                        email: emailController.text);

                    bool isRegister = await serviceLocate.register(user);

                    if (isRegister) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return LoginPage();
                      }));
                    } else {
                       SnackBarToast(
                   "You are registered already",
                      );
                    }
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Already have an account ?"),
                    TextButton(
                        onPressed: () async {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return LoginPage();
                          }));
                        },
                        child: const Text("Sing up"))
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
