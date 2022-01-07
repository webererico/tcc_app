import 'package:flutter/material.dart';
import 'package:inri/components/custom_scaffold.dart';

class WindSpeedTopScreen extends StatelessWidget {
    static const routeName = '/wind-speed-top-screen';

  const WindSpeedTopScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Wind Speed Top',
      body: Container(),
    );
  }
}