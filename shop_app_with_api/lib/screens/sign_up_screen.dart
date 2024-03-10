import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_with_api/bloc/registration_bloc.dart';
import 'package:shop_app_with_api/constant/color.dart';
import 'package:shop_app_with_api/constant/space.dart';
import 'package:shop_app_with_api/helper/helper_screen.dart';
import 'package:shop_app_with_api/screens/login_screen.dart';
import 'package:shop_app_with_api/widgets/image_picker.dart';
import 'package:shop_app_with_api/widgets/text_field_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegistrationBloc(),
      child: Builder(builder: (context) {
        final bloc = context.read<RegistrationBloc>();
        return Scaffold(
            body: Container(
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
            if (state is SuccessState) {
              Navigator.pop(context);
              context.pushTo(view: const LogInScreen());
            }
            // TODO: implement listener
            if (state is ErrorState) {
              Navigator.pop(context);
              context.getDialog(type: TypeDialog.error);
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
                              "Sign Up",
                              style: TextStyle(
                                  color: white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w600),
                            ),
                            height24,
                            ImagePickerWidget(
                              isSelected: bloc.isSelected,
                              urlPath: bloc.urlImage,
                              selectedPath: bloc.pathImage,
                              onTap: () async {
                                print("pressed");
                                bloc.add(ChangeImageEvent());
                              },
                            ),
                            height12,
                            TextFieldWidget(
                              hintText: "Enter Your Name",
                              labelText: "Name",
                              controller: bloc.nameController,
                            ),
                            height12,
                            TextFieldWidget(
                              hintText: "Enter Your Email",
                              labelText: "Email",
                              controller: bloc.emailController,
                            ),
                            height12,
                            TextFieldWidget(
                              secretPass: true,
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
                                    bloc.add(CreateNewAccountEvent());
                                  },
                                  child: const Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 8.0),
                                    child: Text(
                                      "Create New Account",
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
                                const Text("Already have account. ",
                                    style:
                                        TextStyle(color: white, fontSize: 16)),
                                InkWell(
                                  onTap: () =>
                                      context.pushTo(view: const LogInScreen()),
                                  child: const Text("LogIn",
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
        ));
      }),
    );
  }
}
