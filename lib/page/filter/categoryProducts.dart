import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_store/helper/extention/screen_helper.dart';
import 'package:my_store/model/productsModel.dart';
import 'package:my_store/page/filter/bloc/filter_bloc.dart';
import 'package:my_store/page/filter/product_detail_screen.dart';
import 'package:my_store/helper/extention/const_color.dart';

class CategorySelectPage extends StatelessWidget {
  const CategorySelectPage({super.key, required this.categoryFilter});
  final CategoryModel categoryFilter;
  @override
  Widget build(BuildContext context) {
    List<Product> listItem = [];

    return BlocBuilder<FilterBloc, FilterState>(
      builder: (context, state) {
        final bloc = context.read<FilterBloc>();
        listItem = bloc.products;
        bloc.filtter=categoryFilter.name!;
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
            itemCount: bloc.products.length,
            itemBuilder: (context, index) {
              print(categoryFilter.name);
              if (categoryFilter.name == listItem[index].category!.name) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ProductDetailScreen(listItem[index])));
                  },
                  child: Card(
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: SizedBox(height: context.getHeight()*0.15,
                          width: context.getWidth()*0.4,
                            child: Image.network(
                              listItem[index]
                                  .images![0]
                                  .replaceAll(RegExp(r'\['), '')
                                  .replaceAll(RegExp(r'\]'), '')
                                  .replaceAll(RegExp(r'\"'), ''),
                              width: 250,
                              height: 200,
                            ),
                          ),
                        ),
                        Text("   Name : ${listItem[index].title}",softWrap: true,overflow:TextOverflow.fade,maxLines: 2,style: TextStyle(fontSize: 12,fontWeight: FontWeight.w700)),
                        Text("   Price : \$ ${listItem[index].price}",softWrap: true,style: TextStyle(fontWeight: FontWeight.w700)),
                      ],
                    ),
                  ),
                );
              }else {
                return Container();
              }
            },
          ),
        );
      },
    );
  }
}
