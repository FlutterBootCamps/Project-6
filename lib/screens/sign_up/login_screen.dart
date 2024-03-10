import 'package:api_app/screens/sign_up/sign_up_screen.dart';
import 'package:api_app/widgets/textfieldwidgets.dart';
import 'package:api_app/view/nav_bar_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class LogInScreen extends StatelessWidget {
   LogInScreen({super.key});

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[50],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextfieldWidget(labelText: 'Email', controller: emailController),
            const SizedBox(height: 20.0),
            TextfieldWidget(
                labelText: 'Password', controller: passwordController),
            const SizedBox(height: 20.0),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: () {
                   Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const NavBarScreen()),
                );
                  String email = emailController.text;
                  String password = passwordController.text;
                  print('Email: $email');
                  print('Password: $password');

                  // Example navigation to the next screen on successful login
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: const NavBarScreen(),
                    ),
                  );
                },
                child: const Text('Login'),
              ),
            ),
            const SizedBox(height: 10.0),
            GestureDetector(
              onTap: () {
              
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const SignUpScreen()),
                );
              },
              child: const Text(
                'Don\'t have an account? Sign up',
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

