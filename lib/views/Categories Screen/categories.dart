import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/model/categories_model.dart';
import 'package:project/views/Categories%20Screen/bloc/categorie_bloc.dart';
import 'package:project/views/Categories%20Screen/bloc/categorie_event.dart';
import 'package:project/views/Categories%20Screen/bloc/categorie_state.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<CategoriesBloc>().add(ShowCategoriesEvent());

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 90,
        title: Padding(
          padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
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
              }
          ),
        ),
      ),
      body: BlocBuilder<CategoriesBloc, CategoriesState>(
        builder: (context, state) {
          if (state is LoadingCategoriesState) {
            return Center(child: const CircularProgressIndicator());
          }
          if (state is SuccessCategoriesState) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                childAspectRatio: 0.7,
              ),
              itemCount: state.categories.length,
              itemBuilder: (context, index) {
                return CategoryItem(catagories: state.categories[index]);
              },
            );
          } else {
            return const Text("Error");
          }
        },
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.catagories});
  final Categories catagories;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        elevation: 2,
        margin: const EdgeInsets.all(8),
        child: ClipRRect(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                colorFilter: ColorFilter.linearToSrgbGamma(),
                image: NetworkImage(catagories.image),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: Text(
                (catagories.name),
                style: const TextStyle(fontSize: 18),
              ),
            ),
          ),
        ),
      ),
    );
  }
}