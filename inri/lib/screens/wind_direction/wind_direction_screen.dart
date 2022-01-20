import 'package:flutter/material.dart';
import 'package:inri/components/all_data_tile.dart';
import 'package:inri/components/custom_scaffold.dart';
import 'package:inri/constants/data_type.dart';

class WindDirectionScreen extends StatelessWidget {
  static const routeName = '/wind-speed-direction-screen';

  const WindDirectionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Wind Direction',
      body: Container(
        child: Column(
          children:  [
           const AllDataTile(dataType: DataType.windDirection)
          ],
        ),
      ),
    );
  }
}
