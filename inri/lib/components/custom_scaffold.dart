import 'package:flutter/material.dart';
import 'package:inri/components/menu_drawer.dart';
import 'package:inri/components/pop_up_menu.dart';
import 'package:inri/constants/colors.dart';

class CustomScaffold extends StatelessWidget {
  final String? title;
  final Widget body;
  final VoidCallback? onRefreshTap;
  final Widget? floatingActionButton;

  const CustomScaffold({required this.body, this.title, this.floatingActionButton, this.onRefreshTap});
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
        actions: [
          if (onRefreshTap != null)
            IconButton(
              onPressed: onRefreshTap,
              icon: const Icon(Icons.refresh),
            ),
          const PopUpMenu(),
        ],
      ),
      body: body,
      floatingActionButton: floatingActionButton,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
