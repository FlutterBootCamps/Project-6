import 'dart:convert';

import 'package:api_app/models/proudect_model.dart';
import 'package:http/http.dart' as http;
class AllProducts {

  Future<List<AllProduct>>getAllProudect()async{

     const url = 'https://api.escuelajs.co/api/v1/products/';

    final uri = Uri.parse(url);
    try{
     final response =await http.get(uri);
      final List jsonlist =await jsonDecode(response.body);
      final List<AllProduct> allproudectlist = List.generate(jsonlist.length, (index) {
        return AllProduct.fromJson(jsonlist[index]);
      });
      return allproudectlist;
    }catch(e){
      throw const FormatException();
    }
  //   http.Response futurPost =
  //   await http.get(uri);
  //   if (futurPost.statusCode == 200) {
  //     return AllProduct.fromJson(jsonDecode(futurPost.body));
  //   }else{
  //     throw Exception('error');
  //   }
   }
  
}