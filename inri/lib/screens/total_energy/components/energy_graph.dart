import 'package:flutter/material.dart';
import 'package:inri/constants/colors.dart';
import 'package:inri/models/total_energy_model.dart';
import 'package:inri/utils/formatters/date_formater.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class EnergyGraph extends StatefulWidget {
  final List<TotalEnergyModel> energyData;
  const EnergyGraph(this.energyData);

  @override
  _EnergyGraphState createState() => _EnergyGraphState();
}

class _EnergyGraphState extends State<EnergyGraph> {
  bool _showValues = false;
  late ZoomPanBehavior _zoomPanBehavior;
  late List<_ChartData> _averageData;

  @override
  void initState() {
    _zoomPanBehavior = ZoomPanBehavior(
        enableDoubleTapZooming: true, enablePanning: true, enablePinching: true, enableSelectionZooming: true);
    _averageData = widget.energyData.map((e) => _ChartData(timeFormat.format(e.createdAt!), e.value!)).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  child: const Text('Show values'),
                  style: _textStyle(_showValues),
                  onPressed: () => setState(() => _showValues = !_showValues)),
            ],
          ),
          Container(
            height: 350,
            child: SfCartesianChart(
              zoomPanBehavior: _zoomPanBehavior,
              primaryXAxis: CategoryAxis(),
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <ChartSeries<_ChartData, String>>[
                  LineSeries<_ChartData, String>(
                    dataSource: _averageData,
                    xValueMapper: (_ChartData sales, _) => sales.date,
                    yValueMapper: (_ChartData sales, _) => sales.value,
                    color: kSecondaryColor,
                    name: 'Average',
                    dataLabelSettings: DataLabelSettings(isVisible: _showValues),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ChartData {
  _ChartData(this.date, this.value);
  final String date;
  final double value;
}

ButtonStyle _textStyle(bool pressed) {
  return ElevatedButton.styleFrom(
      primary: pressed ? kSecondaryColor : kSecondaryColor.withOpacity(0.3),
      padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 0),
      textStyle: const TextStyle(color: Colors.white, fontSize: 10));
}
