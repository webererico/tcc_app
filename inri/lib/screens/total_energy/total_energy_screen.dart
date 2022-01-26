import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:inri/components/all_data_tile.dart';
import 'package:inri/components/custom_card.dart';
import 'package:inri/components/custom_dropdown.dart';
import 'package:inri/components/custom_scaffold.dart';
import 'package:inri/components/loader.dart';
import 'package:inri/constants/colors.dart';
import 'package:inri/constants/data_type.dart';
import 'package:inri/models/total_energy_model.dart';
import 'package:inri/providers/total_energy_provider.dart';
import 'package:inri/screens/total_energy/components/energy_graph.dart';
import 'package:provider/provider.dart';

class TotalEnergyScreen extends StatefulWidget {
  static const routeName = '/total-energy-screen';

  const TotalEnergyScreen({Key? key}) : super(key: key);

  @override
  State<TotalEnergyScreen> createState() => _TotalEnergyScreenState();
}

class _TotalEnergyScreenState extends State<TotalEnergyScreen> {
  int _interval = 24;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Total Energy',
      body: Container(
        padding: const EdgeInsets.all(10),
        child: FutureBuilder<List<TotalEnergyModel>>(
          future: Provider.of<TotalEnergyProvider>(context, listen: false).fetchTotalEnergy(),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done)
              return const Center(
                child: Loader(),
              );
            return Column(
              children: [
                CustomDropdown(
                  _interval.toString(),
                  const ['24', '12', '6', '3', '1'],
                  (value) {
                    setState(() => _interval = int.parse(value!));
                  },
                  'Interval in hours',
                ),
                const SizedBox(
                  height: 10,
                ),
                CustomCard(
                  snapshot.data!.last,
                  DataType.totalEnergy,
                  leading: const FaIcon(
                    FontAwesomeIcons.bolt,
                    color: kSecondaryColor,
                  ),
                ),
                EnergyGraph(snapshot.data!.getRange(snapshot.data!.length - _interval*60, snapshot.data!.length).toList()),
                const AllDataTile(
                  dataType: DataType.totalEnergy,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
