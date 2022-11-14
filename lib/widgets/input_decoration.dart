import 'package:flutter/material.dart';

class UIConfig {
  InputDecoration inputDecoration(String hintText, String labelText) {
    return InputDecoration(
      isDense: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(50),
        borderSide: BorderSide.none,
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 11),
      fillColor: Color(0xffF4F5F7),
      hintText: hintText,
      labelText: labelText,
    );
  }
}
