import 'package:api_lab/constant/colors.dart';
import 'package:api_lab/extensions/screen_handler.dart';
import 'package:api_lab/view/login/login.dart';
import 'package:api_lab/view/profile/bloc/profile_bloc.dart';
import 'package:api_lab/widgets/text_field_widget.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: darkblue,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.transparent,
        actionsIconTheme: IconThemeData(color: light),
        title: Text(
          "Profile",
          style:
              TextStyle(color: text, fontWeight: FontWeight.bold, fontSize: 30),
        ),
        actions: [
          IconButton(
            onPressed: () {
              context.pushTo(view: LoginScreen());
            },
            icon: Icon(Icons.logout_outlined),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Center(
            child: BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, state) {
                if (state is ProfileLoadingState) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is ProfileLoadState) {
                  return FlipCard(
                    front: Container(
                      width: context.getWidth(),
                      height: context.getHeight() * 0.40,
                      decoration: BoxDecoration(
                          color: light,
                          borderRadius: BorderRadius.circular(25),
                          border: Border.symmetric(
                              vertical: BorderSide(color: text, width: 5))),
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: context.getWidth(),
                            height: context.getHeight() * 0.40,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                CircleAvatar(
                                  minRadius: 100,
                                  maxRadius: 100,
                                  backgroundImage: NetworkImage(
                                    state.user.avatar!,
                                  ),
                                ),
                                Text(
                                  state.user.name!,
                                  style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                      color: blue),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    back: Container(
                      width: context.getWidth(),
                      height: context.getHeight() * 0.45,
                      decoration: BoxDecoration(
                          color: cold,
                          borderRadius: BorderRadius.circular(25),
                          border: Border.symmetric(
                              vertical: BorderSide(color: text, width: 5))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            padding: EdgeInsets.all(32),
                            alignment: Alignment.center,
                            width: context.getWidth(),
                            height: context.getHeight() * 0.45,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  state.user.name!,
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: darkblue),
                                ),
                                Divider(),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  "Email: ${state.user.email}",
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: blue),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  "Password: ${state.user.password}",
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: darkblue),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  "Role: ${state.user.role}",
                                  style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                      color: blue),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: darkblue,
                                          maximumSize: const Size(200, 200)),
                                      onPressed: () {
                                        showBottomSheet(
                                            context: context,
                                            builder: (context) {
                                              return Container(
                                                width: context.getWidth(),
                                                height: 300,
                                                color: darkblue,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      TextFieldWidget(
                                                          label: "Name",
                                                          icon: Icons.edit,
                                                          controller:
                                                              nameController,
                                                          isObscure: false),
                                                      ElevatedButton(
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                                  backgroundColor:
                                                                      cold),
                                                          onPressed: () {
                                                            context
                                                                .read<
                                                                    ProfileBloc>()
                                                                .add(ProfileEditEvent(
                                                                    name: nameController
                                                                        .text,
                                                                    user: state
                                                                        .user));
                                                            Navigator.pop(
                                                                context);
                                                          },
                                                          child: Text(
                                                            "Edit",
                                                            style: TextStyle(
                                                                color: text,
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold),
                                                          )),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            });
                                      },
                                      child: Text(
                                        "Edit",
                                        style: TextStyle(
                                            color: cold,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            letterSpacing: 1),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                } else {
                  return Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: light,
                          maximumSize: const Size(200, 200)),
                      onPressed: () {
                        context.pushTo(view: LoginScreen());
                      },
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: darkblue,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            letterSpacing: 1),
                      ),
                    ),
                  );
                }
              },
            ),
          ),
        ),
      ),
    );
  }
}
