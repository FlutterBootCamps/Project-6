

import 'package:fluttertoast/fluttertoast.dart';

void SnackBarToast(String message){
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.TOP,
      fontSize: 16.0
  );
}