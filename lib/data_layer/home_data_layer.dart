import 'package:flutter/material.dart';
import 'package:flutter_week6_day3_lab/models/category_model.dart';
import 'package:flutter_week6_day3_lab/models/product_model.dart';
import 'package:flutter_week6_day3_lab/screens/admin_category_page.dart';
import 'package:flutter_week6_day3_lab/screens/admin_product_page.dart';
import 'package:flutter_week6_day3_lab/screens/admin_users_page.dart';
import 'package:flutter_week6_day3_lab/screens/basket_screen.dart';
import 'package:flutter_week6_day3_lab/screens/home_page.dart';
import 'package:flutter_week6_day3_lab/screens/search_page.dart';
import 'package:flutter_week6_day3_lab/services/product_service.dart';
import 'package:flutter_week6_day3_lab/widgets/product_card.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';

class HomeData {
  int currentAdminPageIndex = 0;
  int currentPageIndex = 2;

  final List<Widget> pageList = [
    const HomePage(),
    SearchPage(),
    const BasketScreen(),
  ];

  final List<Widget> adminPageList = [
    AdminCategoryPage(),
    AdminProductPage(),
    const AdminUserPage()
  ];

  String currentBearerToken = "";
  String currentImagePath =
      "https://www.nicepng.com/png/full/73-730154_open-default-profile-picture-png.png";
  List<ProductCategory> categoryList = [];
  List<Product> productList = [];
  List<Product> cartList = [];
  Future<String> getImage() async {
    final picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      return image.path;
    } else {
      return locator.currentImagePath;
    }
  }

  List<ProductCard> getCategoryProducts(String categoryName) {
    final List<Product> generatedProductList = [];
    for (var product in productList) {
      if (product.category.name == categoryName) {
        generatedProductList.add(product);
      }
    }
    return List.generate(
        generatedProductList.length,
        (index) => ProductCard(
              product: generatedProductList[index],
            ));
  }

  Future<List<ProductCard>> getSearchedProducts(String searchText) async {
    final List<Product> generatedProductList = [];
    if (locator.productList.isEmpty) {
      List<Product> productList = await ProductService().getAllProducts();
      locator.productList = productList;
    }
    for (var product in productList) {
      if (product.title.toLowerCase().contains(searchText.toLowerCase())) {
        generatedProductList.add(product);
      }
    }
    return List.generate(
        generatedProductList.length,
        (index) => ProductCard(
              product: generatedProductList[index],
            ));
  }

  bool addProductToCart(Product product) {
    for (var element in cartList) {
      if(element.title == product.title){
        return false;
      }
    }
    cartList.add(product);
    return true;
  }

  void removeProductFromCart(Product product) {
    cartList.removeWhere((element) => element.title == product.title);
  }

  int calculateCartTotal(){
    int sum = 0;
    for (var element in cartList) {
      sum += element.price;
    }
    return sum;
  }
}

final locator = GetIt.I.get<HomeData>();
