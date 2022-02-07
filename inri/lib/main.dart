import 'package:flutter/material.dart';
import 'package:inri/constants/navigation_key.dart';
import 'package:inri/constants/theme.dart';
import 'package:inri/interfaces/shared_preferences.dart';
import 'package:inri/providers.dart';
import 'package:inri/repositories/repository.dart';
import 'package:inri/routes.dart';
import 'package:inri/screens/login/login_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Repository.init();
  await Prefs.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: MaterialApp(
        title: 'INRI',
        theme: theme,
        routes: routes,
        debugShowCheckedModeBanner: false,
        navigatorKey: navigatorKey,
        home: const LoginScreen(),
      ),
    );
  }
}
