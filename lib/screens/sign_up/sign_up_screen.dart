import 'dart:io';

import 'package:api_app/helper/getImage.dart';
import 'package:api_app/screens/login_screen.dart';
import 'package:api_app/screens/sign_up/bloc/sign_up_bloc.dart';
import 'package:api_app/screens/sign_up/login_screen.dart';
import 'package:api_app/widgets/field_auth.dart';
import 'package:api_app/widgets/picker_image_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpBloc(),
      child: Builder(builder: (context) {
        final bloc = context.read<SignUpBloc>();
        return Scaffold(
          backgroundColor: Colors.amber[50],
          body: BlocConsumer<SignUpBloc, SignUpState>(
            listener: (context, state) {
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
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>  LogInScreen()));
              }
              if (state is ErrorState) {
                Navigator.pop(context);
                context.getDialog(type: TypeDialog.error);
              }
            },
            builder: (context, state) {
              return ListView(
                children: [
                  PickerImageWidget(
                    isSelected: bloc.isSelected,
                    urlPath: bloc.urlImage,
                    selectedPath: bloc.pathImage,
                    onTap: () async {
                      bloc.add(ChangeImageEvent());
                    },
                  ),
                  FieldAuth(
                    labelText: "name",
                    controller: bloc.controllerName,
                  ),
                  FieldAuth(
                    labelText: "Email",
                    controller: bloc.controllerEmail,
                  ),
                  FieldAuth(
                    labelText: "Password",
                    controller: bloc.controllerPassword,
                  ),
                  Center(
                      child: ElevatedButton(
                          onPressed: () {
                            bloc.add(CreateAccountEvent());
                          },
                          child: const Text("Create")))
                ],
              );
            },
          ),
        );
      }),
    );
  }
}

extension Dialog on BuildContext {
  getDialog({required TypeDialog type}) {
    return showDialog(
        context: this,
        builder: (context) {
          return AlertDialog(
            elevation: 0,
            backgroundColor:
                type == TypeDialog.success ? Colors.green : Colors.red,
            content: const SizedBox(
              height: 150,
              width: 150,
              child: Center(child: Text("There is error")),
            ),
          );
        });
  }
}

enum TypeDialog { success, error }
