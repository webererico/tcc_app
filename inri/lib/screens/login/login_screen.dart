import 'package:flutter/material.dart';
import 'package:inri/components/loader.dart';
import 'package:inri/components/text_input.dart';
import 'package:inri/constants/colors.dart';
import 'package:inri/interfaces/shared_preferences.dart';
import 'package:inri/providers/all.dart';
import 'package:inri/screens/dashboard/dashboard_screen.dart';
import 'package:inri/screens/login/components/save_credentials.dart';
import 'package:inri/screens/register/register_screen.dart';
import 'package:inri/utils/snackbar_message.dart';
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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _saveCredentials = true;

  Future initData() async {
    if (await Prefs.isAuthenticated) return Navigator.of(context).pushReplacementNamed(DashboardScreen.routeName);
    if (await Prefs.saveCredentials) {
      _emailController.text = await Prefs.login;
      _passwordController.text = await Prefs.password;
    }
  }

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
            FutureBuilder(
                future: initData(),
                builder: (context, snapshot) {
                  return Form(
                    key: _formKey,
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
                          hintText: '********',
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
                              onPressed: () {
                                auth
                                    .doLogin(_emailController.text, _passwordController.text, _saveCredentials)
                                    .then((value) =>
                                        Navigator.of(context).pushReplacementNamed(DashboardScreen.routeName))
                                    .catchError((onError) => showSnackbar(context, onError.toString(), messageType.ERROR));
                              },
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
                  );
                })
          ],
        ),
      ),
    );
  }
}
