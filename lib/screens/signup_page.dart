import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_week6_day3_lab/bloc/user_bloc.dart';
import 'package:flutter_week6_day3_lab/data_layer/home_data_layer.dart';
import 'package:flutter_week6_day3_lab/helpers/extensions/screen_helper.dart';
import 'package:flutter_week6_day3_lab/screens/login_page.dart';
import 'package:flutter_week6_day3_lab/utils/colors.dart';
import 'package:flutter_week6_day3_lab/utils/fonts.dart';
import 'package:flutter_week6_day3_lab/widgets/avatar_container.dart';
import 'package:flutter_week6_day3_lab/widgets/text_field_iconed.dart';

// ignore: must_be_immutable
class SignupPage extends StatelessWidget {
  SignupPage({super.key});
  TextEditingController nameController = TextEditingController();
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
                if (state is UserSignedUpState) {
                  context.showSuccessSnackBar(
                    context,
                    "Account Created",
                  );
                  context.push(context, LoginPage(), false);
                } else if (state is UserSignUpErrorState) {
                  context.showErrorSnackBar(
                    context,
                    state.msg,
                  );
                }
              },
              builder: (context, state) {
                if (state is UserSignUpLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: blackColor,
                    ),
                  );
                } else if (state is UserSignedUpState) {
                  return Container();
                }
                return ListView(
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
                    const Center(
                      child: Text(
                        "Sign up",
                        style: TextStyle(
                          color: blackColor,
                          fontFamily: playFairFont,
                          fontSize: 36,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    Center(child: AvatarContainer(
                      imgPath: locator.currentImagePath,
                      onTap: (){
                        context.read<UserBloc>().add(PickProfilePictureEvent());
                      },
                    )),
                    const SizedBox(
                      height: 32,
                    ),
                    TextFieldIconed(
                      controller: nameController,
                      hintText: "Enter your name",
                      label: "Name",
                      icon: const Icon(
                        Icons.person,
                        color: blackColor,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
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
                    Center(
                      child: RichText(
                          text: TextSpan(
                              text: "You already have an account? ",
                              style: const TextStyle(
                                  color: blackColor, fontFamily: workSansFont),
                              children: [
                            TextSpan(
                                text: "Login",
                                style: const TextStyle(
                                  color: blackColor,
                                  fontFamily: workSansFont,
                                  decoration: TextDecoration.underline,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    context.push(context, LoginPage(), false);
                                  })
                          ])),
                    )
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
            context.read<UserBloc>().add(SignupEvent( imgPath: locator.currentImagePath,
                email: emailController.text,
                name: nameController.text,
                password: passwordController.text,));
          },
          style: const ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(blackColor)),
          child: const Text(
            "Sign Up",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ),
    );
  }
}

