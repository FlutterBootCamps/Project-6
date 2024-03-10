
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/component/field_auth.dart';
import 'package:my_store/component/moon_and_stars.dart';
import 'package:my_store/component/picker_image_widget.dart';
import 'package:my_store/helper/extention/dialog.dart';
import 'package:my_store/page/sign_up/bloc/sign_up_bloc.dart';
import 'package:my_store/page/log_in/login.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpBloc(),
      child: Builder(builder: (context) {
        final bloc = context.read<SignUpBloc>();
        return Scaffold(backgroundColor: const Color.fromARGB(255, 8, 48, 107),
          body: Stack(
            children:[ BlocConsumer<SignUpBloc, SignUpState>(
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
                      builder: (context) => const MyLogin()));
                }
                if (state is ErrorState) {
                  Navigator.pop(context);
                  context.getDialog(type: TypeDialog.error);
                }
              },
              builder: (context, state) {
                return ListView(
                  children: [const SizedBox(height: 50,),
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
const MoonAndStars()
          ]),
        );
      }),
    );
  }
}
