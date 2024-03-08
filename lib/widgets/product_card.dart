import 'package:flutter/material.dart';
import 'package:flutter_week6_day3_lab/helpers/extensions/screen_helper.dart';
import 'package:flutter_week6_day3_lab/models/product_model.dart';
import 'package:flutter_week6_day3_lab/utils/colors.dart';
import 'package:flutter_week6_day3_lab/utils/fonts.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key, required this.product, this.onProductTap, this.onAddTap,
  });
  final Product product;
  final Function()? onProductTap;
  final Function()? onAddTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onProductTap,
      child: Container(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 16, bottom: 8),
        width: 170,
        height: 220,
        decoration: const BoxDecoration(color: productBgColor, borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(product.images[0].replaceAll("[", "").replaceAll("]", "").replaceAll("\"", ""),
              fit: BoxFit.cover,
              width: context.getWidth(context),
              height: 100,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null){
                  return child;
                }else {
                  return const Center(child: CircularProgressIndicator(color: blackColor,),);
                }
              },
              errorBuilder: (context, error, stackTrace) {
                return Image.asset("assets/images/no_product_image.png", height: 100, width: context.getWidth(context), fit: BoxFit.cover,);
              },),
              
            ),
            Text(product.title, style: const TextStyle(color: blackColor, fontFamily: playFairFont, fontSize: 18, fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis,), maxLines: 1,),
            const SizedBox(height: 16,),
            Row(
              children: [
                Expanded(child: Text("${product.price}\$", style: const TextStyle(color: blackColor, fontFamily: playFairFont, fontSize: 18, fontWeight: FontWeight.bold, ), maxLines: 1,)),
                MaterialButton(onPressed: onAddTap, color: blackColor, minWidth: 40,padding: EdgeInsets.zero, height: 20, child: const Text("Add", style: TextStyle(color: whiteColor, fontFamily: workSansFont, fontSize: 14, fontWeight: FontWeight.bold),),)
              ],
            )
          ],
        ),
      ),
    );
  }
}