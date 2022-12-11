import 'package:flutter/material.dart';
import 'package:practice/screens/bottom_button/bottom_button.dart';
import 'package:practice/services/http_services/http_services.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider<AuthenticationService>(
      create: (context) => AuthenticationService(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: BottomButon(),
    );
  }
}
