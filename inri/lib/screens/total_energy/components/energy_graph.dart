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
  bool _showMin = false;
  bool _showMax = false;
  bool _showAverage = true;
  bool _showDeviation = false;
  bool _showValues = false;
  late ZoomPanBehavior _zoomPanBehavior;
  late List<_ChartData> _maxData;
  late List<_ChartData> _averageData;
  late List<_ChartData> _minData;
  late List<_ChartData> _deviationData;

  @override
  void initState() {
    _zoomPanBehavior = ZoomPanBehavior(
        enableDoubleTapZooming: true, enablePanning: true, enablePinching: true, enableSelectionZooming: true);
    _maxData = widget.energyData.map((e) => _ChartData(timeFormat.format(e.createdAt!), e.max!)).toList();
    _averageData = widget.energyData.map((e) => _ChartData(timeFormat.format(e.createdAt!), e.average!)).toList();
    _minData = widget.energyData.map((e) => _ChartData(timeFormat.format(e.createdAt!), e.min!)).toList();
    _deviationData = widget.energyData.map((e) => _ChartData(timeFormat.format(e.createdAt!), e.deviation!)).toList();
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
              const SizedBox(
                width: 8,
              ),
              ElevatedButton(
                  child: const Text('Max'),
                  style: _textStyle(_showMax),
                  onPressed: () => setState(() => _showMax = !_showMax)),
              const SizedBox(
                width: 8,
              ),
              ElevatedButton(
                  child: const Text('Min'),
                  style: _textStyle(_showMin),
                  onPressed: () => setState(() => _showMin = !_showMin)),
              const SizedBox(
                width: 8,
              ),
              ElevatedButton(
                  child: const Text('Average'),
                  style: _textStyle(_showAverage),
                  onPressed: () => setState(() => _showAverage = !_showAverage)),
              const SizedBox(
                width: 8,
              ),
              ElevatedButton(
                  child: const Text('Deviation'),
                  style: _textStyle(_showDeviation),
                  onPressed: () => setState(() => _showDeviation = !_showDeviation)),
              const SizedBox(
                width: 8,
              ),
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
                  if (_showAverage)
                    LineSeries<_ChartData, String>(
                      dataSource: _averageData,
                      xValueMapper: (_ChartData sales, _) => sales.date,
                      yValueMapper: (_ChartData sales, _) => sales.value,
                      color: kSecondaryColor,
                      name: 'Average',
                      dataLabelSettings: DataLabelSettings(isVisible: _showValues),
                    ),
                  if (_showMax)
                    LineSeries<_ChartData, String>(
                      dataSource: _maxData,
                      xValueMapper: (_ChartData sales, _) => sales.date,
                      yValueMapper: (_ChartData sales, _) => sales.value,
                      name: 'Max',
                      isVisible: _showMax,
                      color: Colors.red,
                      isVisibleInLegend: _showMax,
                      dataLabelSettings: DataLabelSettings(isVisible: _showValues),
                    ),
                  if (_showMin)
                    LineSeries<_ChartData, String>(
                      dataSource: _minData,
                      xValueMapper: (_ChartData sales, _) => sales.date,
                      yValueMapper: (_ChartData sales, _) => sales.value,
                      name: 'Min',
                      isVisible: _showMin,
                      isVisibleInLegend: _showMin,
                      color: Colors.orange,
                      dataLabelSettings: DataLabelSettings(isVisible: _showValues),
                    ),
                  LineSeries<_ChartData, String>(
                    dataSource: _deviationData,
                    xValueMapper: (_ChartData sales, _) => sales.date,
                    yValueMapper: (_ChartData sales, _) => sales.value,
                    name: 'Deviation',
                    isVisible: _showDeviation,
                    isVisibleInLegend: _showDeviation,
                    dataLabelSettings: DataLabelSettings(isVisible: _showValues),
                  ),
                ]),
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
