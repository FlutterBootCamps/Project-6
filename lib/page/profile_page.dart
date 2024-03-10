import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/component/field_auth.dart';
import 'package:my_store/component/moon_and_stars.dart';
import 'package:my_store/helper/extention/dialog.dart';
import 'package:my_store/model/user_model.dart';
import 'package:my_store/page/sign_up/bloc/sign_up_bloc.dart';
import 'package:my_store/page/log_in/login.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key, required  this.token});
  final User token;
  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => SignUpBloc(),
      child: Builder(
        builder: (context) {
              final bloc = context.read<SignUpBloc>();
    TextEditingController nameController =
        TextEditingController(text:token.name);
    TextEditingController emailController =
        TextEditingController(text: token.email);
    TextEditingController PasswordController =
        TextEditingController(text: token.password);
          return Scaffold(
            backgroundColor: const Color.fromARGB(255, 8, 48, 107),
            body: Stack(children: [
              BlocConsumer<SignUpBloc, SignUpState>(
                listener: (context, state) {
                                //  bloc.add(ShowProfileEvent());

                  if (state is LoadingState) {
                    showDialog(
                        barrierDismissible: false,
                        barrierColor: Colors.transparent,
                        context: context,
                        builder: (context) {
                          return const AlertDialog(
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            content: SizedBox(
                              height: 150,
                              width: 150,
                              child: Center(
                                child: CircularProgressIndicator(),
                              ),
                            ),
                          );
                        });
                  }
          
                  if (state is SuccessState) {
                    Navigator.pop(context);
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const MyLogin()));
                  }
                  if (state is ErrorState) {
                    Navigator.pop(context);
                    context.getDialog(type: TypeDialog.error);
                  }
                },
                builder: (context, state) {
                  return ListView(
                    children: [
                      SizedBox(
                        height: 100,
                      ),
Image.network(bloc.image),
                      FieldAuth(
                        labelText: "name",
                        controller: nameController,
                      ),
                      FieldAuth(
                        labelText: "Email",
                        controller: emailController,
                      ),
                      FieldAuth(
                        labelText: "Password",
                        controller: PasswordController,
                      ),
                      Center(
                          child: ElevatedButton(
                              onPressed: () {
                                bloc.add(UpdateUserEvent());
                              },
                              child: const Text("update")))
                    ],
                  );
                },
              ),
              const MoonAndStars()
            ]),
          );
        }
      ),
    );
  }
}
