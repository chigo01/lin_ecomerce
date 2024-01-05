import 'package:flutter/material.dart';

extension OnPressed on Widget {
  Widget onTap(VoidCallback callback) {
    return GestureDetector(
      onTap: callback,
      child: this,
    );
  }
}
