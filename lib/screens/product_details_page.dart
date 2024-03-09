import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_week6_day3_lab/bloc/basket_bloc.dart';
import 'package:flutter_week6_day3_lab/helpers/extensions/screen_helper.dart';
import 'package:flutter_week6_day3_lab/models/product_model.dart';
import 'package:flutter_week6_day3_lab/utils/colors.dart';
import 'package:flutter_week6_day3_lab/utils/fonts.dart';

// ignore: must_be_immutable
class ProductDetailsPage extends StatelessWidget {
  const ProductDetailsPage({super.key, required this.product});
  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
        title: const Text(
          "Product Details",
          style: TextStyle(
              color: blackColor,
              fontFamily: workSansFont,
              fontSize: 24,
              fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            CarouselSlider.builder(
                itemCount: product.images.length,
                itemBuilder: (context, index, realIndex) {
                  return Container(
                    width: context.getWidth(context),
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.network(
                        product.images[index]
                            .replaceAll("[", "")
                            .replaceAll("]", "")
                            .replaceAll("\"", ""),
                        fit: BoxFit.cover,
                        loadingBuilder: (context, child, loadingProgress) {
                          if (loadingProgress == null) {
                            return child;
                          } else {
                            return const Center(
                              child: CircularProgressIndicator(
                                color: blackColor,
                              ),
                            );
                          }
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset(
                              "assets/images/no_product_image.png");
                        },
                      ),
                    ),
                  );
                },
                options: CarouselOptions(
                  clipBehavior: Clip.none,
                  enableInfiniteScroll:
                      (product.images.length > 1) ? true : false,
                  enlargeCenterPage: true,
                  enlargeStrategy: CenterPageEnlargeStrategy.height,
                  autoPlay: (product.images.length > 1) ? true : false,
                )),
            const SizedBox(
              height: 16,
            ),
            Text(
              product.title,
              style: const TextStyle(
                  fontFamily: playFairFont,
                  fontSize: 24,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              product.category.name,
              style: const TextStyle(
                  color: greyColor,
                  fontFamily: workSansFont,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              "${product.price}\$",
              style: const TextStyle(
                  fontFamily: workSansFont,
                  fontSize: 22,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              "Description",
              style: TextStyle(
                  color: blackColor,
                  fontFamily: workSansFont,
                  fontSize: 22,
                  fontWeight: FontWeight.w500),
            ),
            const Divider(
              color: blackColor,
              thickness: 2,
              endIndent: 200,
            ),
            Text(
              product.description,
              style: const TextStyle(
                  color: blackColor,
                  fontFamily: workSansFont,
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        alignment: Alignment.center,
        height: 100,
        color: noColor,
        child: MaterialButton(
            minWidth: 250,
            height: 40,
            color: blackColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40)),
            child: const Text(
              "Add to cart",
              style: TextStyle(
                  color: whiteColor,
                  fontFamily: workSansFont,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            onPressed: () {
              context
                  .read<BasketBloc>()
                  .add(AddProductToCartEvent(product: product));
            }),
      ),
    );
  }
}
