import 'package:flutter/material.dart';
import 'package:inri/components/all_data_tile.dart';
import 'package:inri/components/custom_container.dart';
import 'package:inri/components/custom_scaffold.dart';
import 'package:inri/components/loader.dart';
import 'package:inri/constants/data_type.dart';
import 'package:inri/constants/theme.dart';
import 'package:inri/models/battery_voltage_model.dart';
import 'package:inri/providers/all.dart';
import 'package:inri/screens/battery_voltage/components/graph.dart';
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
            if (snapshot.connectionState != ConnectionState.done)
              return const Center(
                child: Loader(),
              );
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 10),
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: GestureDetector(
                        child: const CustomContainer(
                          label: 'Interval',
                          text: '',
                        ),
                        onTap: () async => _dataPicker(context),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 7,
                    child:

                        //  DashPatternLineChart(
                        //   data: snapshot.data!,
                        // ),
                        // BatteryGraph(snapshot.data!),
                        BatteryGraph(),
                  ),
                  const AllDataTile(
                    dataType: DataType.battery,
                  )
                ],
              ),
            );
          }),
    );
  }
}

_dataPicker(BuildContext context) async {
  DateTimeRange? _dateTimeRange = await showDateRangePicker(
    context: context,
    firstDate: DateTime(2000),
    lastDate: DateTime.now(),
    cancelText: 'Cancelar',
    saveText: 'Buscar',
    builder: (context, child) {
      return Theme(
        data: theme,
        child: child!,
      );
    },
  );
  if (_dateTimeRange != null) {}
}
