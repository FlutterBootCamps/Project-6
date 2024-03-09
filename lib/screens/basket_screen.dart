import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_week6_day3_lab/bloc/basket_bloc.dart';
import 'package:flutter_week6_day3_lab/data_layer/home_data_layer.dart';
import 'package:flutter_week6_day3_lab/helpers/extensions/screen_helper.dart';
import 'package:flutter_week6_day3_lab/utils/colors.dart';
import 'package:flutter_week6_day3_lab/utils/fonts.dart';
import 'package:flutter_week6_day3_lab/widgets/product_bar.dart';

class BasketScreen extends StatelessWidget {
  const BasketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Basket",
                style: TextStyle(
                  color: blackColor,
                  fontFamily: playFairFont,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              BlocConsumer<BasketBloc, BasketState>(
                listener: (context, state) {
                  if (state is ModfiedBasketErrorState) {
                    context.showErrorSnackBar(context, state.msg);
                  }
                },
                builder: (context, state) {
                  return (locator.cartList.isNotEmpty)
                      ? SizedBox(
                        height: context.getHeight(context) *.725,
                        child: ListView(
                            children: List.generate(
                                locator.cartList.length,
                                (index) =>
                                    ProductBar(product: locator.cartList[index]))),
                      )
                      : Container(
                          height: context.getHeight(context) * .70,
                          alignment: Alignment.center,
                          child: const Text(
                            "No items in your basket",
                            style: TextStyle(
                                color: greyColor,
                                fontFamily: workSansFont,
                                fontSize: 24),
                          ),
                        );
                },
              ),
            ],
          ),
        ),
        floatingActionButton: BlocBuilder<BasketBloc, BasketState>(
          builder: (context, state) {
            return (locator.cartList.isNotEmpty) ? Container(
              width: 200,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: blackColor, borderRadius: BorderRadius.circular(20)),
              child: Text(
                "Total: ${locator.calculateCartTotal()}\$",
                style: const TextStyle(
                    color: whiteColor,
                    fontFamily: workSansFont,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
            ) : Container();
          },
        ));
  }
}
