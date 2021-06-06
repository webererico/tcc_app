import 'package:flutter/material.dart';

class Auth extends ChangeNotifier {
  String _token;

  set token(String value) {
    _token = value;
    notifyListeners();
  }

  get token => _token;

  login(String email, String pass) async {
    return true;
  }

  signUp() {}


 logout () {

  }
}
