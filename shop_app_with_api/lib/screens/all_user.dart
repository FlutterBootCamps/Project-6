import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_with_api/bloc/registration_bloc.dart';
import 'package:shop_app_with_api/constant/color.dart';
import 'package:shop_app_with_api/helper/helper_screen.dart';
import 'package:shop_app_with_api/screens/user_search.dart';
// import 'package:shop_app_with_api/constant/space.dart';
// import 'package:shop_app_with_api/helper/helper_screen.dart';
import 'package:shop_app_with_api/widgets/user_card.dart';

class AllUsers extends StatelessWidget {
  const AllUsers({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<RegistrationBloc>();
    bloc.add(GetAllUsersEvent());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: lightTiffany,
        // leading: InkWell(
        //   onTap: () {
        //     Navigator.pop(context);
        //   },
        //   child: const Icon(
        //     Icons.arrow_back_ios,
        //     color: white,
        //   ),
        // ),
        actions: [
          InkWell(
          onTap: () {
            context.pushTo(view: UserSearch());
          },
          child: const Padding(
            padding: EdgeInsets.only(right: 24.0),
            child: Icon(
              Icons.search,
              color: white,
            ),
          ),
        ),],
        centerTitle: true ,
        title: const Text(
          "All User Information",
          style: TextStyle(
              color: white, fontSize: 25, fontWeight: FontWeight.w600),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: BlocBuilder<RegistrationBloc, RegistrationState>(
            builder: (context, state) {
              if (state is LoadingState) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is GetAllUsersState) {
                return ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: state.users.length,
                    itemBuilder: (context, index) {
                      return UserCard(userList: state.users[index]);
                    }
                    // ],
                    );
              }
              return const Text("Sory can't access this page");
            },
          ),
        ),
      ),
    );
  }
}
