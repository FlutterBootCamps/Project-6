import 'package:api_page_lab/constant/colors.dart';
import 'package:api_page_lab/controller/home_controller.dart';
import 'package:api_page_lab/models/categorise_model.dart';
import 'package:api_page_lab/models/product_model.dart';
import 'package:api_page_lab/pages/home/bloc/category_bloc.dart';
import 'package:api_page_lab/pages/home/bloc/drop_down_bloc/bloc/drop_down_bloc.dart';
import 'package:api_page_lab/pages/home/bloc/product_bloc.dart';
import 'package:api_page_lab/services/setup.dart';
import 'package:api_page_lab/widgets/black_button_widget.dart';
import 'package:api_page_lab/widgets/card_widget.dart';
import 'package:api_page_lab/widgets/category_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    BlocProvider.of<CategoryBloc>(context).add(fetchCategoriesEvent());
    BlocProvider.of<ProductBloc>(context).add(fetchProductsEvent());
  }

  final homeController = locater.get<HomeController>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: blackColor,
        onPressed: () {
          showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (context) {
                late CategorisModel? selectedCategory;

                final titleController = TextEditingController();
                final priceController = TextEditingController();
                final descriptionController = TextEditingController();
                return Container(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                      mainAxisSize: MainAxisSize.min,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Add Product",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Container(
                          decoration:
                              BoxDecoration(color: Colors.grey.shade300),
                          width: double.infinity,
                          height: 150,
                          child: Center(
                              child: Image.asset(
                            'assets/images/cam.png',
                            height: 30,
                          )),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                         TextField(
                          controller: titleController,
                          decoration: InputDecoration(label: Text("title")),
                        ),
                         TextField(
                           controller: priceController,
                          decoration: InputDecoration(label: Text("price")),
                        ),
                         TextField(
                           controller: descriptionController,
                          decoration:
                              InputDecoration(label: Text("description")),
                        ),
                        BlocBuilder<CategoryBloc, CategoryState>(
                            builder: (context, state) {
                          if (state is SuccessState) {

                            return BlocBuilder<DropDownBloc, DropDownState>(
                              builder: (context, stateDropDown) {
                                if (stateDropDown is ResultState) {
                                  selectedCategory = stateDropDown.categorisModel;
                                  return DropdownButton<CategorisModel>(
                                    value: stateDropDown.categorisModel,
                                    hint: Text("Category"),
                                    items: state.categories.map((category) {
                                      return DropdownMenuItem<CategorisModel>(
                                        value: category,
                                        child: Text(category.name!),
                                      );
                                    }).toList(),
                                    onChanged: (CategorisModel? value) {
                                      BlocProvider.of<DropDownBloc>(context)
                                          .add(ChangeResutlEvent(
                                              categorisModel: value!));
                                      selectedCategory = value;
                                    },
                                  );
                                } else {
                                  return const Text("error");
                                }
                              },
                            );
                          } else {
                            return const SizedBox();
                          }
                        }),
                        const SizedBox(
                          height: 10,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: ButtonWidget(
                            text: "Save",
                            onPress: () async {
                              final productModel = ProdutModel(
                                  title: titleController.text,
                                  price: int.parse(priceController.text),
                                  description: descriptionController.text,
                                  category: selectedCategory,
                                  images: [
                                    "https://t4.ftcdn.net/jpg/03/83/25/83/360_F_383258331_D8imaEMl8Q3lf7EKU2Pi78Cn0R7KkW9o.jpg"
                                  ]);
                              bool isAdded = await homeController.addProduct(productModel);
                              if(isAdded){
                               BlocProvider.of<ProductBloc>(context).add(fetchProductsEvent());
                               Navigator.pop(context);

                              }
                            },
                          ),
                        )
                      ]),
                );
              });
        },
        child: Icon(
          Icons.add,
          color: whiteColor,
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    fillColor: Colors.grey[200],
                    filled: true,
                    hintText: "Search",
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(20),
                    )),
              ),
            ),
            SizedBox(
              height: 40,
              child: BlocBuilder<CategoryBloc, CategoryState>(
                builder: (context, state) {
                  if (state is SuccessState) {
                    return ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        for (CategorisModel categorisModel in state.categories)
                          CategoryWidget(
                            categorisModel: categorisModel,
                          )
                      ],
                    );
                  } else if (state is LoadingState) {
                    return const CircularProgressIndicator();
                  } else {
                    return const Text("error");
                  }
                },
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/images/offer.jpeg',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Column(
                    children: [
                      Text(
                        "Get 15% off your first order!",
                        style: TextStyle(
                            color: whiteColor,
                            fontWeight: FontWeight.w900,
                            fontSize: 20),
                      ),
                      Text(
                        "Use code: MRM",
                        style: TextStyle(
                            color: whiteColor, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: BlocBuilder<ProductBloc, ProductState>(
                builder: (context, state) {
                  if (state is ProductSuccessState) {
                    return Wrap(
                      children: [
                        for (ProdutModel produtModel in state.productsList)
                          CardWidget(
                            produtModel: produtModel,
                          )
                      ],
                    );
                  } else if (state is ProductLoadingState) {
                    return const CircularProgressIndicator();
                  } else {
                    return const Text("Error");
                  }
                },
              ),
            )
          ],
        ),
      )),
    );
  }
}

//register page : 1-isAvailable 2-user->create

// login page : 3-login 4-user->getOne

//home page : 5-categorise->getAll 6-product->getAll 7-product->getOne 8-product->create 9-product->ubdate

//categoris page : 10-categoris->getOne 11-categoris->update 12-categoris->create

//profile page : 13-profile 14-user->ubdate
