import 'package:flutter/material.dart';
import 'package:practice/models/user_profile_model.dart';
import 'package:practice/screens/homescreen/homescreen.dart';
import 'package:practice/screens/sliver_appbar/sliver_appbar.dart';
import 'package:practice/services/http_services/http_services.dart';
import 'package:practice/widgets/custom_buttom.dart';
import 'package:practice/widgets/input_decoration.dart';
import 'package:practice/widgets/signin_popup.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  UserProfileModel? authCustomerUser = UserProfileModel();

  TextEditingController _passwordController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  AuthenticationService _authenticationService = AuthenticationService();

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
        //name textfield
        TextFormField(
          controller: _nameController,
          decoration: UIConfig()
              .inputDecoration('Enter Name', 'Name', Icons.person, null, null),
        ),
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
        //phone textfield
        TextFormField(
          controller: _phoneController,
          decoration: UIConfig()
              .inputDecoration('your phone', 'phone', Icons.phone, null, null),
        ),
        //signin button
        CustomButton(
          buttonText: "SIGNUP",
          onPressed: () async {
            _authenticationService.Signup(
                _nameController.text,
                _emailController.text,
                _passwordController.text,
                _passwordController.text,
                _phoneController.text,
                context); //get token
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
