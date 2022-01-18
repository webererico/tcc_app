import 'package:flutter/material.dart';
import 'package:inri/components/custom_scaffold.dart';
import 'package:inri/components/loader.dart';
import 'package:inri/constants/data_type.dart';
import 'package:inri/providers/all.dart';
import 'package:inri/providers/dashboard_provider.dart';
import 'package:inri/utils/formatters/date_formater.dart';
import 'package:provider/provider.dart';

class AllDataScreen extends StatelessWidget {
  static const routeNamed = '/all-data-screen';

  const AllDataScreen();

  @override
  Widget build(BuildContext context) {
    DataType _dataType = Provider.of<DashboardProvider>(context, listen: false).dataType;
    return CustomScaffold(
      title: _dataType.title,
      body: Container(
        child: FutureBuilder<List<dynamic>>(
            future: _getData(context, _dataType),
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) return const Center(child: Loader());
              return ListView.builder(
                shrinkWrap: true,
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  final dynamic value = snapshot.data!.elementAt(index);
                  return ListTile(
                    onTap: () => _showMyDialog(context, value, _dataType) ,
                    title: Text('Average: ${value.average} ${_dataType.unit}'),
                    subtitle: Text('Max: ${value.max} Min: ${value.min}'),
                    trailing: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text('Date:'),
                        Text(dateFormat.format(value.createdAt)),
                      ],
                    ),
                  );
                },
              );
            }),
      ),
    );
  }
}

Future<List> _getData(BuildContext context, DataType dataType) {
  switch (dataType) {
    case DataType.battery:
      return Provider.of<BatteryVoltageProvider>(context, listen: false).fetchBatteryVoltage();
    case DataType.power:
      return Provider.of<MeasuredPowerProvider>(context, listen: false).fetchPower();
    case DataType.totalEnergy:
      return Provider.of<TotalEnergyProvider>(context, listen: false).fetchTotalEnergy();
    case DataType.windLateral:
      return Provider.of<WindProvider>(context, listen: false).fetchLateral();
    case DataType.windTop:
      return Provider.of<WindProvider>(context, listen: false).fetchTop();
    case DataType.windDirection:
      return Provider.of<WindProvider>(context, listen: false).fetchDirection();
  }
}

Future<void> _showMyDialog(BuildContext context, dynamic value, DataType dataType) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Saved at: \n${dateFormat.format(value.createdAt)}'),
        content: SingleChildScrollView(
          child: ListBody(
            children:  <Widget>[
              Text('Average: ${value.average} ${dataType.unit}'),
              Text('Deviation: ${value.deviation} ${dataType.unit}'),
              Text('Max: ${value.max} ${dataType.unit}'),
              Text('Min: ${value.min} ${dataType.unit}'),
              // Text('Number of reads: ${value.count}'),
              const Text('Status: Working normal')
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('OK', style: TextStyle(color: Colors.white),),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
