import 'package:flutter/material.dart';
import 'package:inri/components/custom_scaffold.dart';

class MeasuredPowerScreen extends StatelessWidget {
  static const routeName = '/measured-power-screen';

  const MeasuredPowerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Measured Power',
      body: Container(),
    );
  }
}
