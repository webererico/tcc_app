import 'package:flutter/material.dart';
import 'package:inri/components/loader.dart';
import 'package:inri/components/text_input.dart';
import 'package:inri/models/user_model.dart';
import 'package:inri/providers/all.dart';
import 'package:inri/utils/snackbar_message.dart';
import 'package:inri/utils/validator/password_validator.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatelessWidget {
  static const routeName = '/register-screen';
  RegisterScreen({Key? key}) : super(key: key);

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _occupationController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passswordController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _courseController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _registerPasswordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(30),
              child: Image.asset(
                'assets/png/inri_horizontal.png',
              ),
            ),
            Consumer<AuthProvider>(builder: (context, authProvider, _) {
              if (authProvider.isLoading)
                return const Center(
                  child: Loader(),
                );
              return Column(
                children: [
                  const Text(
                    'Criar conta',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        TextInput(
                          controller: _nameController,
                          hintText: 'Name',
                          label: 'Name',
                        ),
                        const SizedBox(height: 20),
                        TextInput(
                          controller: _emailController,
                          hintText: 'Email',
                          label: 'Email',
                        ),
                        const SizedBox(height: 20),
                        TextInput(
                          controller: _occupationController,
                          hintText: 'Occupation',
                          label: 'Occupation',
                        ),
                        const SizedBox(height: 20),
                        TextInput(
                          controller: _courseController,
                          hintText: 'Course',
                          label: 'Course',
                        ),
                        const SizedBox(height: 20),
                        TextInput(
                          controller: _contactController,
                          hintText: 'Phone',
                          label: 'Phone',
                        ),
                        const SizedBox(height: 20),
                        TextInput(
                          controller: _passswordController,
                          hintText: 'Password',
                          label: 'Password',
                          validator: validatePassword,
                        ),
                        const SizedBox(height: 20),
                        TextInput(
                          controller: _confirmPasswordController,
                          hintText: 'Confirm Password',
                          label: 'Confirm Passowrd',
                          validator: validatePassword,
                        ),
                        const SizedBox(height: 20),
                        TextInput(
                          controller: _registerPasswordController,
                          hintText: 'Register Key',
                          label: 'Register Key',
                        ),
                        const SizedBox(height: 20),
                        FloatingActionButton.extended(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              if (_passswordController.text != _confirmPasswordController.text) {
                                return showSnackbar(context, 'Passwords doesn\'t match!', messageType.ERROR);
                              } else {
                                authProvider
                                    .doRegister(
                                      UserModel(
                                          name: _nameController.text,
                                          email: _emailController.text,
                                          occupation: _occupationController.text,
                                          course: _courseController.text,
                                          contact: _contactController.text,
                                          password: _passswordController.text,
                                          registerKey: _registerPasswordController.text),
                                    )
                                    .catchError((onError) => showSnackbar(context, onError, messageType.ERROR))
                                    .then((value) {
                                  showSnackbar(context, 'Profile Created', messageType.SUCCESS);
                                  Navigator.of(context).pop();
                                });
                              }
                            }
                          },
                          label: const Text('Create Account'),
                        )
                      ],
                    ),
                  )
                ],
              );
            })
          ],
        ),
      ),
    );
  }
}
