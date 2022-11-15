import 'package:flutter/material.dart';
import 'package:practice/widgets/custom_buttom.dart';
import 'package:practice/widgets/input_decoration.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(),
      body: _buildBody(),
    );
  }

  //widget for appbar
  _buildAppbar() {
    return AppBar(
      title: Text('Signing Screen'),
    );
  }

  //widget for body
  _buildBody() {
    return Container(
        child: Column(
      children: [
        //signing text
        Text('Signing Screen'),
        //email text-field
        TextField(
          decoration: UIConfig().inputDecoration('your email', 'email'),
        ),
        //password text-field
        TextField(
          decoration: UIConfig().inputDecoration('your Password', 'Password'),
        ),
        //signing button
        CustomButton(
          buttonText: "signing",
        ),
      ],
    ));
  }
}
