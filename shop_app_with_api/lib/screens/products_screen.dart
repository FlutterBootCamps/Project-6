import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app_with_api/bloc/registration_bloc.dart';
import 'package:shop_app_with_api/constant/color.dart';
import 'package:shop_app_with_api/helper/helper_screen.dart';
import 'package:shop_app_with_api/screens/product_search.dart';
import 'package:shop_app_with_api/widgets/create_new_product_widge.dart';
import 'package:shop_app_with_api/widgets/product_card.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final bloc = context.read<RegistrationBloc>();
    // bloc.add(GetAllUsersEvent());
    context.read<RegistrationBloc>().add(GetAllProductsEvent());
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
            context.pushTo(view:  ProductSearch());
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
          "All Products ",
          style: TextStyle(
              color: white, fontSize: 25, fontWeight: FontWeight.w600),
        ),
      ),
    
      body: SafeArea(child: Center(
        child: 
        // BlocBuilder<RegistrationBloc, RegistrationState>().add()
        // BlocBuilder<RegistrationBloc,RegistrationState>(builder: context){
        Stack(
          children: [
            BlocBuilder<RegistrationBloc, RegistrationState>(
              builder: (context, state) {
                if (state is LoadingState) {
                  return const Center(child: CircularProgressIndicator(),);
                }
                // errorBuilder: (context, error, srackTrace){
                if (state is GetAllDataState) {
                  return ListView.builder(
                    shrinkWrap: true,
                      itemCount: state.allData.length,
                      itemBuilder: (context, index) {
                        print("${state.allData[index]['images'][0]}");
                        print("------------p------------p---------");
                        if(state.allData[index].isNotEmpty){
                        return ProductCard(product: state.allData[index]);
                        }
                        return const Text('empty');
                      });
                }
                return const Text("hi");
              },
            ),
            const CreateNewProduct(),
          ],
        ),
      )),
    );
  }
}
