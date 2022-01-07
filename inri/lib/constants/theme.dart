import 'package:flutter/material.dart';
import 'package:inri/constants/borders.dart';
import 'package:inri/constants/colors.dart';

final theme = ThemeData(
  appBarTheme: const AppBarTheme(
    backgroundColor: kAppBarBackgroundColor,
    elevation: 0,
    actionsIconTheme: IconThemeData(color: kSecondaryColor),
    iconTheme: IconThemeData(color: kSecondaryColor),
  ),
  floatingActionButtonTheme: const FloatingActionButtonThemeData(
    elevation: 0,
    backgroundColor: kPrimaryColor,
  ),
  textTheme: const TextTheme(
      bodyText1: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      bodyText2: TextStyle(color: Colors.black),
      headline1: TextStyle(color: Colors.white, fontSize: 12),
      headline2: TextStyle(color: kTextBlackMedium, fontSize: 16, fontWeight: FontWeight.bold),
      headline6: TextStyle(color: kTextBlackMedium, fontSize: 18, fontWeight: FontWeight.bold),
      button: TextStyle(color: Colors.white, fontSize: 14)),
  snackBarTheme: const SnackBarThemeData(
    actionTextColor: Colors.white,
    backgroundColor: kPrimaryColor,
    elevation: 1,
  ),
  iconTheme: const IconThemeData(color: kPrimaryColor),
  inputDecorationTheme:
      InputDecorationTheme(focusedBorder: focusBorder, errorBorder: errorBorder, enabledBorder: enableBorder),
  buttonTheme: const ButtonThemeData(),
  primaryColor: kPrimaryColor,
  primarySwatch: kPrimaryColorSwatch,
  backgroundColor: Colors.white,
  textButtonTheme: TextButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(kPrimaryColor),
      textStyle: MaterialStateProperty.all(
        const TextStyle(color: Colors.white),
      ),
    ),
  ),
  dividerTheme: const DividerThemeData(color: Colors.grey),
);
