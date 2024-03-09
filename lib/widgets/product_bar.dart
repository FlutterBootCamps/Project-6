
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_week6_day3_lab/bloc/basket_bloc.dart';
import 'package:flutter_week6_day3_lab/bloc/product_bloc.dart';
import 'package:flutter_week6_day3_lab/helpers/extensions/screen_helper.dart';
import 'package:flutter_week6_day3_lab/models/product_model.dart';
import 'package:flutter_week6_day3_lab/utils/colors.dart';
import 'package:flutter_week6_day3_lab/utils/fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProductBar extends StatelessWidget {
  const ProductBar({
    super.key, required this.product,
  });
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.getWidth(context),
      height: 100,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 16),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: productBgColor,
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(product.images[0].replaceAll("[", "").replaceAll("]", "").replaceAll("\"", ""),
            width: 80,
            height: context.getHeight(context),
            fit: BoxFit.cover,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null){
                return child;
              }else {
                return const CircularProgressIndicator(color: blackColor,);
              }
            },
            errorBuilder: (context, error, stackTrace) {
              return Image.asset("assets/images/no_product_image.png");
            },
            )),
            const SizedBox(width: 16,),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.title, style: const TextStyle(color: blackColor, fontFamily: playFairFont, fontSize: 18, fontWeight: FontWeight.bold, overflow: TextOverflow.ellipsis), maxLines: 1,),
                  Text("${product.price}\$", style: const TextStyle(color: blackColor, fontFamily: playFairFont, fontSize: 16, fontWeight: FontWeight.w600),)
                ],
              ),
              
            ),
            IconButton(onPressed: (){
              context.read<BasketBloc>().add(RemoveProductFromCartEvent(product: product));
            }, icon: const FaIcon(FontAwesomeIcons.trash, color: redColor,))
        ],
      ),
    );
  }
}
