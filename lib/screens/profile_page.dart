import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_week6_day3_lab/bloc/user_bloc.dart';
import 'package:flutter_week6_day3_lab/data_layer/home_data_layer.dart';
import 'package:flutter_week6_day3_lab/helpers/extensions/screen_helper.dart';
import 'package:flutter_week6_day3_lab/screens/admin_navigation_page.dart';
import 'package:flutter_week6_day3_lab/screens/login_page.dart';
import 'package:flutter_week6_day3_lab/utils/colors.dart';
import 'package:flutter_week6_day3_lab/utils/fonts.dart';
import 'package:flutter_week6_day3_lab/widgets/text_field_iconed.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: must_be_immutable
class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    context
        .read<UserBloc>()
        .add(ViewProfileEvent(bearerToken: locator.currentBearerToken));
    return Scaffold(
        appBar: AppBar(
          actions: [
            BlocBuilder<UserBloc, UserState>(
              builder: (context, state) {
                if (state is ShowUserInfoLoadingState){
                  return const SizedBox();
                }else if (state is ShowUserInfoState){
                  if(state.user.role == "admin"){
                    return IconButton(
                    onPressed: () {
                      context.push(context, const AdminNavigationPage(), true);
                    },
                    icon: const Icon(
                      Icons.control_camera_rounded,
                      color: blackColor,
                    ));
                  } else {
                    return const SizedBox();
                  }
                }else {
                  return const SizedBox();
                }
                
              },
            )
          ],
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const FaIcon(
              FontAwesomeIcons.chevronLeft,
              color: blackColor,
            ),
          ),
          title: const Text(
            "Profile",
            style: TextStyle(
                color: blackColor,
                fontFamily: playFairFont,
                fontSize: 24,
                fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
          child: Container(
            width: context.getWidth(context),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: BlocConsumer<UserBloc, UserState>(
              listener: (context, state) {
                if (state is UserInfoShowErrorState) {
                  context.showErrorSnackBar(
                    context,
                    state.msg,
                  );
                  Navigator.pop(context);
                }else if (state is UserSignedOutState){
                  context.showSuccessSnackBar(context, state.msg);
                }
              },
              builder: (context, state) {
                if (state is ShowUserInfoLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: blackColor,
                    ),
                  );
                } else if (state is ShowUserInfoState) {
                  nameController.text = state.user.name;
                  emailController.text = state.user.email;
                  passwordController.text = state.user.password;
                  return Column(
                    children: [
                      const SizedBox(
                        height: 16,
                      ),
                      CircleAvatar(
                        backgroundImage:
                            CachedNetworkImageProvider(state.user.avatar),
                        backgroundColor: glassColor,
                        radius: 55,
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      TextFieldIconed(
                        controller: nameController,
                        hintText: "",
                        label: "Name",
                        icon: const Icon(
                          Icons.person,
                          color: blackColor,
                        ),
                        readOnly: true,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextFieldIconed(
                        controller: emailController,
                        hintText: "",
                        label: "Email",
                        icon: const Icon(
                          Icons.mail,
                          color: blackColor,
                        ),
                        readOnly: true,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      TextFieldIconed(
                        controller: passwordController,
                        hintText: "",
                        label: "Password",
                        icon: const Icon(
                          Icons.lock,
                          color: blackColor,
                        ),
                        isObscured: true,
                        readOnly: true,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      MaterialButton(
                          minWidth: 200,
                          height: 40,
                          color: blackColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40)),
                          child: const Text(
                            "Sign out",
                            style: TextStyle(
                                color: whiteColor,
                                fontFamily: workSansFont,
                                fontSize: 24,
                                fontWeight: FontWeight.bold),
                          ),
                          onPressed: () {
                            context.read<UserBloc>().add(UserSignoutEvent(name: state.user.name));
                            context.push(context, LoginPage(), false);
                          }),
                    ],
                  );
                }
                return const Center(
                  child: Text(
                    "No User Logged in",
                    style: TextStyle(
                        color: blackColor,
                        fontFamily: workSansFont,
                        fontSize: 24),
                  ),
                );
              },
            ),
          ),
        ));
  }
}
