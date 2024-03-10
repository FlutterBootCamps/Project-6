
import 'package:flutter/material.dart';

extension Dialog on BuildContext {
  getDialog({required TypeDialog type}) {
    return showDialog(
        context: this,
        builder: (context) {
          return AlertDialog(
            elevation: 0,
            backgroundColor:
                type == TypeDialog.success ? Colors.green : Colors.red,
            content: const SizedBox(
              height: 150,
              width: 150,
              child: Center(child: Text("There is error")),
            ),
          );
        });
  }
}

enum TypeDialog { success, error }
