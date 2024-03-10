import 'package:api_lab/constant/colors.dart';
import 'package:api_lab/extensions/screen_handler.dart';
import 'package:api_lab/view/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:api_lab/view/login/bloc/login_bloc.dart';
import 'package:api_lab/view/profile/bloc/profile_bloc.dart';
import 'package:api_lab/view/singup/singup.dart';
import 'package:api_lab/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          context.read<ProfileBloc>().add(ProfileLoadDataEvent(
              tokenKey: context.read<LoginBloc>().tokenKey));
          context.pushTo(view: BottomNavBar());
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.msg,
                style: TextStyle(
                  color: text,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              backgroundColor: successMsg,
            ),
          );
        } else if (state is LoginErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                state.msg,
                style: TextStyle(
                  color: text,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              backgroundColor: errorMsg,
            ),
          );
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: darkblue,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Lottie.network(
                      "https://lottie.host/d5261f37-4a0b-482e-9f00-ca740bad6018/2DygSyNGyA.json"),
                  Text(
                    "Welcome back",
                    style: TextStyle(
                        color: light,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30),
                    width: context.getWidth() * 0.80,
                    height: context.getHeight() * 0.40,
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        color: cold, borderRadius: BorderRadius.circular(50)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        TextFieldWidget(
                          icon: Icons.email,
                          isObscure: false,
                          label: "Email",
                          controller: emailController,
                        ),
                        TextFieldWidget(
                          icon: Icons.lock,
                          isObscure: true,
                          label: "Password",
                          controller: passwordController,
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: darkblue,
                              maximumSize: const Size(200, 200)),
                          onPressed: () {
                            context.read<LoginBloc>().add(Login(
                                email: emailController.text,
                                password: passwordController.text));
                          },
                          child: Text(
                            "Login",
                            style: TextStyle(
                                color: cold,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                letterSpacing: 1),
                          ),
                        ),
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                context.pushTo(view: SignupScreen());
                              },
                              child: Text(
                                "New user? SignUp",
                                style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: blue,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
