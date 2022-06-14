import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:inri/components/all_data_tile.dart';
import 'package:inri/components/custom_card.dart';
import 'package:inri/components/custom_dropdown.dart';
import 'package:inri/components/custom_scaffold.dart';
import 'package:inri/components/loader.dart';
import 'package:inri/constants/colors.dart';
import 'package:inri/constants/data_type.dart';
import 'package:inri/models/power_model.dart';
import 'package:inri/providers/measured_power_provider.dart';
import 'package:inri/screens/measured_power/components/power_graph.dart';
import 'package:provider/provider.dart';

class MeasuredPowerScreen extends StatefulWidget {
  static const routeName = '/measured-power-screen';

  const MeasuredPowerScreen({Key? key}) : super(key: key);

  @override
  State<MeasuredPowerScreen> createState() => _MeasuredPowerScreenState();
}

class _MeasuredPowerScreenState extends State<MeasuredPowerScreen> {
  int _interval = 24;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Measured Power',
      body: FutureBuilder<List<PowerModel>>(
          future: Provider.of<MeasuredPowerProvider>(context, listen: false).fetchPower(),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) return const Center(child: Loader());
            return Container(
              padding: const EdgeInsets.all(10),
              child: Column(
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
                    DataType.power,
                    leading: const FaIcon(
                      FontAwesomeIcons.plug,
                      color: kSecondaryColor,
                    ),
                  ),
                  PowereGraph(
                      snapshot.data!.getRange(snapshot.data!.length - _interval * 60, snapshot.data!.length).toList()),
                  const AllDataTile(dataType: DataType.power),
                ],
              ),
            );
          }),
    );
  }
}
