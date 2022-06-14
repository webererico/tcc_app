import 'package:flutter/material.dart';
import 'package:inri/constants/colors.dart';
import 'package:inri/models/total_energy_model.dart';
import 'package:inri/utils/formatters/date_formater.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class EnergyBarChart extends StatefulWidget {
  final List<TotalEnergyModel> energyData;
  const EnergyBarChart(this.energyData);

  @override
  State<EnergyBarChart> createState() => _EnergyBarChartState();
}

class _EnergyBarChartState extends State<EnergyBarChart> {
  bool _showValues = false;
  late ZoomPanBehavior _zoomPanBehavior;
  late List<_ChartData> _averageData;

  @override
  void initState() {
    _zoomPanBehavior = ZoomPanBehavior(
        enableDoubleTapZooming: true, enablePanning: true, enablePinching: true, enableSelectionZooming: true);
    _averageData =
        widget.energyData.map((e) => _ChartData(timeFormat.format(e.createdAt!), nextValue(e) - e.value!)).toList();
    _averageData.removeAt(0);
    super.initState();
  }

  double nextValue(TotalEnergyModel e) {
    try {
      int _index = widget.energyData.indexOf(e);
      if (_index == widget.energyData.length) return 0;
      return widget.energyData.elementAt(_index + 1).value!;
    } on RangeError {
      return widget.energyData.last.value!;
    }
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
              series: <ChartSeries>[
                HistogramSeries<_ChartData, String>(
                  dataSource: _averageData,
                  yValueMapper: (_ChartData sales, _) {
                    return sales.value;
                  },
                  binInterval: 10,
                  spacing: 10,
                  showNormalDistributionCurve: true,
                  curveColor: const Color.fromRGBO(192, 108, 132, 1),
                  borderWidth: 10,
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
