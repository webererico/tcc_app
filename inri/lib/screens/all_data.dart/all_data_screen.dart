import 'package:collection/collection.dart';
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
            var _groupList = groupBy(snapshot.data!, (dynamic obj) => formatter.format(obj.createdAt));

            return ListView.builder(
              primary: false,
              shrinkWrap: true,
              itemCount: _groupList.keys.length,
              itemBuilder: (context, index) {
                final MapEntry<String, List<dynamic>> _map = _groupList.entries.elementAt(index);
                return ExpansionTile(
                  title: Text(formatDate.format(DateTime.parse(_map.key))),
                  children: [
                    ListView.builder(
                      physics: const ClampingScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: _map.value.length,
                      itemBuilder: (context, index) {
                        final dynamic _data = _map.value.elementAt(index);
                        Text _title() => _dataType == DataType.totalEnergy
                            ? Text('${_data.value} ${_dataType.unit}')
                            : Text('${_data.average} ${_dataType.unit}');
                        return ListTile(
                          onTap: () => _showMyDialog(context, _data, _dataType),
                          title: _title(),
                          subtitle: _dataType == DataType.totalEnergy
                              ? null
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        'Max: ${_data.max.toStringAsPrecision(3)} Min: ${_data.min.toStringAsPrecision(3)}'),
                                    Text('Deviation: ${_data.deviation.toStringAsPrecision(3)} ${_dataType.unit}'),
                                  ],
                                ),
                          trailing: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text('Date:'),
                              Text(dateFormatWithSpace.format(_data.createdAt)),
                            ],
                          ),
                        );
                      },
                    )
                  ],
                );
              },
            );
          },
        ),
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
    default:
      return Future.delayed(const Duration(seconds: 1), () => []);
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
              children: dataType == DataType.totalEnergy
                  ? [
                      Text('Average: ${value.value} ${dataType.unit}'),
                      const Text('Status: Working normal'),
                    ]
                  : [
                      Text('Average: ${value.average} ${dataType.unit}'),
                      Text('Deviation: ${value.deviation} ${dataType.unit}'),
                      Text('Max: ${value.max} ${dataType.unit}'),
                      Text('Min: ${value.min} ${dataType.unit}'),
                      const Text('Status: Working normal')
                    ]),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text(
              'OK',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
