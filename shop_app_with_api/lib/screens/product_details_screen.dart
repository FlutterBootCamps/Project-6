import 'package:flutter/material.dart';
import 'package:shop_app_with_api/constant/color.dart';
import 'package:shop_app_with_api/constant/space.dart';
import 'package:shop_app_with_api/helper/helper_screen.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: const Padding(
      //     padding: EdgeInsets.all(16.0),
      //     child: Icon(
      //       Icons.arrow_back_ios,
      //       color: tiffany,
      //       size: 40,
      //     ),
      //   ),
      //   backgroundColor: lightTiffany,
      // ),
     
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: context.getWidth(),
                  height: context.getWidth() * 0.7,
                  decoration: const BoxDecoration(
                    image: DecorationImage(image: AssetImage('asset/Ai.jpg')),
                  ),
                ),
                Positioned(
                  top: 16,
                  left: 12,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: tiffany,
                        size: 40,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Container(
              padding: const EdgeInsets.all(24),
              alignment: Alignment.centerLeft,
              width: context.getWidth(),
              height: context.getHeight() * 0.675,
              decoration: const BoxDecoration(
                color: lightTiffany,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  height24,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.shopping_bag, color: white, size: 30),
                      width12,
                      Icon(Icons.favorite, color: white, size: 30),
                      ],
                  ),
                  Text(
                    " Product Name ",
                    style: TextStyle(
                        color: white,
                        fontSize: 24,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    " \$ 200 ",
                    style: TextStyle(
                        color: tiffany,
                        fontSize: 24,
                        fontWeight: FontWeight.w900),
                  ),
                  height24,
                  Text(
                    " Description: ",
                    style: TextStyle(
                        color: white,
                        fontSize: 24,
                        fontWeight: FontWeight.w700),
                  ),
                  height12,
                  Text(
                    " asdfghjkl;ashjkl;asdghjkasdfghjasdfghjsdfg ",
                    style: TextStyle(
                        color: white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
