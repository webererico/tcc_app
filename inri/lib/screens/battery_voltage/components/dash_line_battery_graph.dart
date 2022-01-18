/// Dash pattern line chart example
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:inri/models/battery_voltage_model.dart';

/// Example of a line chart rendered with dash patterns.
class DashPatternLineChart extends StatelessWidget {
  final List<BatteryVoltageModel> data;
  final bool animate;

  const DashPatternLineChart({required this.data, this.animate = true});

  // /// Creates a [LineChart] with sample data and no transition.
  // factory DashPatternLineChart.withSampleData() {
  //   return DashPatternLineChart(
  //     _createSampleData(),
  //     // Disable animations for image tests.
  //     animate: true,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return charts.LineChart(
      _createSampleData(data),
      animate: animate,
    );
  }

  static List<charts.Series<LinearData, int>> _createSampleData(List<BatteryVoltageModel> data) {
    final maxData =
        data.map((element) => LinearData(data.indexOf(element), element.max!.toInt(), element.createdAt!)).toList();
    final minData =
        data.map((element) => LinearData(data.indexOf(element), element.min!.toInt(), element.createdAt!)).toList();
    final averageData =
        data.map((element) => LinearData(data.indexOf(element), element.average!.toInt(), element.createdAt!)).toList();

    return [
      charts.Series<LinearData, int>(
        id: 'max',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (LinearData coordinates, _) => coordinates.x,
        measureFn: (LinearData coordinates, _) => coordinates.y,
        data: maxData,
      ),
      charts.Series<LinearData, int>(
        id: 'min',
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        domainFn: (LinearData coordinates, _) => coordinates.x,
        measureFn: (LinearData coordinates, _) => coordinates.y,
        data: minData,
      ),
      charts.Series<LinearData, int>(
        id: 'average',
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        domainFn: (LinearData coordinates, _) => coordinates.x,
        measureFn: (LinearData coordinates, _) => coordinates.y,
        
        data: averageData,
      )
    ];
  }
}

class LinearData {
  int x;
  int y;
  DateTime date;
  LinearData(this.x, this.y, this.date);
}
