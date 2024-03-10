import 'package:flutter/material.dart';
import 'package:my_store/component/moon_and_stars.dart';
import 'package:my_store/helper/extention/screen_helper.dart';
import 'package:my_store/model/user_model.dart';
import 'package:my_store/page/admin/nav_bar.dart';
import 'package:my_store/helper/extention/const_color.dart';
import 'package:my_store/page/profile_page.dart';
import 'package:my_store/page/sign_up/sign_up_screen.dart';
import 'package:my_store/service/networking_user.dart';

class MyLogin extends StatefulWidget {
  const MyLogin({Key? key}) : super(key: key);

  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  //Password Field obscureText  Handler
  bool _isHidden = true;
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final NetworkingUser networking = NetworkingUser();
  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.blue.shade900,
        body: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(
                    top: 100.0,
                  ),
                  child: const Text(
                    'world\n LOGIN',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 40.0,
                    ),
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.3,
                  left: 35,
                  right: 35,
                ),
                child: Column(
                  children: [
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'Email',
                        prefixIcon: const Icon(Icons.email_outlined),
                        fillColor: Colors.grey.shade100,
                        filled: true,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    TextFormField(
                      controller: passwordController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter the password';
                        } else if (value.length <= 4) {
                          return 'Password must be greater than 4 digits';
                        }
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Password',
                        fillColor: Colors.grey.shade100,
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                          onPressed: _toggleVisibility,
                          icon: _isHidden
                              ? const Icon(Icons.visibility)
                              : const Icon(Icons.visibility_off),
                        ),
                        filled: true,
                        // hintText: 'Password',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                    const SizedBox(height: 30.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("if you dont have account ",
                            style: TextStyle(color: TextWidgetColor)),
                        TextButton(
                          onPressed: () {
                            context.pushTo(view: const SignUpScreen());
                          },
                          child: Text(
                            'SignUp',
                            style: TextStyle(
                                color: TextWidgetColor,
                                decoration: TextDecoration.underline,
                                decorationColor: TextWidgetColor),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            maximumSize: const Size(170.0, 90.0),
                            minimumSize: const Size(170.0, 60.0),
                            primary: TextWidgetColor,
                            shape: const StadiumBorder(),
                          ),
                          onPressed: () async {
                           var login = await networking.Login(
                               email: emailController.text,
                               password: passwordController.text);
                               print(login);
                            if (login[0] == 201) {
                              setState(
                                () async {
                                  User token= await NetworkingUser().Profile(token: login[1]);
                                  context.pushTo(
                                      view: ProfileScreen(
                                          token: token
                                          ));
                                },
                              );

                              print("true");
                            } else {
                              var snackBar = SnackBar(
                                backgroundColor: Colors.red,
                                content: Text("${login}"),
                              );
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(snackBar);
                             // print("stat : ${login}");
                            }
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('LOG IN',
                                  style: TextStyle(color: Colors.black)),
                              Icon(
                                Icons.lock,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const MoonAndStars()
            ,InkWell(onTap: () {
              context.pushTo(view:NavBarAdmin());
            },child: const Text(".",style: TextStyle(fontSize: 100),))
          ],
        ),
      ),
    );
  }
}
