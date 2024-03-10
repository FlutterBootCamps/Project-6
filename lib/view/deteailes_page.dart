
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
  class DeteailesPage extends StatelessWidget {
  final String productName;
  final String productDescription;
  final double productPrice;
  final List<String> productImageUrls; 

  DeteailesPage({
    required this.productName,
    required this.productDescription,
    required this.productPrice,
    required this.productImageUrls, 
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[400],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              CarouselSlider(
                items: productImageUrls.map((imageUrl) {
                  return Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    width: double.infinity,
                  );
                }).toList(),
                options: CarouselOptions(
                  height: 200.0,
                  viewportFraction: 1.0,
                  enlargeCenterPage: false,
                  autoPlay: true,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      productName,
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      '\SAR${productPrice.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 18.0,
                        color: Color.fromARGB(255, 24, 71, 26),
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      productDescription,
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      onPressed: () {
                        // Add functionality here to handle button press
                      },
                      child: Text('Add to Cart'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
