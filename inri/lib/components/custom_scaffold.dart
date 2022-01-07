import 'package:flutter/material.dart';
import 'package:inri/components/menu_drawer.dart';
import 'package:inri/components/pop_up_menu.dart';
import 'package:inri/constants/colors.dart';

class CustomScaffold extends StatelessWidget {
  final String? title;
  final Widget body;

  const CustomScaffold({required this.body, this.title});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuDrawer(),
      appBar: AppBar(
        title: title == null
            ? Image.asset(
                'assets/png/inri_logo.png',
                width: 40,
              )
            : Text(
                title!,
                style: const TextStyle(color: kSecondaryColor),
              ),
        centerTitle: true,
        actions: const [PopUpMenu()],
      ),
      body: body,
    );
  }
}
