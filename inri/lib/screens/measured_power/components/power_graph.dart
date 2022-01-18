import 'package:flutter/material.dart';
import 'package:inri/constants/colors.dart';
import 'package:inri/models/power_model.dart';
import 'package:inri/utils/formatters/date_formater.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class PowerGraph extends StatefulWidget {
  final List<PowerModel> data;
  const PowerGraph(this.data);

  @override
  State<PowerGraph> createState() => _PowerGraphState();
}

class _PowerGraphState extends State<PowerGraph> {
  late List<_ChartData> _maxData;
  late List<_ChartData> _minData;
  late List<_ChartData> _averageData;
  late TooltipBehavior _tooltip;
  @override
  void initState() {
    _maxData =
        widget.data.map((e) => _ChartData(dateFormat.format(e.createdAt!), e.max!)).toList().getRange(0, 5).toList();
    _minData =
        widget.data.map((e) => _ChartData(dateFormat.format(e.createdAt!), e.min!)).toList().getRange(0, 5).toList();
    _averageData = widget.data
        .map((e) => _ChartData(dateFormat.format(e.createdAt!), e.average!))
        .toList()
        .getRange(0, 5)
        .toList();
    _tooltip = TooltipBehavior(enable: true);
    super.initState();
  }

  get bigInMax {
    double bigger = _maxData.first.y;
    _maxData.forEach((element) {
      if (element.y > bigger) bigger = element.y;
    });
    return bigger;
  }

  @override
  Widget build(BuildContext context) {
    return SfCartesianChart(
        primaryXAxis: CategoryAxis(),
        primaryYAxis: NumericAxis(minimum: 0, maximum: bigInMax + 5, interval: 10),
        tooltipBehavior: _tooltip,
        series: <ChartSeries<_ChartData, String>>[
          ColumnSeries<_ChartData, String>(
              dataSource: _minData,
              xValueMapper: (_ChartData data, _) => data.x,
              yValueMapper: (_ChartData data, _) => data.y,
              name: 'Min',
              color: kPrimaryColor),
          ColumnSeries<_ChartData, String>(
              dataSource: _averageData,
              xValueMapper: (_ChartData data, _) => data.x,
              yValueMapper: (_ChartData data, _) => data.y,
              name: 'Average',
              color: kSecondaryColor),
          ColumnSeries<_ChartData, String>(
              dataSource: _maxData,
              xValueMapper: (_ChartData data, _) => data.x,
              yValueMapper: (_ChartData data, _) => data.y,
              name: 'Max',
              color: kPrimaryColor.withOpacity(0.4)),
        ]);
  }
}

class _ChartData {
  _ChartData(this.x, this.y);

  final String x;
  final double y;
}
