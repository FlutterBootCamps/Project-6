import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_with_api/bloc/registration_bloc.dart';
import 'package:shop_app_with_api/constant/color.dart';
import 'package:shop_app_with_api/constant/space.dart';
import 'package:shop_app_with_api/helper/helper_screen.dart';
import 'package:shop_app_with_api/widgets/product_card.dart';

class ProductSearch extends StatelessWidget {
  ProductSearch({super.key});

   TextEditingController idController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: lightTiffany,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back_ios,
            color: white,
          ),
        ),
          actions: [
          InkWell(
          onTap: () {
            context.pushTo(view: ProductSearch());
          },
          child: const Padding(
            padding: EdgeInsets.only(right: 24.0),
            child: Icon(
              Icons.search,
              color: white,
            ),
          ),
        ),],
        title: const Text(
          "Search for product ",
          style: TextStyle(
              color: white, fontSize: 25, fontWeight: FontWeight.w600),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(children: [
            height32,
            SizedBox(
              width: context.getWidth() * 0.75,
              height: context.getWidth() * 0.095,
              child: TextField(
                controller: idController,
                decoration: const InputDecoration(
                  fillColor: white,
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(12) ),borderSide: BorderSide(color: tiffany)),
                  hintText: "Search for Products by ID",
                  hintStyle: TextStyle(
                    color: grey,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            InkWell(
              onTap: () async {
                print("object");
                if (idController.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Please enter a Products ID')));
                } else {
                  context
                      .read<RegistrationBloc>()
                      .add(GetOneProductsEvent(id: int.parse(idController.text)));

                }
              },
              child: Container(
                margin: const EdgeInsets.all(12),
                width: context.getWidth() * 0.75,
                height: context.getWidth() * 0.1,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: tiffany,
                  borderRadius: BorderRadius.circular(12,),
                  
                ),
                child: const Text(
                  "Search for Product",
                  style: TextStyle(
                      fontWeight: FontWeight.w600, color: white, fontSize: 22),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: BlocBuilder<RegistrationBloc, RegistrationState>(
                  builder: (context, state) {
                    if (state is LoadingState) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state is GetOneUsersState) {
                      return ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: 1,  // state.users.length,
                          itemBuilder: (context, index) {
                            print(state.users[index]);
                            print("state.users[index]");
                            print(state.users["id"] != null);
                            if (state.users["id"] != null) {
                              return ProductCard(product: state.users);
                            }
                            return null;
                          });
                    }
                    return const Text("Sory can't found  Products", style: TextStyle(color: grey));
                  },
                ),
              ),
            ),
          ]),
        ),
      ),
    );

  }
}