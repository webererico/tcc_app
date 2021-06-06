import 'package:flutter/material.dart';
import 'package:tcc/components/menu_drawer.dart';

class SocialScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contribuição social'),
        centerTitle: true,
      ),
      drawer: MenuDrawer(),
      body: Column(
        children: [
         ExpansionTile(title: Text('Redução de CO2'),
          children: [
            ListTile(
              leading: Icon(Icons.electrical_services_rounded),
              title: Text('2362 KG'),
            )
          ],
         ) 
        ],
      ),
      
    );
  }
}

