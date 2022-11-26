import 'package:flutter/material.dart';
import 'package:practice/screens/homescreen/homescreen.dart';
import 'package:practice/screens/signin_screen/signin_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: SigninScreen(),
    );
  }
}
