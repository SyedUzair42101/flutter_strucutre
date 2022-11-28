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
  TextEditingController _emailController = TextEditingController();
  UserProfileModel? authCustomerUser = UserProfileModel();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _nameController = TextEditingController();

  AuthenticationService _authenticationService = AuthenticationService();
  final _formKey = GlobalKey<FormState>();
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
        child: Form(
      key: _formKey,
      child: Column(
        children: [
          //signin text
          Text('Signin Screen'),
          //name textfield
          TextFormField(
            controller: _nameController,
            decoration: UIConfig().inputDecoration(
                'Enter Name', 'Name', Icons.person, null, null),
          ),
          //email textfield
          TextFormField(
            controller: _emailController,
            validator: (value) {
              if (value!.isEmpty) {
                return 'Please enter email';
              }
              return null;
            },
            decoration: UIConfig().inputDecoration(
                'your email', 'email', Icons.email, null, null),
          ),
          //password textfield
          TextFormField(
            controller: _passwordController,
            obscureText: _obscureText,
            validator: (value) {
              if (value == null || value.isEmpty || value.length < 4) {
                return 'Please enter Strong password';
              }
              return null;
            },
            decoration: UIConfig().inputDecoration('your Password', 'Password',
                Icons.lock, Icons.visibility, tooglePasstord),
          ),
          //phone textfield
          TextFormField(
            decoration: UIConfig().inputDecoration(
                'your phone', 'phone', Icons.phone, null, null),
          ),
          //signin button
          CustomButton(
            buttonText: "signin",
            onPressed: () async {
              authCustomerUser = await _authenticationService.Login(
                  _emailController.text,
                  _passwordController.text,
                  context); //get token
            },
          ),
        ],
      ),
    ));
  }

  void tooglePasstord() {
    _obscureText = !_obscureText;
    setState(() {});
  }
}
