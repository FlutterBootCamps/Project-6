import 'package:asignmet4/helper/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/store_bloc.dart';
import '../widget/card_widget.dart';

class ExploreScreen extends StatelessWidget {
  ExploreScreen({super.key});
  
  // Text editing controllers for the input fields in the bottom sheet
  TextEditingController nameController = TextEditingController();
  TextEditingController categoryController = TextEditingController();
  TextEditingController imageController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    // Dispatching an event to load category data when the screen is built
    context.read<StoreBloc>().add(ShowCategoryEvent());
    
    return Scaffold(
      backgroundColor: dark,
      appBar: AppBar(
        backgroundColor: white,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(6.0),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: TextFormField(
              decoration: const InputDecoration(
                hintText: 'What are you looking for?',
                hintStyle: TextStyle(color: Colors.grey, fontSize: 17),
                prefixIcon: Icon(Icons.search, color: Colors.grey),
                contentPadding: EdgeInsets.symmetric(vertical: 8.0),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
                filled: true,
                fillColor: white,
              ),
            ),
          ),
        ),
      ),
      body: BlocBuilder<StoreBloc, StoreState>(
        builder: (context, state) {
          if (state is LoadingState) {
            // Show loading indicator while fetching category data
            return const Center(
              child: CircularProgressIndicator(color: Colors.orangeAccent,),
            );
          } else if (state is SuccessStateCategories) {
            // Display the list of categories when data is successfully loaded
            return ListView.builder(
              itemCount: state.category.length,
              itemBuilder:(context, index) {
                return CardWidget(
                  cat: state.category[index],
                );
              }
            );
          } else {
            // Display a message when no data is available
            return const Center(child: Text("No Data"));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Open bottom sheet to add new category
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
                      // Text field for category name
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          child: TextField(
                            controller: nameController,
                            decoration: const InputDecoration(
                              labelText: 'Name',
                              fillColor: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      // Text field for category ID
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
                      // Text field for category image URL
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
                      // Button to create the category
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          foregroundColor: lightWhite,
                          backgroundColor: sky4,
                        ),
                        child: const Text('Create'),
                        onPressed: () {
                          Navigator.pop(context); // Close bottom sheet
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
