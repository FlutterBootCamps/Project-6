import 'package:flutter/material.dart';

extension Screen on BuildContext {
  getWidth() {
    return MediaQuery.of(this).size.width;
  }

  pushTo({required Widget view}) {
    return Navigator.of(this)
        .push(MaterialPageRoute(builder: (context) => view));
  }

  getHeight() {
    return MediaQuery.of(this).size.height;
  }
}
