import 'package:flutter/material.dart';

import '../models/products.dart';

class CardWidget extends StatelessWidget {
  const CardWidget({super.key, this.cat});
final CategoryModel? cat;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.all(12.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Stack(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              image:  DecorationImage(
                image: NetworkImage(
                  cat!.image!,
                ),
                fit: BoxFit.cover,
              ),
            ),
            
          ),
          Positioned(
          
            child: Container(
              width: 390,
              padding: const EdgeInsets.all(4.0),
              decoration: const BoxDecoration(
                boxShadow: [
               
                ],
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                ),
                color:  Color.fromARGB(78, 0, 0, 0),
              ),
              child:  Text(
                cat!.name!,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}