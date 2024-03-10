import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_store/service/networking_catagory.dart';

Future<String> getImage() async {
  final ImagePicker picker = ImagePicker();
  final XFile? image = await picker.pickImage(source: ImageSource.gallery);
  if (image != null) {
    return image.path;
  } else {
    throw const FormatException("No selected image");
  }
}





      
