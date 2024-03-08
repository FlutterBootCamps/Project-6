import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_week6_day3_lab/bloc/user_bloc.dart';
import 'package:flutter_week6_day3_lab/helpers/extensions/screen_helper.dart';
import 'package:flutter_week6_day3_lab/screens/navigation_page.dart';
import 'package:flutter_week6_day3_lab/screens/signup_page.dart';
import 'package:flutter_week6_day3_lab/utils/colors.dart';
import 'package:flutter_week6_day3_lab/utils/fonts.dart';
import 'package:flutter_week6_day3_lab/widgets/text_field_iconed.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: BlocConsumer<UserBloc, UserState>(
              listener: (context, state) {
                if (state is UserLoggedInState) {
                  context.showSuccessSnackBar(
                      context, "Logged in sucessfully!");
                  context.push(context, const NavigationPage(), false);
                } else if (state is UserLogInErrorState) {
                  context.showErrorSnackBar(context, state.msg,);
                }
              },
              builder: (context, state) {
                if (state is UserLoginLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: blackColor,
                    ),
                  );
                } else if (state is UserLoggedInState) {
                  return Container();
                }
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Thingzz",
                          style: TextStyle(
                              color: blackColor,
                              fontFamily: playFairFont,
                              fontSize: 42,
                              fontWeight: FontWeight.bold),
                        )),
                    const Text(
                      "Where you can find all the Thingzz you like.",
                      style: TextStyle(
                          color: blackColor,
                          fontFamily: workSansFont,
                          fontSize: 24),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    const Text(
                      "Login",
                      style: TextStyle(
                        color: blackColor,
                        fontFamily: playFairFont,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    TextFieldIconed(
                      controller: emailController,
                      hintText: "Enter your email",
                      label: "Email",
                      icon: const Icon(
                        Icons.mail,
                        color: blackColor,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFieldIconed(
                      controller: passwordController,
                      hintText: "Enter your password",
                      label: "Password",
                      icon: const Icon(
                        Icons.lock,
                        color: blackColor,
                      ),
                      isObscured: true,
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    RichText(
                        text: TextSpan(
                            text: "You don't have an account? ",
                            style: const TextStyle(
                                color: blackColor, fontFamily: workSansFont),
                            children: [
                          TextSpan(
                              text: "Sign up",
                              style: const TextStyle(
                                color: blackColor,
                                fontFamily: workSansFont,
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  context.push(context, SignupPage(), false);
                                })
                        ]))
                  ],
                );
              },
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 32, right: 32, bottom: 12),
        child: ElevatedButton(
          onPressed: () {
            context.read<UserBloc>().add(LoginEvent(
                email: emailController.text,
                password: passwordController.text));
          },
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(blackColor)),
          child: const Text(
            "Login",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}
