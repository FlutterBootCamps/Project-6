import 'dart:convert';
import 'package:http/http.dart' as http;

class UserLogin {
  Future<Map<String,dynamic>> login({required String email, required String password}) async {
    final url = "https://api.escuelajs.co/api/v1/auth/login";
    final uri = Uri.parse(url);

    final userInfo = {"email": email, "password": password};

    final response = await http.post(uri, body: userInfo);

      final res = json.decode(response.body);

    try {
      return res;
      
    } catch (e) {
      throw FormatException();
      
    }
}
}




// class UserGet {
//   Future profile( String token) async {
//     final url = "https://api.escuelajs.co/api/v1/auth/profile";
//     final uri = Uri.parse(url);


// final headerInfo ={
// "Authorization" : "Bearer $token",
// };

//     final request = await http.get(uri,headers: headerInfo);

//      print(request.body);
//     print(request.statusCode);
// }
// }