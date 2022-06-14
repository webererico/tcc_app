import 'package:flutter/material.dart';
import 'package:inri/constants/colors.dart';
import 'package:inri/models/wind_model.dart';
import 'package:inri/utils/formatters/date_formater.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DirectionGraph extends StatefulWidget {
  final List<WindModel> data;
  const DirectionGraph(this.data);

  @override
  _DirectionGraphState createState() => _DirectionGraphState();
}

class _DirectionGraphState extends State<DirectionGraph> {
  bool _showAverage = true;
  late ZoomPanBehavior _zoomPanBehavior;
  late List<_ChartData> _averageData;

  @override
  void initState() {
    _zoomPanBehavior = ZoomPanBehavior(
        enableDoubleTapZooming: true, enablePanning: true, enablePinching: true, enableSelectionZooming: true);
    _averageData = widget.data.map((e) => _ChartData(timeFormat.format(e.createdAt!), e.average!)).toList();
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
                  child: const Text('Average'),
                  style: _textStyle(_showAverage),
                  onPressed: () => setState(() => _showAverage = !_showAverage)),
              const SizedBox(
                width: 8,
              ),
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
                      dataLabelSettings: const DataLabelSettings(isVisible: false),
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
