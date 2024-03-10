import 'package:asignmet4/helper/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/user_bloc.dart';
import '../navbar/nav_bottom.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    // Controllers for email and password fields
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
        create: (context) => UserBloc(),
        child: BlocConsumer<UserBloc, UserState>(
          listener: (context, state) {
            if (state is SignInState) {
              // Navigate to the bottom navigation bar after successful sign-in
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => NavBottom()),
                (route) => false,
              );
            } else if (state is ErrorState) {
              // Show an error dialog if sign-in fails
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Error'),
                  content: Text(state.wrongSignIn),
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
                      // Text form field for email input
                      TextFormField(
                        controller: emailController,
                        style: TextStyle(
                          color: emailController.text.isNotEmpty ? Colors.white : Colors.white,
                        ),
                        decoration: const InputDecoration(
                          hintStyle: TextStyle(color: Colors.grey),
                          hintText: "Email",
                        ),
                      ),
                      const SizedBox(height: 20),
                      // Text form field for password input
                      TextFormField(
                        controller: passwordController,
                        style: TextStyle(
                          color: passwordController.text.isNotEmpty ? Colors.white : Colors.white,
                        ),
                        decoration: const InputDecoration(
                          hintStyle: TextStyle(color: Colors.grey),
                          hintText: "Password",
                        ),
                      ),
                      const SizedBox(height: 30),
                      // Sign-in button
                      GestureDetector(
                        onTap: () {
                          // Dispatch sign-in event when the button is tapped
                          BlocProvider.of<UserBloc>(context).add(
                            SuccessSignInEvent(
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
                              "Sign In",
                              style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
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
