import 'package:api_page_lab/controller/auth_controller.dart';
import 'package:api_page_lab/models/categorise_model.dart';
import 'package:api_page_lab/models/product_model.dart';
import 'package:api_page_lab/services/category_api.dart';
import 'package:api_page_lab/services/products_api.dart';
import 'package:api_page_lab/services/setup.dart';
import 'package:api_page_lab/utils/snack_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeController {
  Future<List<CategorisModel>?> fetchCategories() async {
    String? token = locater.get<AuthController>().token;
    List<CategorisModel>? categoriesList =
        await CategoryAPI.categoryAPI(token!);
    if (categoriesList == null) {
      return null;
    } else {
      return categoriesList;
    }
  }

  Future<List<ProdutModel>?> fetchProducts() async {
    String? token = locater.get<AuthController>().token;
    List<ProdutModel>? productList = await ProductAPI.productsAPI(token!);
    if (productList == null) {
      return null;
    } else {
      return productList;
    }
  }

  Future<bool> addProduct(ProdutModel produtModel) async {
    String? token = locater.get<AuthController>().token;

    bool isAdded = await ProductAPI.addProductsAPI(produtModel, token!);

    if(isAdded){
      return true;
    }else{
      SnackBarToast("There are an Error");
      return false;
    }

  }

  Future<bool> addCategory(String name) async {
    String? token = locater.get<AuthController>().token;

    bool isAdded = await CategoryAPI.addCategoryAPI(name, token!);

    if(isAdded){
      return true;
    }else{
      SnackBarToast("There are an Error");
      return false;
    }

  }

}
