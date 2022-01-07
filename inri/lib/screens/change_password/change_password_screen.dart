import 'package:flutter/material.dart';
import 'package:inri/components/text_input.dart';
import 'package:inri/constants/colors.dart';

class ChangePasswordScreen extends StatelessWidget {
  static const routeNamed = '/change-password-screen';

  ChangePasswordScreen({Key? key}) : super(key: key);

  final TextEditingController _currentPasswordController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Change Password',
          style: TextStyle(
            color: kSecondaryColor,
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextInput(
                controller: _currentPasswordController,
                hintText: 'Current Password',
                obscureText: true,
                label: 'Current Password',
              ),
              const SizedBox(
                height: 20,
              ),
              TextInput(
                controller: _newPasswordController,
                hintText: 'New Password',
                label: 'New Password',
                obscureText: true,
              )
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: const Text('Update Password'),
        icon: const Icon(Icons.save),
      ),
    );
  }
}
