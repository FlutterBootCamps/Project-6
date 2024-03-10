import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_with_api/bloc/registration_bloc.dart';
import 'package:shop_app_with_api/bottom_van/bottom_nav_bar.dart';
import 'package:shop_app_with_api/constant/color.dart';
import 'package:shop_app_with_api/constant/space.dart';
import 'package:shop_app_with_api/helper/helper_screen.dart';
import 'package:shop_app_with_api/screens/categories_screen.dart';
import 'package:shop_app_with_api/screens/sign_up_screen.dart';
import 'package:shop_app_with_api/widgets/text_field_widget.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegistrationBloc(),
      child: Builder(builder: (context) {
        final bloc = context.read<RegistrationBloc>();
        return Scaffold(body: BlocBuilder<RegistrationBloc, RegistrationState>(
          builder: (context, state) {
            if(state is LogInSuccessState){
              context.pushTo( view: const BottomNavBar());                                       

            }
            return Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("asset/background.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: BlocConsumer<RegistrationBloc, RegistrationState>(
                  listener: (context, state) {
                if (state is LoadingState) {
                  showDialog(
                      barrierColor: Colors.transparent,
                      barrierDismissible: false,
                      context: context,
                      builder: (context) {
                        return const AlertDialog(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          content: SizedBox(
                            height: 100,
                            width: 100,
                            child: Center(child: CircularProgressIndicator()),
                          ),
                        );
                      });
                }
                // TODO: implement listener
                else if (state is SuccessState) {
                  Navigator.pop(context);
                  context.pushTo(view: const BottomNavBar());
                }
                // TODO: implement listener
                else if (state is ErrorState) {
                  Navigator.pop(context);
                  context.getDialog(type: TypeDialog.error);
                  // context.getDialog(type: TypeDialog.error);
                }
              }, builder: (context, state) {
                return SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            padding: const EdgeInsets.all(24),
                            alignment: Alignment.centerLeft,
                            width: context.getWidth() * 0.8,
                            height: context.getHeight() * 0.8,
                            decoration: const BoxDecoration(
                              color: lightTiffany,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(50),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "LogIn",
                                  style: TextStyle(
                                      color: white,
                                      fontSize: 30,
                                      fontWeight: FontWeight.w600),
                                ),
                                height32,
                                height12,
                                height12,
                                TextFieldWidget(
                                  hintText: "Enter Your Email",
                                  labelText: "Email",
                                  controller: bloc.emailController,
                                ),
                                height12,
                                TextFieldWidget(
                                  hintText: "Enter your password",
                                  labelText: "Password",
                                  controller: bloc.passwordController,
                                ),
                                height24,
                                Center(
                                  child: SizedBox(
                                    height: context.getHeight() * 0.05,
                                    width: context.getWidth() * 0.65,
                                    child: ElevatedButton(
                                      onPressed: () {
                                        if (bloc.emailController!.text
                                                .isNotEmpty &&
                                            bloc.passwordController!.text
                                                .isNotEmpty) {
                                          bloc.add(
                                            LogInEvent(
                                              email: bloc.emailController!.text,
                                              password:
                                                  bloc.passwordController!.text,
                                            ),
                                          );

                                          // context.snackBar(
                                          //     text: "Login Successfully");

                                          // context.pushTo(
                                          //     view: const BottomNavBar());
                                        } else {
                                          context.snackBar(
                                              text:
                                                  "Make sure to enter a correct email and password");
                                        }
                                      },
                                      child: const Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 8.0),
                                        child: Text(
                                          "LogIn",
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w600,
                                              color: tiffany),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                height24,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text("Create new account. ",
                                        style: TextStyle(
                                            color: white, fontSize: 16)),
                                    InkWell(
                                      onTap: () => context.pushTo(
                                          view: const SignUpScreen()),
                                      child: const Text("SignUp",
                                          style: TextStyle(
                                              color: tiffany,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w700)),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }),
            );
          },
        ));
      }),
    );

    //  Scaffold(
    //   body: Padding(
    //     padding: const EdgeInsets.all(24.0),
    //     child: Column(
    //       children: [
    //         Container(
    //           decoration: const BoxDecoration(
    //             image: DecorationImage(
    //                 image: AssetImage("asset/background.jpg"),
    //                 fit: BoxFit.cover,
    //                 ),
    //           ),
    //           child: Center(
    //             child: Container(
    //               decoration: const BoxDecoration(
    //                 color: white,
    //                 borderRadius: BorderRadius.only(topLeft: Radius.circular(25)),
    //               ),
    //               child: Column(
    //                 children: [
    //                   const Row(
    //                     children: [
    //                       Text(
    //                         "Sign Up",
    //                         style: TextStyle(
    //                             fontFamily: 'Lobster',
    //                             color: grey,
    //                             fontSize: 20,
    //                             fontWeight: FontWeight.w500),
    //                       ),
    //                     ],
    //                   ),
    //                   CircleAvatar(
    //                     radius: 50,
    //                     backgroundImage: FileImage(File("")), //!
    //                   ),
    //                   const TextField(
    //                     decoration: InputDecoration(
    //                       hintText: "Enter Yor Name",
    //                       hintStyle: TextStyle(
    //                         color: grey,
    //                         fontSize: 18,
    //                         fontWeight: FontWeight.w400,
    //                       ),
    //                       labelText: "Name",
    //                       labelStyle: TextStyle(
    //                         color: grey,
    //                         fontSize: 18,
    //                         fontWeight: FontWeight.w400,
    //                       ),
    //                     ),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
