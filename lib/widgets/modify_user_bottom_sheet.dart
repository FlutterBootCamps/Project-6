import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_week6_day3_lab/bloc/user_bloc.dart';
import 'package:flutter_week6_day3_lab/data_layer/home_data_layer.dart';
import 'package:flutter_week6_day3_lab/helpers/extensions/screen_helper.dart';
import 'package:flutter_week6_day3_lab/models/user_model.dart';
import 'package:flutter_week6_day3_lab/utils/colors.dart';
import 'package:flutter_week6_day3_lab/widgets/bottom_button.dart';
import 'package:flutter_week6_day3_lab/widgets/text_field_iconed.dart';

class ModifyUserBottomSheet extends StatelessWidget {
  const ModifyUserBottomSheet({
    super.key,
    required this.nameController, required this.user,
  });

  final TextEditingController nameController;
  final User user;
  

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.getWidth(context),
      height: context.getHeight(context) * .4,
      padding: const EdgeInsets.all(16),
      decoration: const BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          TextFieldIconed(
            onEditingComplete: (){},
            controller: nameController,
            hintText: "Enter new name",
            label: "Name",
            icon: const Icon(
              Icons.person,
            ),
          ),
          BottomButton(text: "Edit Name", minWidth: 60, onTap: () {
              context.read<UserBloc>().add(UserEditEvent(bearerToken: locator.currentBearerToken, name: nameController.text, id: user.id));
              Navigator.pop(context);
              context.read<UserBloc>().add(ViewProfileEvent(bearerToken: locator.currentBearerToken));
          },)
        ],
      ),
    );
  }
}