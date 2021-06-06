import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tcc/pages/main/main_screen.dart';
import 'package:tcc/pages/profile/profile_screen.dart';
import 'package:tcc/providers/auth.dart';

class MenuDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Drawer Header'),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Início'),
            onTap: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => MainScreen())),
          ),
          ExpansionTile(
            leading: Icon(Icons.speed),
            title: Text('Vento'),
            children: [
              ListTile(
                title: Text('Velocidade do vento'),
                onTap: () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => MainScreen())),
              ),
              ListTile(
                title: Text('Direção do vento'),
                onTap: () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => MainScreen())),
              ),
            ],
          ),
          ListTile(
            leading: Icon(Icons.battery_charging_full),
            title: Text('Tensão da bateria'),
            onTap: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => MainScreen())),
          ),
          ExpansionTile(
            leading: Icon(Icons.electrical_services_rounded),
            title: Text('Energia'),
            children: [
              ListTile(
                title: Text('Energia gerada'),
                onTap: () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => MainScreen())),
              ),
              ListTile(
                title: Text('Energia Acumulada'),
                onTap: () => Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => MainScreen())),
              ),
            ],
          ),
          ListTile(
            leading: Icon(Icons.nature),
            title: Text('Contribuição social'),
            onTap: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => MainScreen())),
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Editar perfil'),
            onTap: () => Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => ProfileScreen())),
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Sair do aplicativo'),
            onTap: () => Provider.of<Auth>(context).logout(),
          ),
        ],
      ),
    );
  }
}
