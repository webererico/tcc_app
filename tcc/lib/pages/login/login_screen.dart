import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tcc/pages/login/login_form.dart';
import 'package:tcc/pages/main/main_screen.dart';
import 'package:tcc/providers/auth.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passController = TextEditingController();
    Auth _auth = Provider.of<Auth>(context);
    return Container(
      child: Column(
        children: [
          LoginForm(
              _auth
                  .login(_emailController.text, _passController.text)
                  .then((value) {
                if (value) {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => MainScreen()));
                }
              }),
              'Entrar',
              _emailController,
              _passController)
        ],
      ),
    );
  }
}
