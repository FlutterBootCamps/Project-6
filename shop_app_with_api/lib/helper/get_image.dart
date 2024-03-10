import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';

List<Uint8List> pathImage = [];

Future<String> getImage() async {

    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      pathImage.clear();
      pathImage.add(await image.readAsBytes()) as List<Uint8List>;
     
      return image.path;
    } else {
      throw const FormatException("No selected image");
    }
  }