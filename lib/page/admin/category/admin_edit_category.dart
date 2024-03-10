import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_store/component/field_auth.dart';
import 'package:my_store/component/moon_and_stars.dart';
import 'package:my_store/component/picker_image_widget.dart';
import 'package:my_store/helper/extention/dialog.dart';
import 'package:my_store/model/productsModel.dart';
import 'package:my_store/page/admin/bloc/admin_bloc.dart';

class AdminEditCategory extends StatelessWidget {
  const AdminEditCategory({super.key, required this.category});
  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
      TextEditingController? controllerTitle = TextEditingController(text: category.name);

    return BlocProvider(
      create: (context) => AdminBloc(),
      child: Builder(builder: (context) {
        final bloc = context.read<AdminBloc>();
        return Scaffold(backgroundColor: const Color.fromARGB(255, 8, 48, 107),
          body: Stack(
            children:[Text("edit category"),
               BlocConsumer<AdminBloc, AdminState>(
              listener: (context, state) {
                if (state is LoadingState) {
                  showDialog(
                      barrierDismissible: false,
                      barrierColor: Colors.transparent,
                      context: context,
                      builder: (context) {
                        return const AlertDialog(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          content: SizedBox(
                            height: 150,
                            width: 150,
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                        );
                      });
                }
            
                if (state is SuccessState) {
                  Navigator.pop(context);
                }
                if (state is ErrorState) {
                  Navigator.pop(context);
                  context.getDialog(type: TypeDialog.error);
                }
              },
              builder: (context, state) {
                return ListView(
                  children: [SizedBox(height: 50,),
                    PickerImageWidget(
                      isSelected: bloc.isSelected,
                      urlPath: bloc.urlImage,
                      selectedPath: bloc.pathImage,
                      onTap: () async {
                        bloc.add(ChangeImageEvent());
                      },
                    ),
                    FieldAuth(
                      labelText: "name",
                      controller: controllerTitle,
                    ),
                    Center(
                        child: ElevatedButton(
                            onPressed: () {
                              bloc.controllerTitle!
                                  .text = controllerTitle.text;
                              bloc.add(UpdateCategoryEvent());
                            },
                            child: const Text("update")))
                  ],
                );
              },
            ),
MoonAndStars()
          ]),
        );
      }),
    );
  }
}