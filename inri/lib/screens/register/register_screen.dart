import 'package:flutter/material.dart';
import 'package:inri/components/custom_scaffold.dart';
import 'package:inri/components/text_input.dart';

class RegisterScreen extends StatelessWidget {
  static const routeName = '/register-screen';
  RegisterScreen({Key? key}) : super(key: key);

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _occupationController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passswordController = TextEditingController();
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
            const Text(
              'Criar conta',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 10),
            Form(
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
                    controller: _occupationController,
                    hintText: 'Occupation',
                    label: 'Occupation',
                  ),
                  const SizedBox(height: 20),
                  TextInput(
                    controller: _emailController,
                    hintText: 'Email',
                    label: 'Email',
                  ),
                  const SizedBox(height: 20),
                  TextInput(
                    controller: _passswordController,
                    hintText: 'Password',
                    label: 'Password',
                  ),
                  const SizedBox(height: 20),
                  TextInput(
                    controller: _confirmPasswordController,
                    hintText: 'Confirm Password',
                    label: 'Confirm Passowrd',
                  ),
                  const SizedBox(height: 20),
                  TextInput(
                    controller: _registerPasswordController,
                    hintText: 'Register Key',
                    label: 'Register Key',
                  ),
                  const SizedBox(height: 20),
                  FloatingActionButton.extended(onPressed: () {}, label: const Text('Create Account'))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
