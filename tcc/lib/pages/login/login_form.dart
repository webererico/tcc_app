import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {
  final Function _onSummit;
  final String _buttonText;
  final TextEditingController _emailController;
  final TextEditingController _passController;

  const LoginForm(this._onSummit, this._buttonText, this._emailController,
      this._passController);

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    return Container(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _emailController,
            ),
            TextFormField(
              controller: _passController,
            ),
            TextButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _onSummit();
                  }
                },
                child: Text(_buttonText))
          ],
        ),
      ),
    );
  }
}
