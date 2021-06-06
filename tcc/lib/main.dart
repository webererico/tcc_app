import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tcc/assets/colors.dart';
import 'package:tcc/pages/splash/splash_screen.dart';
import 'package:tcc/providers/auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => Auth(),
        ),
      ],
      child: MaterialApp(
        title: 'Nome do app',
        theme: ThemeData(
            primarySwatch: mainColor, backgroundColor: Colors.white),
        home: SplashScreen(),
      ),
    );
  }
}
