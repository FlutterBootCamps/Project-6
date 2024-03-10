import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

enum TypeDialog { success, error }

extension Screen on BuildContext {
  getWidth() {
    return MediaQuery.of(this).size.width;
  }

  getHeight() {
    return MediaQuery.of(this).size.height;
  }

  pushTo({required Widget view}) {
    Navigator.of(this).push(MaterialPageRoute(builder: (context) => view));
  }

  getLoading() {
    return showDialog(
        barrierColor: Colors.transparent,
        barrierDismissible: false,
        context: this,
        builder: (context) {
          return const AlertDialog(
            backgroundColor: Colors.transparent,
            elevation: 0,
            content: SizedBox(
              height: 100,
              width: 100,
              child: Center(child: CircularProgressIndicator()),
            ),
          );
        });
  }

  getDialog({required TypeDialog type}) {
    return showDialog(
        context: this,
        builder: (context) {
          return AlertDialog(
            elevation: 0,
            backgroundColor: type == TypeDialog.success
                ? const Color.fromARGB(128, 76, 175, 79)
                : const Color.fromARGB(112, 244, 67, 54),
            content: const SizedBox(
              height: 100,
              width: 100,
              child: Center(child: Text("There is error")),
            ),
          );
        });
  }

  snackBar({required String text}) {
    ScaffoldMessenger.of(this).showSnackBar(
       SnackBar(
        content: Text( text ),
      ),
    );
  }
}

//  Future<String> getImage() async {
//     final ImagePicker picker = ImagePicker();
//     final XFile? image = await picker.pickImage(source: ImageSource.gallery);
//     if (image != null) {
//       return image.path;
//     } else {
//       throw const FormatException("No selected image");
//     }
//   }
