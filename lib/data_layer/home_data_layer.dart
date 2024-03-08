import 'package:flutter/material.dart';
import 'package:flutter_week6_day3_lab/models/category_model.dart';
import 'package:flutter_week6_day3_lab/models/product_model.dart';
import 'package:flutter_week6_day3_lab/screens/basket_screen.dart';
import 'package:flutter_week6_day3_lab/screens/home_page.dart';
import 'package:flutter_week6_day3_lab/screens/search_page.dart';
import 'package:flutter_week6_day3_lab/widgets/product_card.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';

class HomeData {
  int currentPageIndex = 1;

  final List<Widget> pageList = [
    const HomePage(),
    const SearchPage(),
    const BasketScreen(),
  ];



  String currentBearerToken = "";
  String currentImagePath = "https://www.nicepng.com/png/full/73-730154_open-default-profile-picture-png.png";
  List<ProductCategory> categoryList = [];
  List<Product> productList = [];

  Future<String> getImage() async{
    final picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null){
      return image.path;
    }else {
      return locator.currentImagePath;
    }
  }

  List<ProductCard> getCategoryProducts(String categoryName){
    final List<Product> generatedProductList = [];
    for (var product in productList){
      if (product.category.name == categoryName){
        generatedProductList.add(product);
      }
    }
    return List.generate(generatedProductList.length, (index) => ProductCard(product: generatedProductList[index], onAddTap: (){},));
  }
}

final locator = GetIt.I.get<HomeData>();