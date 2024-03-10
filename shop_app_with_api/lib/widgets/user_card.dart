import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_with_api/bloc/registration_bloc.dart';
import 'package:shop_app_with_api/constant/color.dart';
import 'package:shop_app_with_api/constant/space.dart';
import 'package:shop_app_with_api/helper/helper_screen.dart';
import 'package:shop_app_with_api/models/user_model.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key,  this.users, required this.userList});
  final UserModel? users;
  final Map<String, dynamic> userList;
  
  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();

    final bloc = context.read<RegistrationBloc>();
   
    return InkWell(
      onTap:(){
         showModalBottomSheet(
            context: context,
            builder: (context) {
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24.0, vertical: 60),
                child: Center(
                  child: SizedBox(
                    width: context.getWidth() * 0.7,
                    child: Column(
                      children: [
                        TextField(
                          style: const TextStyle(color: tiffany),
                          controller: nameController,
                          decoration: InputDecoration(
                            hintText: "Enter user name",
                            hintStyle: const TextStyle(
                                color: grey,
                                fontSize: 16,
                                fontWeight: FontWeight.w500),
                            labelText: "${userList['name']}",
                            labelStyle: const TextStyle(
                                color: grey,
                                fontSize: 18,
                                fontWeight: FontWeight.w500),
                            prefixIcon: const Icon(
                              Icons.edit,
                              color: grey,
                            ),
                            border: InputBorder.none,
                          ),
                        ),
                        height32,
                        
                        height32,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                if (nameController.text.isNotEmpty) {
                                  bloc.add(EditUserEvent(
                                    user: UserModel.fromJson(userList), // userList['id'],
                                    name: nameController.text,
                                  ));
                                  Navigator.pop(context);
                                  context.snackBar(text: "Update name Successfully");
                                } else {
                                  // context.pop(context);
                                  context.snackBar(text: "Enter valid name, can't make it empty");
                                }
                              },
                              child: const Text(
                                "Create",
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                    color: tiffany,
                                    fontSize: 22,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        
      },
      child: Container(
        margin: const EdgeInsets.all(8),
        padding: const EdgeInsets.symmetric(horizontal: 10, ),
        width: context.getWidth() * 0.8,
        height: context.getHeight() * 0.14,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: lightTiffany,
        ),
        child: Row(children: [
          CircleAvatar(
            radius: 28,
            backgroundImage: NetworkImage("${userList['avatar']}"),
          ),
          width12,
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Name: ${userList['name']}",
                      style: const TextStyle(
                          color: white, fontSize: 16, fontWeight: FontWeight.w400),
                    ),
                    width40,
                  ],
                ),
                Text(
                  "Email: ${userList['email']}" , 
                  style: const TextStyle(
                      color: white, fontSize: 16, fontWeight: FontWeight.w400),
                ),
                Text(
                  "Password:  ${userList['password']}",
                  style: const TextStyle(
                      color: white, fontSize: 16, fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
