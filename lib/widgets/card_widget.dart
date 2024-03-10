import 'package:api_page_lab/constant/colors.dart';
import 'package:api_page_lab/models/product_model.dart';
import 'package:api_page_lab/widgets/black_button_widget.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  CardWidget({super.key, required this.produtModel});
  ProdutModel produtModel;

  @override
  Widget build(BuildContext context) {
    print(produtModel.images!.first);
    return Container(
      width: MediaQuery.of(context).size.width * 0.40,
      margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
      // padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        // border: Border.all(color: greyColor),
        color: whiteColor,
      ),
      child: Column(children: [
        Image.network(
          produtModel.images!.last,
          errorBuilder: (context, error, stackTrace) {
            return  Image.asset("assets/images/book.jpeg");
          },
        ),
        Text(produtModel.title!, maxLines: 1, overflow: TextOverflow.ellipsis,),
        ButtonWidget(
          text: "Add to Cart",
          onPress: () {},
        )
      ]),
    );
  }
}
