import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:my_store/helper/getImage.dart';
import 'package:my_store/model/productsModel.dart';
import 'package:my_store/model/user_model.dart';
import 'package:my_store/service/networking_catagory.dart';
import 'package:my_store/service/networking_products.dart';
import 'package:my_store/service/networking_upload.dart';
import 'package:my_store/service/networking_user.dart';

part 'admin_event.dart';
part 'admin_state.dart';

class AdminBloc extends Bloc<AdminEvent, AdminState> {
  NetworkingCategories networkingCategories=NetworkingCategories();
    NetworkingProducts networkingProducts=NetworkingProducts();

    List <User> listUser=[];
    List <Product> listProduct=[];
    List <CategoryModel> listCategory=[];


  bool isSelected = false;
  String? urlImage;
  String? pathImage;

    List<String>? urlMultiImage;
   List<String>? pathMultiImage;
  TextEditingController? controllerName = TextEditingController();

  TextEditingController? controllerTitle = TextEditingController();
    TextEditingController? controllerItemCategory = TextEditingController();
  TextEditingController? controllerProductPrice = TextEditingController();
  TextEditingController? controllerProductDescription = TextEditingController();

  AdminBloc() : super(AdminInitial()) {
on<ChangeImageEvent>((event, emit) async {
      try {
        final path = await getImage();
        pathImage = path;
        isSelected = true;
        emit(UpdateImageState());
      } catch (error) {
        isSelected = false;
        pathImage = null;
        emit(UpdateImageState());
      }
    });

    on<LoadingUsersEvent>((event, emit) async{
      emit(LoadingState());
      NetworkingUser network= NetworkingUser();
      List<User> Raw = await network.getAlltUser();
      print(Raw.length);
      //if(products.isEmpty)
        for (User productDetails in Raw) {
          print(productDetails.name);
        listUser.add(productDetails);
        
      }

       emit(LoadingState());
       
    },);

    on<CreateCategoryEvent>((event, emit) async {
      try {
        emit(LoadingState());

        final netWorkeing = NetWorkingUpload();
        final urlImageServer =
            await netWorkeing.uploadImageMethod(path: pathImage!);
        CategoryModel category = CategoryModel(
            name: controllerName?.text,
            image: urlImageServer.location);
        await networkingCategories.createCategory(category:category);
        emit(SuccessState());
      } catch (error) {
        print(error);
        emit(ErrorState());
      }
    });

    on<CreateProductEvent>((event, emit) async {
      try {
        emit(LoadingState());

        final netWorkeing = NetWorkingUpload();
        final urlImageServer =
            await netWorkeing.uploadMultiImageMethod(paths:pathMultiImage! );
            final itemCategory = await networkingCategories.getOneCategory(id: int.parse(controllerItemCategory!.text));
        Product product = Product(
            title: controllerName?.text,
            images: urlImageServer,
            category:itemCategory,price:  int.parse(controllerProductPrice!.text),description:controllerProductDescription?.text );
        await networkingProducts.createProduct(product:product);
        emit(SuccessState());
      } catch (error) {
        print(error);
        emit(ErrorState());
      }
    });
    on<LoadingProductsEvent>((event, emit) async{
      emit(LoadingState());
      NetworkingProducts network= NetworkingProducts();
      List<Product> productsRaw = await network.getAllProducts();
      //if(products.isEmpty)
        for (Product productDetails in productsRaw) {
        listProduct.add(productDetails);
        
      }

       emit(LoadingState());
       
    },);
on<LoadingCategoryEvent>((event, emit) async{
      emit(LoadingState());
      NetworkingCategories network= NetworkingCategories();
      List<CategoryModel> Raw = await network.getAllCategories();
      //if(products.isEmpty)
        for (CategoryModel productDetails in Raw) {
        listCategory.add(productDetails);
        
      }

       emit(LoadingState());
       
    },);

    on<UpdateProductEvent>((event, emit) async {
      try {
        emit(LoadingState());

        final netWorkeing = NetWorkingUpload();
        final urlImageServer =
            await netWorkeing.uploadMultiImageMethod(paths:pathMultiImage!);
            final itemCategory = await networkingCategories.getOneCategory(id: int.parse(controllerItemCategory!.text));
            Product product = Product(
            title: controllerName!.text,
            images: urlImageServer,
            category:itemCategory,
            price:  int.parse(controllerProductPrice!.text),
            description:controllerProductDescription!.text );
        await networkingProducts.updateProduct(product:product);
        emit(SuccessState());
      } catch (error) {
        print(error);
        emit(ErrorState());
      }
    });

    on<UpdateCategoryEvent>((event, emit) async {
      try {
        emit(LoadingState());

        final netWorkeing = NetWorkingUpload();
        final urlImageServer =
            await netWorkeing.uploadImageMethod(path:pathImage!);
            CategoryModel category = CategoryModel(
            name: controllerName!.text,
            image: urlImageServer.location, );
        await networkingCategories.updateOneCategory(category:  category);
        emit(SuccessState());
      } catch (error) {
        print(error);
        emit(ErrorState());
      }
    });
  }
}

