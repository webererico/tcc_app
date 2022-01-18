import 'package:flutter/material.dart';
import 'package:inri/components/all_data_tile.dart';
import 'package:inri/components/custom_scaffold.dart';
import 'package:inri/constants/data_type.dart';

class TotalEnergyScreen extends StatelessWidget {
  static const routeName = '/total-energy-screen';

  const TotalEnergyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Cumulated Total Energy',
      body: Container(
        child: Column(
          children: [
            const AllDataTile(dataType: DataType.totalEnergy,)
          ],
        ),
      ),
    );
  }
}
