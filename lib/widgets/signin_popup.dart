import 'package:flutter/material.dart';

showSigninPopup(
  BuildContext context,
  String title,
  String content,
  final void Function() oKPressed,
  final void Function() cancelPressed,
) async {
  return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          //alert tittle
          title: Text(title),
//alert contennt
          content: Text(content),
//buttons
          actions: [
            //signin button
            TextButton(onPressed: oKPressed, child: Text('Signin')),
            //cancel button
            TextButton(onPressed: cancelPressed, child: Text('Cancel')),
          ],
        );
      });
}
