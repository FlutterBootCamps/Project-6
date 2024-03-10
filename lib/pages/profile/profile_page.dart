import 'package:api_page_lab/constant/colors.dart';
import 'package:api_page_lab/widgets/profile_row_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/profile_bloc.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<ProfileBloc>(context).add(FetchProfileEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Profile",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if(state is SuccessState){
              return Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const CircleAvatar(
                        minRadius: 40,
                        backgroundImage: AssetImage('assets/images/person.jpeg'),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                       Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [Text(state.userModel.name!), Text(state.userModel.email!)],
                      ),
                      const Spacer(),
                      IconButton(
                          onPressed: () {
                            showModalBottomSheet(
                                context: context,
                                builder: (context) {
                                  return Container(
                                    padding: const EdgeInsets.all(30),
                                    child: Column(children: [
                                      Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          TextButton(
                                              onPressed: () {},
                                              child: Text(
                                                "Cancel",
                                                style: TextStyle(color: blackColor),
                                              )),
                                          const Text(
                                            "Edit Profile",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20),
                                          ),
                                          TextButton(
                                              onPressed: () {},
                                              child: const Text("Done"))
                                        ],
                                      ),
                                      const CircleAvatar(
                                        minRadius: 40,
                                        backgroundImage:
                                        AssetImage('assets/images/person.jpeg'),
                                      ),

                                      TextButton(
                                          onPressed: () {},
                                          child:
                                          const Text("Edit picture or avatar")),
                                      const TextField(
                                        decoration:
                                        InputDecoration(label: Text("Name")),
                                      ),
                                      const TextField(
                                        decoration:
                                        InputDecoration(label: Text("Email")),
                                      ),
                                      const TextField(
                                        decoration:
                                        InputDecoration(label: Text("Password")),
                                      )
                                    ]),
                                  );
                                });
                          },
                          icon: const Icon(Icons.edit_outlined)),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Divider(
                    color: greyColor,
                    thickness: 1,
                  ),
                  ProfileRowWidget(
                    title: "Setting",
                    icon: const Icon(Icons.settings_outlined),
                  ),
                  ProfileRowWidget(
                    title: "Send Feedback",
                    icon: const Icon(Icons.email_outlined),
                  ),
                  ProfileRowWidget(
                    title: "HelpCenter",
                    icon: const Icon(Icons.question_mark_rounded),
                  )
                ],
              );

            }else if(state is LoadingState){
              return Center(child: CircularProgressIndicator());
            }else{
              return Text("Error");
            }
          }
        ),
      )),
    );
  }
}
