import 'package:flutter/material.dart';
import 'package:practice/models/user_profile_model.dart';
import 'package:practice/services/http_services/http_services.dart';
import 'package:practice/widgets/custom_buttom.dart';
import 'package:practice/widgets/input_decoration.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  UserProfileModel? authCustomerUser = UserProfileModel();

  late TextEditingController _passwordController = TextEditingController();
  late TextEditingController _emailController = TextEditingController();

  bool _obscureText = true;
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
      title: Text('Signin Screen'),
    );
  }

  //widget for body
  _buildBody() {
    return Container(
        child: Column(
      children: [
        //signin text
        Text('Signin Screen'),

        //email textfield
        TextFormField(
          controller: _emailController,
          decoration: UIConfig()
              .inputDecoration('your email', 'email', Icons.email, null, null),
        ),
        //password textfield
        TextFormField(
          controller: _passwordController,
          obscureText: _obscureText,
          decoration: UIConfig().inputDecoration('your Password', 'Password',
              Icons.lock, Icons.visibility, tooglePasstord),
        ),

        //signin button
        CustomButton(
          buttonText: "Signin",
          onPressed: () {
            AuthenticationService().Login(_emailController.text,
                _passwordController.text, context); //get token
          },
        ),
      ],
    ));
  }

  void tooglePasstord() {
    _obscureText = !_obscureText;
    setState(() {});
  }
}
