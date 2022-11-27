import 'package:flutter/material.dart';

class CustomSnackBar {
  // error Success SnackBar
  static buildSuccessSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }
}
