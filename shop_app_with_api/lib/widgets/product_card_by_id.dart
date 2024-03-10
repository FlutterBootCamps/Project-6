import 'package:flutter/material.dart';
import 'package:shop_app_with_api/constant/color.dart';
import 'package:shop_app_with_api/helper/helper_screen.dart';
import 'package:shop_app_with_api/models/product_model.dart';

class ProductCardById extends StatelessWidget {
  const ProductCardById({super.key, required this.product});
  final Map product;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          color: Colors.greenAccent,
          child: SizedBox(
            height: context.getWidth() * 0.28,
            width: context.getWidth() * 0.95,
            child: Stack(
              children: [
                Positioned(
                  right: 5,
                  top: 20,
                  child: Container(
                    padding: const EdgeInsets.only(left: 40, top:8),
                    height: context.getWidth() * 0.21,
                    width: context.getWidth() * 0.55, 
                    decoration: BoxDecoration(
                      borderRadius:  BorderRadius.circular(12),
                      color: tiffany,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(product['title'], style: const TextStyle(color: white, fontSize: 13 ),),
                        Text("\$ ${product['price'].toString()}",  style: const TextStyle(color: white, fontSize: 16, fontWeight: FontWeight.w600 ),),                        
                      ],
                    ),
                  ),
                ),
                Positioned(
                  right: 145,
                  child:
                   Container(
                    decoration: BoxDecoration(
          image:  const DecorationImage(
            opacity: 0.8,
            image: AssetImage("asset/AI.jpg"),
              // image: NetworkImage("${product['images'][0]}"),
              fit: BoxFit.cover),
          color: Colors.green,
          borderRadius: BorderRadius.circular(5),
        ),),
                  
                ),
              ],
            ),
          ),
        ),
    )

    ;
  }
}