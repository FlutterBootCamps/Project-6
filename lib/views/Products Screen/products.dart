import 'package:flutter/material.dart';
import 'package:project/core/utils/constant_color.dart';
import 'package:project/model/products.model.dart';
import 'package:project/views/Products%20Screen/bloc/product_bloc.dart';
import 'package:project/views/Products%20Screen/bloc/product_event.dart';
import 'package:project/views/Products%20Screen/bloc/product_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class DisplayProductsScreen extends StatelessWidget {
 

  DisplayProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ProductBloc>().add(ShowEvent());
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        title: Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: TextField(
            decoration: InputDecoration(
              hintText: 'Search...',
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            onChanged: (value) {
              // Handle search text changes
            },
          ),
        ),
      ),
      body: BlocBuilder<ProductBloc, ProductState>(
        builder: (context, state) {
          if(state is LoadingState){
            return Center(child: const CircularProgressIndicator());
          }if(state is SuccessState){
            return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 0.7,
            ),
            itemCount: state.product.length,
            itemBuilder: (context, index) {
              return CustomProductCard(products:state.product[index]);
            },
          );
          } else{
            return const Text("Error");
          }
          
        },
      ),
    );
  }
}

class CustomProductCard extends StatelessWidget {
  const CustomProductCard({
    super.key,
    required this.products,
  });

  final Products products;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          gradient: LinearGradient(
            colors: [grey, w, grey],
            begin: Alignment.centerLeft,
            end: Alignment.bottomRight,
          )),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              decoration:  BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8)),
                image: DecorationImage(
                  image: NetworkImage(products.images[0].replaceAll('"', '').replaceAll('[', '').replaceAll(']', ''),
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  products.title,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  '\$${products.price.toStringAsFixed(2)}',
                  style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                    color: green,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
