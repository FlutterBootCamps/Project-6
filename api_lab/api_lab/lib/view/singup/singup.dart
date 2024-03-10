import 'package:api_lab/constant/colors.dart';
import 'package:api_lab/extensions/screen_handler.dart';

import 'package:api_lab/view/login/login.dart';
import 'package:api_lab/view/singup/bloc/signup_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../widgets/profile_image.dart';
import '../../widgets/text_field_widget.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupBloc, SignupState>(listener: (context, state) {
      if (state is SignupSuccessState) {
      
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
        context.pushTo(view: LoginScreen());
      } else if (state is SignupErrorState) {
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
    }, builder: (context, state) {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: darkblue,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Center(
              child: Container(
                width: context.getWidth() * 0.80,
                height: context.getHeight() * 0.70,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: cold, borderRadius: BorderRadius.circular(50)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BlocBuilder<SignupBloc, SignupState>(
                      builder: (context, state) {
                        final bloc = context.read<SignupBloc>();
                        return ProfileImage(
                          isSelected: bloc.isSelected,
                          path: bloc.pathImage,
                          onTap: () {
                            context.read<SignupBloc>().add(UploadImageEvent());
                          },
                        );
                      },
                    ),
                    TextFieldWidget(
                      label: "Name",
                      icon: Icons.person,
                      controller: nameController,
                      isObscure: false,
                    ),
                    TextFieldWidget(
                      label: "Email",
                      icon: Icons.email,
                      controller: emailController,
                      isObscure: false,
                    ),
                    TextFieldWidget(
                      label: "Password",
                      icon: Icons.lock,
                      isObscure: true,
                      controller: passwordController,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: darkblue,
                          maximumSize: const Size(200, 200)),
                      onPressed: () {
                        context.read<SignupBloc>().add(CreateUserEvent(
                            userName: nameController.text,
                            email: emailController.text,
                            password: passwordController.text));
                      },
                      child: Text(
                        "SingUp",
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
                            context.pushTo(view: LoginScreen());
                          },
                          child: Text(
                            "Have account? Login",
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
            ),
          ),
        ),
      );
    });
  }
}
