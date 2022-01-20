import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:inri/components/all_data_tile.dart';
import 'package:inri/components/custom_card.dart';
import 'package:inri/components/custom_scaffold.dart';
import 'package:inri/components/loader.dart';
import 'package:inri/constants/colors.dart';
import 'package:inri/constants/data_type.dart';
import 'package:inri/models/total_energy_model.dart';
import 'package:inri/providers/total_energy_provider.dart';
import 'package:inri/screens/total_energy/components/energy_graph.dart';
import 'package:provider/provider.dart';

class TotalEnergyScreen extends StatelessWidget {
  static const routeName = '/total-energy-screen';

  const TotalEnergyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Cumulated Total Energy',
      body: Container(
        child: FutureBuilder<List<TotalEnergyModel>>(
            future: Provider.of<TotalEnergyProvider>(context, listen: false).fetchTotalEnergy(),
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done)
                return const Center(
                  child: Loader(),
                );
              return Column(
                children: [
                  CustomCard(
                    snapshot.data!.last,
                    leading: const FaIcon(
                      FontAwesomeIcons.bolt,
                      color: kSecondaryColor,
                    ),
                  ),
                  EnergyGraph(snapshot.data!),
                  const AllDataTile(
                    dataType: DataType.totalEnergy,
                  ),
                ],
              );
            }),
      ),
    );
  }
}
