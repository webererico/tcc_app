import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:inri/components/all_data_tile.dart';
import 'package:inri/components/custom_card.dart';
import 'package:inri/components/custom_scaffold.dart';
import 'package:inri/components/loader.dart';
import 'package:inri/constants/colors.dart';
import 'package:inri/constants/data_type.dart';
import 'package:inri/models/battery_voltage_model.dart';
import 'package:inri/providers/all.dart';
import 'package:inri/screens/battery_voltage/components/battery_graph.dart';
import 'package:provider/provider.dart';

class BatteryVoltageScreen extends StatelessWidget {
  static const routeNamed = '/battery-voltage-screen';

  const BatteryVoltageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Battery Voltage',
      body: FutureBuilder<List<BatteryVoltageModel>>(
        future: Provider.of<BatteryVoltageProvider>(context, listen: false).fetchBatteryVoltage(),
        builder: (context, snapshot) {
          if (snapshot.connectionState != ConnectionState.done) return const Center(child: Loader());
          return Container(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Column(
              children: [
                CustomCard(snapshot.data!.last, DataType.battery, leading: const FaIcon(FontAwesomeIcons.carBattery, color: kPrimaryColor,),),
                const SizedBox(height: 10,),
                BatteryGraph(snapshot.data!),
                const AllDataTile(dataType: DataType.battery)
              ],
            ),
          );
        },
      ),
    );
  }
}
