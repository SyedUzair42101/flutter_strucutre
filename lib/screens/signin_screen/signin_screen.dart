import 'package:flutter/material.dart';
import 'package:practice/screens/sliver_appbar/sliver_appbar.dart';
import 'package:practice/widgets/custom_buttom.dart';
import 'package:practice/widgets/input_decoration.dart';
import 'package:practice/widgets/signin_popup.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  State<SigninScreen> createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
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
          //email textfield
          TextFormField(
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
          //signin button
          InkWell(
            onTap: () {
              if (_formKey.currentState!.validate()) {
                print('validated');
              }
            },
            child: CustomButton(
              buttonText: "signin",
              onPressed: () {
                showSigninPopup(
                  context,
                  'Signin',
                  'Are you sure to signin',
                  () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => SliverAppbar()));
                  },
                  () {
                    Navigator.of(context).pop();
                  },
                );
              },
            ),
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
