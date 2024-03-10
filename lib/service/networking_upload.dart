import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:my_store/model/response_upload.dart';

class NetWorkingUpload {
  Future<ResponseUpload> uploadImageMethod({required String path}) async {
    try {      
      var request = http.MultipartRequest("POST", Uri.parse('https://api.escuelajs.co/api/v1/files/upload'));
      request.files.add(await http.MultipartFile.fromPath('file', path));

      var response = await request.send();
      
      if (response.statusCode == 201) {
        // Read and decode the response body
        var responseBody = await response.stream.bytesToString();

        // Parse the response using the ResponseUpload.fromJson method
        return ResponseUpload.fromJson(json.decode(responseBody));
      } else {
        print("Error during image upload. Status code: ${response.statusCode}");
        throw const FormatException("Error during image upload");
      }
    } catch (error) {
      print("Error: $error");
      throw FormatException(error.toString());
    }
  }

  Future<List<String>> uploadMultiImageMethod({required List<String> paths}) async {
  try {
    var request = http.MultipartRequest("POST", Uri.parse('https://api.escuelajs.co/api/v1/files/upload'));

    for (int i = 0; i < paths.length; i++) {
      request.files.add(await http.MultipartFile.fromPath('file$i', paths[i]));
    }

    var response = await request.send();

    if (response.statusCode == 201) {
      // Read and decode the response body
      var responseBody = await response.stream.bytesToString();
      print("Response: $responseBody");

      // Parse the response using the ResponseUpload.fromJson method
      List<String> jsonList = json.decode(responseBody);
      //List<String> uploads = jsonList.map((json) => ResponseUpload.fromJson(json)).toList();

      return jsonList;
    } else {
      print("Error during image upload. Status code: ${response.statusCode}");
      throw const FormatException("Error during image upload");
    }
  } catch (error) {
    print("Error: $error");
    throw FormatException(error.toString());
  }
}

}