import 'package:flutter/material.dart';

class InputsDecorations {
  static InputDecoration authInputDecoration({
    String hintText,
    String labelText,
    IconData icons,
    String errorText,
  }) {
    return InputDecoration(
      icon: Icon(
        icons,
        color: Colors.green[900],
      ),
      hintText: hintText,
      labelText: labelText,
      errorText: errorText,
    );
  }
}
