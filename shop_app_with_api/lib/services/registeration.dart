import 'dart:convert';

import 'package:shop_app_with_api/models/category_model.dart';
import 'package:shop_app_with_api/models/upload_image_model.dart';
import 'package:http/http.dart' as http;
import 'package:shop_app_with_api/models/user_model.dart';
import 'package:shop_app_with_api/services/api_link.dart';
import 'package:shop_app_with_api/services/endpoints.dart';

class LoginApi with Api, ApiEndPoint {
  String token = '';
  String imagePath = '';

  Future signUpMethod(
      {required String name,
      required String email,
      required String password}) async {
    try {
      final userInfo = {
        "name": name,
        "email": email,
        "password": password,
        "avatar": "https://api.lorem.space/image/face?w=640&h=480",
      };
      final request = await http.post(Uri.parse(api + signUpENDPOINT),
          body: userInfo); // json.encode(user.toMapSend()));

      if (request.statusCode == 201) {
        // || request.statusCode <= 299) {
        print("success sign up");
        final res = json.decode(request.body);
        // return UploadImageModel.fromJson(json.decode(response.body));
      } else {
        throw const FormatException('Error to create the user'
            // "can't found data from API",
            );
      }
    } catch (error) {
      throw FormatException(error.toString());
    }
  }

  Future<UploadImageModel> uploadImageMethod({required String path}) async {
    final uri = Uri.parse(api + uploadImageENDPOINT);

    try {
      var request = http.MultipartRequest('POST', uri);
      request.files.add(await http.MultipartFile.fromPath('file', path));
      var response = await request.send();
      if (response.statusCode >= 200 || response.statusCode <= 299) {
        final image = UploadImageModel.fromJson(
            json.decode(await response.stream.bytesToString()));
        // Uint8List pathImage = image.readAsBytes;
        print("image.location");
        print(image.location);
        print(image.runtimeType);
        imagePath = image.location!;
        return image;
      } else {
        print("Error in upload");
        throw const FormatException("image can't uploading");
      }
    } catch (error) {
      throw const FormatException();
    }

    // try {
    //   final response = await http.post(
    //       Uri.parse(api + uploadImageENDPOINT),//'https://api.escuelajs.co/api/v1/files/upload'),
    //       body: json.encode(await File(path).readAsBytes()));
    //       print("image ${response.statusCode}");

    //        if (response.statusCode >= 200 || response.statusCode <= 299) {
    //     return UploadImageModel.fromJson(json.decode(response.body));
    //   } else {
    //     throw const FormatException(
    //       "can't found data from API",
    //     );
    //   }

    //   return UploadImageModel.fromJson(json.decode(response.body));
    // } catch (error) {
    //   throw FormatException(error.toString());
    // }
  }

  Future logInMethod({required String email, required String password}) async {
    try {
      final userInfo = {
        "email": email,
        "password": password,
      };

      final request =
          await http.post(Uri.parse("https://api.escuelajs.co/api/v1/auth/login"), body: userInfo);

      print("login");
      if (request.statusCode == 201) {
        final res = json.decode(request.body);
        print(res.runtimeType);

        print(res["access_token"]);
        token = res['access_token'];
        return res["access_token"];
      } else {
        print("can't login");
      }
    } catch (error) {
      throw FormatException(error.toString());
    }
  }


