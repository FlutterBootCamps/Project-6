import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:shop_app_with_api/helper/get_image.dart';
// import 'package:shop_app_with_api/helper/helper_screen.dart';
import 'package:shop_app_with_api/models/category_model.dart';
import 'package:shop_app_with_api/models/user_model.dart';
// import 'package:shop_app_with_api/models/user_model.dart';
import 'package:shop_app_with_api/services/registeration.dart';

part 'registration_event.dart';
part 'registration_state.dart';

class RegistrationBloc extends Bloc<RegistrationEvent, RegistrationState> {
  bool? isSelected = false;
  String? urlImage;
  String? pathImage;
  Map? user;
  TextEditingController? nameController = TextEditingController();
  TextEditingController? emailController = TextEditingController();
  TextEditingController? passwordController = TextEditingController();
  TextEditingController? idController = TextEditingController();
  

  RegistrationBloc() : super(RegistrationInitial()) {
  

    on<ChangeImageEvent>(
      (event, emit) async {
        try {
          print("dd");
          final path = await getImage();
          print(path);
          pathImage = path;
          isSelected = true;
          emit(UpdateImageState());
        } catch (error) {
          isSelected = false;
          pathImage = null;
          emit(UpdateImageState());
        }
      },
    );

    on<CreateNewAccountEvent>((event, emit) async {
      try {
        emit(LoadingState());

        final netWorkeing = LoginApi();
        // final urlImageServer =
        //     await netWorkeing.uploadImageMethod(path: pathImage!);
        // print(urlImageServer.location);
        // UserModel user = UserModel(
          await netWorkeing.signUpMethod(
            name: nameController!.text,
            email: emailController!.text,
            password: passwordController!.text,
            );
            // avatar:
            // urlImageServer.location,
            // );
        emit(SuccessState());
      } catch (error) {
        print(error);
        emit(ErrorState());
      }
    });

    on<LogInEvent>(
      (event, emit) async {
        try {
          emit(LoadingState());
          final service = LoginApi();
          await service.logInMethod(email: event.email, password: event.password);
           

          emit(LogInSuccessState());
        } catch (error) {
          emit(ErrorState());
        }
      },
    );

    on<GetAllUsersEvent>(
      (event, emit) async {
        print("GetAllUsers");
        emit(LoadingState());

        print("GetAllUsers1");
          final List users = await  LoginApi().getAllUsers();
        print("GetAllUsers2");
          if (users.isNotEmpty) {
            emit(GetAllUsersState(users: users));
          } else {
            emit(ErrorState());
          }
          
      },
    );
  
    on<GetAllCategoriesEvent>((event, emit) async {
      emit(LoadingState());
        List categories = await LoginApi().getAllCategories();
          
        if(categories.isNotEmpty){
          emit(GetAllDataState(allData: categories));
        }else {
          print("cat error");
          emit(ErrorState());
        }
      
    },);
 
  on<GetAllProductsEvent>((event, emit) async{
    emit(LoadingState());
    List allProducts = await LoginApi().getAllProducts();
    if(allProducts.isNotEmpty){
      print(allProducts.length);
      print("allProducts.length");
      emit(GetAllDataState(allData:  allProducts));
    } else {
      emit(ErrorState());
    }
    
  });

  on<GetOneUsersEvent>((event, emit) async{
    emit(LoadingState());
   user = await LoginApi().getOneUser(id: event.id);
    print(user.runtimeType);
    print(" -----------------------");
    if(user!['id'] != null){
    print(" ----------yes ----------");
    print(user);
      emit(GetOneUsersState(users: user));
    } else {
      emit(ErrorState());
    }
  });
  
  on<GetOneCategoriesEvent>((event, emit) async{
    emit(LoadingState());
    final Map category = await LoginApi().getOneCategories(id: event.id);
    if (category['id'] != null  ) {
      emit(GetOneUsersState(users: category));
      
    }
  });
  
  on<GetOneProductsEvent>((event, emit) async{
    emit(LoadingState());
    final Map product = await LoginApi().getOneProducts(id: event.id);
    if (product['id'] != null  ) {
      emit(GetOneUsersState(users: product));
      
    }
  });

  on<CreateNewCategoriesEvent>((event, emit) async{
    
      try {
        emit(LoadingState());
        final netWorkeing = LoginApi();
          await netWorkeing.createNewCategory(
            name: event.name,
            );
        emit(SuccessState());
      } catch (error) {
        print(error);
        emit(ErrorState());
      }

  });

  on<CreateNewProductsEvent>((event, emit) async{
    
      try {
        emit(LoadingState());
        final netWorkeing = LoginApi();
          await netWorkeing.createNewProduct(
            title:  event.title,
            price: event.price,
            description: event.description,
            categoryId: event.categoryId,
          );
          print("add product");
        emit(SuccessState());
      } catch (error) {
        print(error);
        emit(ErrorState());
      }
  });
 
  on<EditUserEvent>((event, emit) async{
    try{ 
      emit (LoadingState());
      await LoginApi().updateUser(user: event.user , newName: event.name);
      emit(UpdateUserLoadedState(user: event.user));
    }catch(error){
      throw const FormatException();
    }
  });
  
  on<EditCategoryEvent>((event, emit) async{
    try{ 
      emit (LoadingState());
      await LoginApi().updateCategory(category: event.category , newName: event.name);
      emit(UpdateCategoryLoadedState(category: event.category));
    }catch(error){
      throw const FormatException();
    }
  });


  }
}
