import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:my_store/model/productsModel.dart';
import 'package:my_store/helper/extention/const_color.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen( this.product, {super.key});
final Product product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: bodyColor,
      appBar: AppBar(backgroundColor: bodyColor,leading: IconButton(onPressed: () {
        Navigator.pop(context);
      },icon: Icon(Icons.arrow_back_ios,fill: 1,color: Colors.white,)), actions: [
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
      body: SingleChildScrollView(child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start,children: [Image.network(product.images![0].replaceAll(RegExp(r'\['), '').replaceAll(RegExp(r'\]'), '').replaceAll(RegExp(r'\"'), '')),
            SizedBox(height: 10,),
            Text("name : ${product.title}",style: TextStyle(color:TextWidgetColor ,fontSize: 20,fontWeight: FontWeight.w700)),
            SizedBox(height: 10,),
            Text("price : \$ ${product.price}",style: TextStyle(color:TextWidgetColor ,fontSize: 20)),
            SizedBox(height: 10,),
            Text("description : ${product.description}",style: TextStyle(color:TextWidgetColor ,fontSize: 20)),
            ],),
      )),);
  }
}