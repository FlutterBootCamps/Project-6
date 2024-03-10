import 'package:api_page_lab/constant/colors.dart';
import 'package:api_page_lab/controller/home_controller.dart';
import 'package:api_page_lab/models/categorise_model.dart';
import 'package:api_page_lab/pages/home/bloc/category_bloc.dart';
import 'package:api_page_lab/services/setup.dart';
import 'package:api_page_lab/widgets/black_button_widget.dart';
import 'package:api_page_lab/widgets/category_row_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategorisPage extends StatelessWidget {
   CategorisPage({super.key});

  final homeController = locater.get<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: blackColor,
        onPressed: () {
          showModalBottomSheet(
              context: context,
              builder: (context) {
                final nameController = TextEditingController();
                return Container(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Add Category",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                         TextField(
                          controller: nameController,
                          decoration:
                              InputDecoration(label: Text("Category Name")),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ButtonWidget(
                            text: "Save",
                            onPress: () async {
                              bool isAdded = await homeController.addCategory(nameController.text);
                              if(isAdded){
                                BlocProvider.of<CategoryBloc>(context).add(fetchCategoriesEvent());
                                Navigator.pop(context);
                              }
                            },
                          ),
                        )
                      ]),
                );
              });
        },
        child: Icon(
          Icons.add,
          color: whiteColor,
        ),
      ),
      appBar: AppBar(
        title: const Text(
          "Categories",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body:  SafeArea(
          child: BlocBuilder<CategoryBloc, CategoryState>(
            builder: (context, state) {
              if(state is SuccessState){
                return ListView(
                  children: [
                    for(CategorisModel category in state.categories)
                      CategotyRowWidget(categorisModel: category,)
                  ],
                );
              }else if(state is LoadingState){
                return Center(child: const CircularProgressIndicator());
              }else{
                return const Text("Error");
              }
            }
          )),
    );
  }
}
