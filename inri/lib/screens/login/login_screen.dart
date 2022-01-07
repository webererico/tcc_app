import 'package:flutter/material.dart';
import 'package:inri/components/loader.dart';
import 'package:inri/components/text_input.dart';
import 'package:inri/constants/colors.dart';
import 'package:inri/providers/all.dart';
import 'package:inri/screens/login/components/save_credentials.dart';
import 'package:inri/screens/register/register_screen.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login-screen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _saveCredentials = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 50),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 100, right: 100, top: 100, bottom: 30),
              child: Image.asset('assets/png/inri_logo.png'),
            ),
            Form(
              child: Column(
                children: [
                  TextInput(
                    controller: _emailController,
                    label: 'Email',
                    hintText: 'example@email.com',
                  ),
                  const SizedBox(height: 20),
                  TextInput(
                    controller: _passwordController,
                    label: 'Password',
                    hintText: '****',
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                  SaveCredentials(
                      value: _saveCredentials, onChanged: (value) => setState(() => _saveCredentials = value)),
                  const SizedBox(height: 40),
                  Consumer<AuthProvider>(
                    builder: (context, auth, _) {
                      if (auth.isLoading) return const Loader();
                      return FloatingActionButton.extended(
                        label: const Text('Login'),
                        onPressed: () =>
                            auth.doLogin(_emailController.text, _passwordController.text, _saveCredentials),
                        elevation: 0,
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () => Navigator.of(context).pushNamed(RegisterScreen.routeName),
                    child: const Text(
                      'Criar conta',
                      style: TextStyle(
                        color: kSecondaryColor,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
