import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tcc/components/menu_drawer.dart';
import 'package:tcc/services/weather.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tela principal'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              height: 100,
              child: FutureBuilder(
                future: Provider.of<Weather>(context).getWeather(city, country),
                builder: builder),
            )
          ],
        ),
      ),
      drawer: MenuDrawer(),
    );
  }
}