  Future viewProfile( String token) async{
  const url = "https://api.escuelajs.co/api/v1/auth/profile"; 

  final uri = Uri.parse(url);

  // ----- Token ----- 
  final headerToken = {
    "Authorization":"Bearer $token",
  };

  final request = await http.get(uri, headers:  headerToken);
  final res = json.decode(request.body);
  print(res.runtimeType);
  print(res);
  return res;

  print(request.statusCode);
  // print(request.body);
}

//  ----- Function to update User -----
  Future updateUser({required UserModel user, required String newName }) async {
    try{
      final updatedUser = {
      "name" : newName,
    };
    print(updatedUser["name"]);

    final response =
        await http.put(Uri.parse("$api$updateUserENDPOINT${user.id.toString()}"),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode(updatedUser));

    if (response.statusCode == 200) {
      print("update User");
      print(response.body);
    } else {
      throw Exception('Failed to load');
    }
    }catch(e){
      throw FormatException(e.toString());
    }
  }
 
//  ----- Function to update Category -----
  Future updateCategory({required CategoryModel category, required String newName }) async {
    try{
      final updatedCategory = {
      "name" : newName,
    };
    print(updatedCategory["name"]);

    final response =
        await http.put(Uri.parse("$api$updateCategoriesENDPOINT${category.id.toString()}"),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode(updatedCategory));

    if (response.statusCode == 200) {
      print("update Category");
      print(response.body);
    } else {
      throw Exception('Failed to load');
    }
    }catch(e){
      throw FormatException(e.toString());
    }
  }

//  ----- Function to get All Users -----
  Future getAllUsers() async {
    String url = "$api$getAllUsersENDPOINT";
    final uri = Uri.parse(url);

    final request = await http.get(uri);
    final res = json.decode(request.body);
    return res;
  }

//  ----- Function to get All Categories -----
  Future getAllCategories() async {
    try {
      final request = await http.get(
        Uri.parse(api + getAllCategoriesENDPOINT),
      );
      final res = json.decode(request.body);
      print(res.runtimeType);
      print("category _________________ res.runtimeType");
      return res;
    } catch (error) {
      throw FormatException(error.toString());
    }
  }

//  ----- Function to get All Products -----
  Future getAllProducts() async {
    try {
      final request = await http.get(
        Uri.parse(api + getAllProductsENDPOINT),
      );
      final res = json.decode(request.body);
      return res;
    } catch (error) {
      throw FormatException(error.toString());
    }
  }

//  ----- Function to get one User -----
  Future getOneUser({required int id}) async {
    String url = "$api$getAllUsersENDPOINT${id.toString()}";
    final uri = Uri.parse(url);

    final request = await http.get(uri);
    final res = json.decode(request.body);
    print(res.runtimeType);
    return res;
  }

//  ----- Function to get One Categories -----
  Future getOneCategories({required int id}) async {
    try {
      final request = await http.get(
        Uri.parse(api + getAllCategoriesENDPOINT + id.toString()),
      );
      final res = json.decode(request.body);
      return res;
    } catch (error) {
      throw FormatException(error.toString());
    }
  }

//  ----- Function to get One Products -----
  Future getOneProducts({required int id}) async {
    try {
      final request = await http.get(
        Uri.parse(api + getAllProductsENDPOINT + id.toString()),
      );
      final res = json.decode(request.body);
      return res;
    } catch (error) {
      throw FormatException(error.toString());
    }
  }

//  ----- Function to add new category  -----
  Future createNewCategory({required String name}) async {
    try {
      print(name.runtimeType);
      print(name);
      print("name");
      final categoryInfo = {
        "name": name.toString(),
        "image": "https://api.lorem.space/image/book?w=150&h=220"
      };

      final request = await http.post(
          Uri.parse(api + createNewCategoriesENDPOINT),
          body: categoryInfo);

      if (request.statusCode == 201) {
        print("success category");
        final res = json.decode(request.body);
      } else {
        throw const FormatException('Error to create the category');
      }
    } catch (error) {
      throw FormatException(error.toString());
    }
  }

//  ----- Function to add new Products -----
  Future createNewProduct(
      {required String title,
      required double price,
      required String description,
      required int categoryId,
      }) async {
    try {
      final Map<String, dynamic> productInfo = {
        "title": title,
        "price": price,
        "description": description,
        "categoryId": categoryId,
        "images": ["https://placeimg.com/640/480/any"]
      };
      final http.Response request = await http.post(
        Uri.parse(api + createNewProductENDPOINT),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(productInfo),
      );

      final dynamic responseBody = jsonDecode(request.body);
      if (request.statusCode == 201) {
        print("success added new product");
        print(responseBody);
      } else {
        throw const FormatException('Error to create the product');
      }
    } catch (error) {
      throw FormatException(error.toString());
    }
  }



}
