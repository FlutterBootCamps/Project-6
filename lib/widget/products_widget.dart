import 'package:asignmet4/helper/colors.dart';
import 'package:flutter/material.dart';
import '../models/products.dart';

class ProductsWidget extends StatefulWidget {
  const ProductsWidget({Key? key, this.productData}) : super(key: key);
  final ProductModel? productData;

  @override
  _ProductsWidgetState createState() => _ProductsWidgetState();
}

class _ProductsWidgetState extends State<ProductsWidget> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InkWell(
            onTap: () {
              setState(() {
                isFavorite = !isFavorite;
              });
            },
            child: Stack(
              children: [
                Container(
                  height: 200,
                  width: 200,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage(
                        
                        widget.productData!.images![0].replaceAll('""', '').replaceAll('[', '').replaceAll(']', ''),
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(.6),
                          Colors.black.withOpacity(.4),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                    icon: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      color: isFavorite ? Colors.red : Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text(
            widget.productData?.title ?? "",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12, color: white),
          ),
          Text(
            "SAR ${widget.productData!.price.toString()}",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13, color: white),
          ),
        ],
      ),
    );
  }
}
