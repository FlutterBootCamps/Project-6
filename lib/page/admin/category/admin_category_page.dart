import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_store/helper/extention/screen_helper.dart';
import 'package:my_store/model/productsModel.dart';
import 'package:my_store/page/admin/bloc/admin_bloc.dart';
import 'package:my_store/helper/extention/const_color.dart';
import 'package:my_store/page/admin/category/admin_create_category.dart';
import 'package:my_store/page/admin/category/admin_edit_category.dart';

class AdminCategoryPage extends StatelessWidget {
  const AdminCategoryPage({super.key});
  @override
  Widget build(BuildContext context) {
    List<CategoryModel> listLocal = [];

    return BlocProvider(
      create: (context) => AdminBloc()..add(LoadingCategoryEvent()),
      child: BlocBuilder<AdminBloc, AdminState>(
        builder: (context, state) {
          print(state);
          final bloc = context.read<AdminBloc>();
          //bloc..add(LoadingUsersEvent());
          listLocal= bloc.listCategory;
          //bloc.filtter=categoryFilter.name!;
          return Scaffold(
            backgroundColor: bodyColor,
            appBar: AppBar(backgroundColor: bodyColor, actions: [
              IconButton(icon:const Icon( Icons.add,color: Colors.white,fill: 1),onPressed: () {
                context.pushTo(view: const AdminCreateCategory());
              },),
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
                  const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              shrinkWrap: true,
              itemCount: listLocal.length,
              itemBuilder: (context, index) {
                print(listLocal[index].id);
                  return InkWell(
                    onTap: () {context.pushTo(view: AdminEditCategory(category: listLocal[index]));},
                   child:
                     Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: SizedBox(                                      height: context.getHeight()*0.15,
                                        width: context.getWidth()*0.4,
                              child: Image.network(
                                listLocal[index].image!
                                  .replaceAll(RegExp(r'\['), '')
                                  .replaceAll(RegExp(r'\]'), '')
                                  .replaceAll(RegExp(r'\"'), ''),
                                width: 100,
                                height: 100,
                              ),
                            ),
                          ),
                          Text("   title : ${listLocal[index].name}",
                              softWrap: true),
                          Text("   id :  ${listLocal[index].id}",
                              softWrap: true),
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
