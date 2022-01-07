import 'package:flutter/material.dart';
import 'package:inri/components/loader.dart';
import 'package:inri/components/text_input.dart';
import 'package:inri/constants/colors.dart';
import 'package:inri/providers/all.dart';
import 'package:inri/utils/snackbar_message.dart';
import 'package:inri/utils/validator/password_validator.dart';
import 'package:provider/provider.dart';

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
                  validator: validatePassword,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextInput(
                  controller: _newPasswordController,
                  hintText: 'New Password',
                  label: 'New Password',
                  obscureText: true,
                  validator: validatePassword,
                )
              ],
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Consumer<AuthProvider>(builder: (context, authProvider, _) {
          if (authProvider.isLoading) return const Loader();
          return FloatingActionButton.extended(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                authProvider
                    .changePassword(_currentPasswordController.text, _newPasswordController.text)
                    .catchError((onError) => showSnackbar(context, onError, messageType.ERROR))
                    .then((value) {
                  showSnackbar(context, value.toString(), messageType.SUCCESS);
                  _currentPasswordController.clear();
                  _newPasswordController.clear();
                });
              }
            },
            label: const Text('Update Password'),
            icon: const Icon(Icons.save),
          );
        }));
  }
}
