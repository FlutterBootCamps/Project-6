import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_week6_day3_lab/bloc/admin_view_bloc.dart';
import 'package:flutter_week6_day3_lab/helpers/extensions/screen_helper.dart';
import 'package:flutter_week6_day3_lab/utils/colors.dart';
import 'package:flutter_week6_day3_lab/utils/fonts.dart';
import 'package:flutter_week6_day3_lab/widgets/text_field_iconed.dart';
import 'package:flutter_week6_day3_lab/widgets/user_card.dart';

// ignore: must_be_immutable
class AdminUserPage extends StatelessWidget {
  AdminUserPage({super.key});
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    context.read<AdminViewBloc>().add(ShowAllUsersEvent());
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(
                height: 16,
              ),
              TextFieldIconed(
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                controller: searchController,
                hintText: "Search users by ID",
                label: "Search",
                icon: const Icon(Icons.search),
                onEditingComplete: () {
                  if (searchController.text.trim().isNotEmpty) {
                    context.read<AdminViewBloc>().add(ShowOneUserEvent(
                        id: int.parse(searchController.text.trim())));
                  } else {
                    context.read<AdminViewBloc>().add(ShowAllUsersEvent());
                  }
                },
              ),
              const SizedBox(
                height: 16,
              ),
              BlocConsumer<AdminViewBloc, AdminViewState>(
                listener: (context, state) {
                  if (state is ErrorState) {
                    context.showErrorSnackBar(context, state.msg);
                  }else if (state is AddedEditiedCategoryState){
                    context.showSuccessSnackBar(context, state.msg);
                  }
                },
                builder: (context, state) {
                  if (state is LoadingState) {
                    return const Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 240,
                        ),
                        CircularProgressIndicator(
                          color: blackColor,
                        ),
                      ],
                    );
                  } else if (state is ShowingUsersState) {
                    return SizedBox(
                      width: context.getWidth(context),
                      height: context.getHeight(context) * .69,
                      child: ListView(
                        children:
                            List.generate(state.userList.length, (index) {
                          return UserCard(user: state.userList[index]);
                        }),
                      ),
                    );
                  } else if (state is ShowingOneUserState) {
                    return SizedBox(
                      width: context.getWidth(context),
                      height: context.getHeight(context) * .69,
                      child: ListView(
                        children: [
                          UserCard(user: state.user),
                        ],
                      ),
                    );
                  } else {
                    return const Column(
                      children: [
                        SizedBox(
                          height: 240,
                        ),
                        Text(
                          "No Users Found",
                          style: TextStyle(
                              color: greyColor,
                              fontFamily: workSansFont,
                              fontSize: 24),
                        ),
                      ],
                    );
                  }
                },
              ),
            ],
          ),
        ),
        );
  }
}

