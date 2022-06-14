import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:inri/components/loader.dart';
import 'package:inri/components/text_input.dart' as Input;
import 'package:inri/models/user_model.dart';
import 'package:inri/providers/all.dart';
import 'package:inri/utils/snackbar_message.dart';
import 'package:inri/utils/validators/field_validators.dart';
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
                        Input.TextInput(
                          controller: _nameController,
                          hintText: 'Name',
                          label: 'Name',
                          textInputAction: TextInputAction.next,
                          validator: emptyField,
                        ),
                        const SizedBox(height: 20),
                        Input.TextInput(
                          controller: _emailController,
                          hintText: 'Email',
                          label: 'Email',
                          textInputAction: TextInputAction.next,
                          validator: validatorEmail,
                        ),
                        const SizedBox(height: 20),
                        Input.TextInput(
                          controller: _occupationController,
                          hintText: 'Occupation',
                          label: 'Occupation',
                          textInputAction: TextInputAction.next,
                          validator: emptyField,
                        ),
                        const SizedBox(height: 20),
                        Input.TextInput(
                          controller: _courseController,
                          hintText: 'Course',
                          label: 'Course',
                          textInputAction: TextInputAction.next,
                          validator: emptyField,
                        ),
                        const SizedBox(height: 20),
                        Input.TextInput(
                          controller: _contactController,
                          hintText: 'Phone',
                          label: 'Phone',
                          textInputAction: TextInputAction.next,
                          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                          validator: emptyField,
                        ),
                        const SizedBox(height: 20),
                        Input.TextInput(
                          controller: _passswordController,
                          hintText: 'Password',
                          label: 'Password',
                          validator: validatePassword,
                          textInputAction: TextInputAction.next,
                          obscureText: true,
                        ),
                        const SizedBox(height: 20),
                        Input.TextInput(
                          controller: _confirmPasswordController,
                          hintText: 'Confirm Password',
                          label: 'Confirm Passowrd',
                          validator: validatePassword,
                          textInputAction: TextInputAction.next,
                          obscureText: true,
                        ),
                        const SizedBox(height: 20),
                        Input.TextInput(
                          controller: _registerPasswordController,
                          hintText: 'Register Key',
                          label: 'Register Key',
                          validator: emptyField,
                          obscureText: true,
                          textInputAction: TextInputAction.done,
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
                                    .catchError(
                                        (onError) => showSnackbar(context, onError.toString(), messageType.ERROR))
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
