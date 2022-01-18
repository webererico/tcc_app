import 'package:flutter/material.dart';
import 'package:inri/components/all_data_tile.dart';
import 'package:inri/components/custom_scaffold.dart';
import 'package:inri/components/loader.dart';
import 'package:inri/constants/colors.dart';
import 'package:inri/constants/data_type.dart';
import 'package:inri/models/power_model.dart';
import 'package:inri/providers/measured_power_provider.dart';
import 'package:inri/screens/measured_power/components/power_graph.dart';
import 'package:inri/utils/formatters/date_formater.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class MeasuredPowerScreen extends StatefulWidget {
  static const routeName = '/measured-power-screen';

  const MeasuredPowerScreen({Key? key}) : super(key: key);

  @override
  State<MeasuredPowerScreen> createState() => _MeasuredPowerScreenState();
}

class _MeasuredPowerScreenState extends State<MeasuredPowerScreen> {
  late List<_ChartData> data;
  late TooltipBehavior _tooltip;
  @override
  void initState() {
    data = [
      _ChartData(dateFormat.format(DateTime.now()), 12),
      _ChartData('GER', 15),
      _ChartData('RUS', 30),
      _ChartData('BRZ', 6.4),
      _ChartData('IND', 14)
    ];
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Measured Power',
      body: FutureBuilder<List<PowerModel>>(
          future: Provider.of<MeasuredPowerProvider>(context, listen: false).fetchPower(),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) return const Center(child: Loader());
            return Container(
              child: Column(
                children: [PowerGraph(snapshot.data!), const AllDataTile(dataType: DataType.power)],
              ),
            );
          }),
    );
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}
