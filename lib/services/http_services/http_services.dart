import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:practice/app_constants/api_constants.dart';
import 'package:practice/models/user_profile_model.dart';
import 'package:practice/screens/profile_view/user_profile.dart';

class AuthenticationService with ChangeNotifier {
  String _authToken = "";

  AuthenticationService._internal();
  factory AuthenticationService() {
    return _instance;
  }
  static final AuthenticationService _instance =
      AuthenticationService._internal();

  Map<String, String> _getRequestHeaders() {
    return {
      "Accept": "application/json",
      'Authorization': 'Bearer $_authToken'
    };
  }

  // Http Get request
  Future<http.Response> _get(String endPoint, Map<String, String> header) {
    String url = APIConstants.API_BASE_URL + endPoint;
    // print("_get: $url");
    Uri uri = Uri.parse(url);
    return http.get(uri, headers: header);
  }

  // Http Post request
  Future<http.Response> _post(
      String endPoint, Map<String, String> header, Map<String, dynamic> body) {
    String url = APIConstants.API_BASE_URL + endPoint;
    // print("_post: $url");
    Uri uri = Uri.parse(url);
    return http.post(uri, headers: header, body: body);
  }

  // Convert To JSON
  // ignore: unused_element
  Map<String, dynamic> _convertJsonToMap(String response) {
    return json.decode(response);
  }

  // getter for token
  Future<String?> getToken() async {
    return _authToken;
  }

// Post Login Credential to API
  Future Login(email, password, BuildContext context) async {
    http.Response response = await _post(
        "/login?email=$email&password=$password", _getRequestHeaders(), {});
    // Response code
    if (response.statusCode == 200) {
      var jsonList = json.decode(response.body);
      print(jsonList);
      _authToken = jsonList['data']['token'];
      _authToken = (await getToken()).toString();
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => USerProfile(),
      ));
    } else {
      throw Exception('Failed to post login credentials');
    }
  }

  // Post Signup Credential to API
  Future Signup(name, email, password, confirm_password, phone,
      BuildContext context) async {
    http.Response response = await _post(
        "/register?name=$name&email=$email&password=$password&confirm_password=$confirm_password&phone=$phone",
        _getRequestHeaders(), {});
    // Response code
    if (response.statusCode == 200) {
      var jsonList = json.decode(response.body);
      print(jsonList);
    } else {
      throw Exception('User Already register');
    }
  }

  // get Logout Credential from API
  Future Logout(BuildContext context) async {
    http.Response response = await _get("/logout", _getRequestHeaders());
    if (response.statusCode == 200) {
      var jsonList = json.decode(response.body);
      print(jsonList);
    } else {
      throw Exception('Failed to logout');
    }
  }

  Future<UserProfileModel> getProfile() async {
    http.Response response = await _get("/profile", _getRequestHeaders());
    // Response code
    if (response.statusCode == 200) {
      var jsonList = json.decode(response.body);
      print(jsonList);
      return UserProfileModel.fromJson(jsonList);
    } else {
      throw Exception('Failed to logout');
    }
  }

  // Post profile updates to API
  Future profileUpdate(
    name,
    phone,
    image,
  ) async {
    http.Response response = await _post(
        "/profileUpdate?name=$name&phone=$phone&image=$image",
        _getRequestHeaders(), {});
    // Response code
    if (response.statusCode == 200) {
      var jsonList = json.decode(response.body);
      print(jsonList);
    } else {
      throw Exception('Failed to update');
    }
  }
}

class AuthException implements Exception {
  static const cancelled = AuthException('No account');

  const AuthException(this.message);

  final String message;

  @override
  String toString() => message;
}
