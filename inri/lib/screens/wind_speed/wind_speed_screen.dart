import 'package:flutter/material.dart';
import 'package:inri/components/all_data_tile.dart';
import 'package:inri/components/custom_card.dart';
import 'package:inri/components/custom_dropdown.dart';
import 'package:inri/components/custom_scaffold.dart';
import 'package:inri/components/loader.dart';
import 'package:inri/constants/data_type.dart';
import 'package:inri/models/wind_model.dart';
import 'package:inri/providers/all.dart';
import 'package:inri/screens/wind_speed/components/wind_graph.dart';
import 'package:provider/provider.dart';

class windSpeedScreen extends StatefulWidget {
  static const routeName = '/wind-speed-screen';

  const windSpeedScreen({Key? key}) : super(key: key);

  @override
  State<windSpeedScreen> createState() => _windSpeedScreenState();
}

class _windSpeedScreenState extends State<windSpeedScreen> {
  int _interval = 24;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Wind Speed',
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(8),
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
            Divider(),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: [
                const Text(
                  'Wind Speed Top',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                FutureBuilder<List<WindModel>>(
                  future: Provider.of<WindProvider>(context, listen: false).fetchTop(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState != ConnectionState.done)
                      return const Center(
                        child: Loader(),
                      );
                    return Column(
                      children: [
                        CustomCard(snapshot.data!.last, DataType.windLateral),
                        WindGraph(snapshot.data!
                            .getRange(snapshot.data!.length - _interval * 60, snapshot.data!.length)
                            .toList()),
                        const AllDataTile(
                          dataType: DataType.windTop,
                        )
                      ],
                    );
                  },
                ),
              ],
            ),
            const Divider(
              height: 1,
            ),
            const SizedBox(
              height: 10,
            ),
            Column(
              children: [
                const Text(
                  'Wind Speed Lateral',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                FutureBuilder<List<WindModel>>(
                    future: Provider.of<WindProvider>(context, listen: false).fetchLateral(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState != ConnectionState.done)
                        return const Center(
                          child: Loader(),
                        );
                      return Column(
                        children: [
                          CustomCard(snapshot.data!.last, DataType.windLateral),
                          WindGraph(snapshot.data!
                              .getRange(snapshot.data!.length - _interval * 60, snapshot.data!.length)
                              .toList()),
                          const AllDataTile(
                            dataType: DataType.windLateral,
                          ),
                        ],
                      );
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
