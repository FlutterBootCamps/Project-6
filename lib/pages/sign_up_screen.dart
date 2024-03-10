import 'package:asignmet4/helper/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/signup_bloc.dart';
import 'sign_in_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Controllers for name, email, and password fields
    final TextEditingController nameController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: Colors.white),
      ),
      body: BlocProvider(
        create: (context) => SignupBloc(),
        child: BlocConsumer<SignupBloc, SignupState>(
          listener: (context, state) {
            if (state is SuccessState) {
              // Navigate to sign-in screen after successful sign-up
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => SignInScreen()),
                (route) => false,
              );
            } else if (state is ErrorState) {
              // Handle error state
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Error'),
                  content: Text('An error occurred during sign up process'),
                  actions: <Widget>[
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('OK'),
                    ),
                  ],
                ),
              );
            }
          },
          builder: (context, state) {
            return Container(
              width: double.infinity,
              // Background decoration
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('image/background.PNG'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  // Gradient overlay for better readability of content
                  gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    colors: [
                      Colors.black.withOpacity(.9),
                      Colors.black.withOpacity(.4),
                    ],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 20),
                      // Text form field for name input
                      TextFormField(
                        controller: nameController,
                        style: TextStyle(
                          color: emailController.text.isNotEmpty ? Colors.white : Colors.white,
                        ),
                        decoration: const InputDecoration(
                          hintText: "Name",
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Text form field for email input
                      TextFormField(
                        controller: emailController,
                        style: TextStyle(
                          color: emailController.text.isNotEmpty ? Colors.white : Colors.white,
                        ),
                        decoration: const InputDecoration(
                          hintText: "Email",
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Text form field for password input
                      TextFormField(
                        controller: passwordController,
                        style: TextStyle(
                          color: emailController.text.isNotEmpty ? Colors.white : Colors.white,
                        ),
                        decoration: const InputDecoration(
                          hintText: "Password",
                          hintStyle: TextStyle(color: Colors.grey),
                        ),
                      ),
                      const SizedBox(height: 30),
                      // Sign-up button
                      GestureDetector(
                        onTap: () {
                          // Dispatch sign-up event when the button is tapped
                          BlocProvider.of<SignupBloc>(context).add(
                            SuccessSignUpEvent(
                              name: nameController.text,
                              email: emailController.text,
                              password: passwordController.text,
                            ),
                          );
                        },
                        child: Container(
                          width: 180,
                          height: 39,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(19),
                            color: white,
                          ),
                          child: const Center(
                            child: Text(
                              "Sign Up",
                              style: TextStyle(color: dark),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
