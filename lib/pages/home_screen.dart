import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import '../bloc/store_bloc.dart'; // Import the StoreBloc
import '../widget/products_widget.dart'; // Import the ProductsWidget
import 'package:asignmet4/helper/colors.dart'; // Import the color constants

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key});

  TextEditingController titleController = TextEditingController(); // Controller for product title
  TextEditingController priceController = TextEditingController(); // Controller for product price
  TextEditingController categoryController = TextEditingController(); // Controller for product category
  TextEditingController imageController = TextEditingController(); // Controller for product image URL

  @override
  Widget build(BuildContext context) {
    context.read<StoreBloc>().add(ShowProductEvent()); // Trigger the event to fetch products

    return Scaffold(
      backgroundColor: Colors.transparent,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: Colors.white),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 400,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("image/products.png"), // Background image for the header
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomRight,
                              colors: [
                                Colors.black.withOpacity(.9),
                                Colors.black.withOpacity(.4),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Positioned(
                        bottom: 15,
                        left: 10,
                        right: 0,
                        child: Text(
                          "Our New Products", // Header text
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 30),
                        ),
                      ),
                    ],
                  ),
                  BlocBuilder<StoreBloc, StoreState>(
                    builder: (context, state) {
                      if (state is LoadingState) {
                        return const Center(
                          child: CircularProgressIndicator(
                            color: Colors.orangeAccent,
                          ),
                        );
                      } else if (state is SuccessStateProduct) {
                        // If products are successfully loaded, display them using GridView
                        return GridView.builder(
                          shrinkWrap: true,
                          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 0.7,
                          ),
                          itemCount: state.product.length,
                          itemBuilder: (context, index) {
                            return ProductsWidget(
                              productData: state.product[index],
                            );
                          },
                        );
                      } else {
                        // Handle different error scenarios
                        return const Center(child: Text("Error"));
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Show a bottom sheet to add a new product
          showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Container(
                height: 400,
                color: Colors.white,
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      // Text fields for entering product details
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          child: TextField(
                            controller: titleController,
                            decoration: const InputDecoration(
                              labelText: 'Name',
                              fillColor: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          child: TextField(
                            controller: priceController,
                            decoration: const InputDecoration(
                              labelText: 'Price',
                              fillColor: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          child: TextField(
                            controller: categoryController,
                            decoration: const InputDecoration(
                              labelText: 'Id',
                              fillColor: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          child: TextField(
                            controller: imageController,
                            decoration: const InputDecoration(
                              labelText: 'ImageUrl',
                              fillColor: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      // Button to create a new product
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: lightWhite,
                          backgroundColor: sky4,
                        ),
                        child: const Text('Create'),
                        onPressed: () {
                          Navigator.pop(context); // Close the bottom sheet
                        },
                      )
                    ],
                  ),
                ),
              );
            },
          );
        },
        backgroundColor: white,
        child: const Icon(
          Icons.add,
          color: dark,
        ),
      ),
    );
  }
}
