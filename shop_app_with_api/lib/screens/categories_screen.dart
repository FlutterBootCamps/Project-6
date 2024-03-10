import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_with_api/bloc/registration_bloc.dart';
import 'package:shop_app_with_api/constant/color.dart';
import 'package:shop_app_with_api/constant/space.dart';
import 'package:shop_app_with_api/helper/helper_screen.dart';
import 'package:shop_app_with_api/screens/category_search.dart';
import 'package:shop_app_with_api/screens/sign_up_screen.dart';
import 'package:shop_app_with_api/widgets/category_card.dart';
import 'package:shop_app_with_api/widgets/create_new_category_widget.dart';
// 
class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<RegistrationBloc>().add(GetAllCategoriesEvent());

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: AppBar(
          
          actions: [
             InkWell(
              onTap: () {
                context.pushTo(view: const SignUpScreen());
              },
              child: const Padding(
                padding: EdgeInsets.only(right: 24.0, top: 24),
                child: Icon(
                  Icons.person,
                  color: lightTiffany,
                  size: 40,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                context.pushTo(view: CategorySearch());
              },
              child: const Padding(
                padding: EdgeInsets.only(right: 24.0, top: 24),
                child: Icon(
                  Icons.search,
                  color: lightTiffany,
                  size: 40,
                ),
              ),
            ),

          ],
          title: const Padding(
            padding: EdgeInsets.only(left: 10, top : 24),
            child: Text(
              // "All Categories ",
              "Tivola ",
              style: TextStyle(
                  color: tiffany, fontSize: 30, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
      body:  Stack(
        children: [
           Padding(
            padding: const EdgeInsets.all(12.0),
            child: Container(
              decoration: const BoxDecoration(border: Border(bottom: BorderSide(color:tiffany, width: 2))),
              child: const Row(
                children: [
                  Text(
                    "Get",
                    style: TextStyle(
                          color: black, fontSize: 17, fontWeight: FontWeight.w400),
                    ),
                  Text(
                    " 50% ",
                    style: TextStyle(
                          color: tiffany, fontSize:40 , fontWeight: FontWeight.w400),
                    ),
                  Text(
                    "discount on your first order",
                    maxLines: 2,
                    style: TextStyle(
                          color: black, fontSize: 17, fontWeight: FontWeight.w400),
                    ),
                ],
              ),
            ),
          ),
          const Positioned(
            left: 12,
            top: 150,
            child: Text(
              "All Categories",
              style: TextStyle(
                    color: tiffany, fontSize: 25, fontWeight: FontWeight.w700),
              ),
          ),
          
          Column(
            children: [
              height180,
              height32,
              Center(
                child: SizedBox(
                  height: context.getWidth() * 1,
                  width: context.getWidth(),
                  child: BlocBuilder<RegistrationBloc, RegistrationState>(
                    builder: (context, state) {
                      if (state is LoadingState) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (state is GetAllDataState) {
                        return ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: state.allData.length,
                          itemBuilder: (context, index) {
                            print(state.allData.length);
                            print(state.allData[index]);
                            return CategoryCard(category: state.allData[index]);
                          },
                        );
                      }
                      return const Text("no category");
                    },
                  ),
                ),
              ),
            ],
          ),
          const CreateNewCategory(),
        ],
      ),
    );
  }
}
