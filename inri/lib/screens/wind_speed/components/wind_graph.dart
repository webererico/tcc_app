import 'package:flutter/material.dart';
import 'package:inri/models/wind_model.dart';
import 'package:inri/utils/formatters/date_formater.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class WindGraph extends StatefulWidget {
  final List<WindModel> windData;
  const WindGraph(this.windData);

  @override
  _WindGraphState createState() => _WindGraphState();
}

class _WindGraphState extends State<WindGraph> {
  bool _showMin = false;
  bool _showMax = false;
  bool _showAverage = true;
  bool _showDeviation = true;
  bool _showValues = false;
  late List<_ChartData> _maxData;
  late List<_ChartData> _averageData;
  late List<_ChartData> _minData;
  late List<_ChartData> _deviationData;

  @override
  void initState() {
    _maxData = widget.windData.map((e) => _ChartData(timeFormat.format(e.createdAt!), e.max!)).toList();
    _averageData = widget.windData.map((e) => _ChartData(timeFormat.format(e.createdAt!), e.average!)).toList();
    _minData = widget.windData.map((e) => _ChartData(timeFormat.format(e.createdAt!), e.min!)).toList();
    _deviationData = widget.windData.map((e) => _ChartData(timeFormat.format(e.createdAt!), e.deviation!)).toList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: 8,
            ),
            ElevatedButton(
                child: const Text('Max'), style: _textStyle, onPressed: () => setState(() => _showMax = !_showMax)),
            const SizedBox(
              width: 8,
            ),
            ElevatedButton(
                child: const Text('Min'), style: _textStyle, onPressed: () => setState(() => _showMin = !_showMin)),
            const SizedBox(
              width: 8,
            ),
            ElevatedButton(
                child: const Text('Average'),
                style: _textStyle,
                onPressed: () => setState(() => _showAverage = !_showAverage)),
            const SizedBox(
              width: 8,
            ),
            ElevatedButton(
                child: const Text('Deviation'),
                style: _textStyle,
                onPressed: () => setState(() => _showDeviation = !_showDeviation)),
            const SizedBox(
              width: 8,
            ),
            ElevatedButton(
                child: const Text('Show values'),
                style: _textStyle,
                onPressed: () => setState(() => _showValues = !_showValues)),
          ],
        ),
        Container(
          height: 150,
          child: SfCartesianChart(
              primaryXAxis: CategoryAxis(),
              tooltipBehavior: TooltipBehavior(enable: true),
              series: <ChartSeries<_ChartData, String>>[
                LineSeries<_ChartData, String>(
                  dataSource: _averageData,
                  xValueMapper: (_ChartData sales, _) => sales.date,
                  yValueMapper: (_ChartData sales, _) => sales.value,
                  name: 'Average',
                  isVisible: _showAverage,
                  isVisibleInLegend: _showAverage,
                  dataLabelSettings: DataLabelSettings(isVisible: _showValues),
                ),
                LineSeries<_ChartData, String>(
                  dataSource: _maxData,
                  xValueMapper: (_ChartData sales, _) => sales.date,
                  yValueMapper: (_ChartData sales, _) => sales.value,
                  name: 'Max',
                  isVisible: _showMax,
                  isVisibleInLegend: _showMax,
                  dataLabelSettings: DataLabelSettings(isVisible: _showValues),
                ),
                LineSeries<_ChartData, String>(
                  dataSource: _minData,
                  xValueMapper: (_ChartData sales, _) => sales.date,
                  yValueMapper: (_ChartData sales, _) => sales.value,
                  name: 'Min',
                  isVisible: _showMin,
                  isVisibleInLegend: _showMin,
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
    );
  }
}

class _ChartData {
  _ChartData(this.date, this.value);
  final String date;
  final double value;
}

get _textStyle => ButtonStyle(textStyle: MaterialStateProperty.all(const TextStyle(color: Colors.white, fontSize: 10)));
