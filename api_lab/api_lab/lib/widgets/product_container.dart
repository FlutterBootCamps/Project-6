import 'package:api_lab/constant/colors.dart';
import 'package:api_lab/extensions/screen_handler.dart';
import 'package:api_lab/view/home/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductContainer extends StatelessWidget {
  ProductContainer(
      {super.key,
      required this.image,
      required this.price,
      required this.title,
      this.onTap});
  String image;
  String title;
  int price;
  Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(8),
        width: context.getWidth() * 0.40,
        height: context.getHeight() * 0.30,
        decoration: BoxDecoration(
            color: text.withOpacity(0.5),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.network(
              image,
              width: context.getWidth() * 0.50,
              height: 200,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return Image.network(
                  "https://demofree.sirv.com/nope-not-here.jpg",
                  width: context.getWidth() * 0.50,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
                );
              },
            ),
            Divider(),
            Text(
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              title,
              style: TextStyle(
                  color: text, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              maxLines: 1,
              "\$${price}",
              style: TextStyle(color: text, fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
