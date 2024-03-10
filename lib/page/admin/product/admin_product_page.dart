import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_store/helper/extention/screen_helper.dart';
import 'package:my_store/model/productsModel.dart';
import 'package:my_store/page/admin/bloc/admin_bloc.dart';
import 'package:my_store/helper/extention/const_color.dart';
import 'package:my_store/page/admin/product/admin_create_product.dart';
import 'package:my_store/page/admin/product/admin_edit_product.dart';

class AdminProductPage extends StatelessWidget {
  const AdminProductPage({super.key});
  @override
  Widget build(BuildContext context) {
    List<Product> listProductsLocal = [];

    return BlocProvider(
      create: (context) => AdminBloc()..add(LoadingProductsEvent()),
      child: BlocBuilder<AdminBloc, AdminState>(
        builder: (context, state) {
          print(state);
          final bloc = context.read<AdminBloc>();
          //bloc..add(LoadingUsersEvent());
          listProductsLocal= bloc.listProduct;
          //bloc.filtter=categoryFilter.name!;
          return Scaffold(
            backgroundColor: bodyColor,
            appBar: AppBar(backgroundColor: bodyColor, actions: [
                            IconButton(icon:Icon( Icons.add,color: Colors.white,fill: 1),onPressed: () {
                context.pushTo(view: AdminCreateProduct());
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
                  SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              shrinkWrap: true,
              itemCount: listProductsLocal.length,
              itemBuilder: (context, index) {
                print(listProductsLocal[index].title);
                  return InkWell(
                    onTap: () {context.pushTo(view: AdminEditProduct(product: listProductsLocal[index]));},
                   child:
                     Card(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: SizedBox(height: context.getHeight()*0.15,
                            width: context.getWidth()*0.4,
                              child: Image.network(
                                listProductsLocal[index].images![0]
                                  .replaceAll(RegExp(r'\['), '')
                                  .replaceAll(RegExp(r'\]'), '')
                                  .replaceAll(RegExp(r'\"'), ''),
                                width: 100,
                                height: 100,
                              ),
                            ),
                          ),
                        Text("   Name : ${listProductsLocal[index].title}",softWrap: true,overflow:TextOverflow.fade,maxLines: 2,style: TextStyle(fontSize: 12,fontWeight: FontWeight.w700)),
                        Text("   Price : \$ ${listProductsLocal[index].price}",softWrap: true,style: TextStyle(fontWeight: FontWeight.w700)),
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
