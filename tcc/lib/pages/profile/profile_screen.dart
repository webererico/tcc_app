import 'package:flutter/material.dart';
import 'package:tcc/components/menu_drawer.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
        centerTitle: true,
      ),
      drawer: MenuDrawer(),
      body: Padding(
        padding: EdgeInsets.all(10),
        
      ),
    );
  }
}
