import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_store/helper/extention/screen_helper.dart';
import 'package:my_store/model/user_model.dart';
import 'package:my_store/page/admin/bloc/admin_bloc.dart';
import 'package:my_store/helper/extention/const_color.dart';

class AdminUsersPage extends StatelessWidget {
  const AdminUsersPage({super.key});
  @override
  Widget build(BuildContext context) {
    List<User> listUserLocal = [];

    return BlocProvider(
      create: (context) => AdminBloc()..add(LoadingUsersEvent()),
      child: BlocBuilder<AdminBloc, AdminState>(
        builder: (context, state) {
          print(state);
          final bloc = context.read<AdminBloc>();
          //bloc..add(LoadingUsersEvent());
          listUserLocal= bloc.listUser;
          //bloc.filtter=categoryFilter.name!;
          return Scaffold(
            backgroundColor: bodyColor,
            appBar: AppBar(backgroundColor: bodyColor, actions: [
              Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                        color: Colors.yellow.shade100,
                        blurRadius: 1000000,
                        spreadRadius: 20,
                        blurStyle: BlurStyle.normal)
                  ]),
                  child: SvgPicture.asset(
                    "assets/image/crescent-moon-svgrepo-com.svg",
                    color: Colors.yellow.shade400,
                    width: 70,
                    height: 70,
                  )),
            ]),
            body: GridView.builder(
              gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              shrinkWrap: true,
              itemCount: listUserLocal.length,
              itemBuilder: (context, index) {
                print(listUserLocal[index].name);
                  return InkWell(
                    onTap: () {},
                   child:
                     Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: SizedBox(
                                        height: context.getHeight()*0.16,
                                        width: context.getWidth()*0.4,
                              child: Image.network(
                                listUserLocal[index].avatar!,
                              ),
                            ),
                          ),
                          Text("   name : ${listUserLocal[index].name}",style: TextStyle(fontSize: 11,fontWeight: FontWeight.w700),
                              softWrap: true,maxLines: 2,overflow:TextOverflow.fade ),
                          Text("   role :  ${listUserLocal[index].role}",
                              softWrap: true,style: TextStyle(fontSize: 11,fontWeight: FontWeight.w700)),
                        ],
                      ),
                    )
                  );
              },
            ),
        );
              },
            ),
          );
        }
        }
