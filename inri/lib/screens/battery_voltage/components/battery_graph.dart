import 'package:flutter/material.dart';
import 'package:inri/components/custom_dropdown.dart';
import 'package:inri/constants/colors.dart';
import 'package:inri/models/battery_voltage_model.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BatteryGraph extends StatefulWidget {
  final List<BatteryVoltageModel> batteryData;
  const BatteryGraph(this.batteryData);

  @override
  _BatteryGraphState createState() => _BatteryGraphState();
}

class _BatteryGraphState extends State<BatteryGraph> {
  late ZoomPanBehavior _zoomPanBehavior;
  int _interval = 24;
  List<_StepAreaData>? chartData;

  @override
  void initState() {
    getData();
    _zoomPanBehavior = ZoomPanBehavior(
        enableDoubleTapZooming: true, enablePanning: true, enablePinching: true, enableSelectionZooming: true);
    super.initState();
  }

  getData() {
    chartData = widget.batteryData
        .getRange(1440 - _interval * 10, 1440)
        .map((e) => _StepAreaData(e.createdAt!, e.max!, e.min!, e.average!))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomDropdown(
          _interval.toString(),
          const ['24', '12', '6', '3', '1'],
          (value) {
            setState(() => _interval = int.parse(value!));
            getData();
          },
          'Interval in hours',
        ),
        const SizedBox(height: 10),
        Container(
          child: _buildStepAreaChart(),
          height: 350,
        )
      ],
    );
  }

  /// Returns the cartesian step area chart.
  SfCartesianChart _buildStepAreaChart() {
    return SfCartesianChart(
      legend: Legend(isVisible: true, position: LegendPosition.top),
      plotAreaBorderWidth: 0,
      zoomPanBehavior: _zoomPanBehavior,
      primaryXAxis: DateTimeAxis(
          majorGridLines: const MajorGridLines(width: 1),
          edgeLabelPlacement: EdgeLabelPlacement.shift,
          dateFormat: DateFormat('hh:mm'),
          labelFormat: '{value}'),
      primaryYAxis: NumericAxis(
          labelFormat: '{value}',
          interval: 1,
          maximum: 16,
          axisLine: const AxisLine(width: 0),
          majorTickLines: const MajorTickLines(size: 0)),
      series: _getStepAreaSeries(),
      tooltipBehavior: TooltipBehavior(enable: true),
    );
  }

  /// Returns the list of chart series
  /// which need to render on teh step area chart.
  List<ChartSeries<_StepAreaData, DateTime>> _getStepAreaSeries() {
    return <ChartSeries<_StepAreaData, DateTime>>[
      StepAreaSeries<_StepAreaData, DateTime>(
        dataSource: chartData!,
        color: const Color.fromRGBO(75, 135, 185, 0.6),
        borderColor: const Color.fromRGBO(75, 135, 185, 1),
        borderWidth: 2,
        name: 'Max',
        xValueMapper: (_StepAreaData data, _) => data.x,
        yValueMapper: (_StepAreaData data, _) => data.max,
      ),
      StepAreaSeries<_StepAreaData, DateTime>(
        dataSource: chartData!,
        borderColor: const Color.fromRGBO(192, 108, 132, 1),
        color: const Color.fromRGBO(192, 108, 132, 0.6),
        borderWidth: 2,
        name: 'Min',
        xValueMapper: (_StepAreaData data, _) => data.x,
        yValueMapper: (_StepAreaData data, _) => data.min,
      ),
      StepAreaSeries<_StepAreaData, DateTime>(
        dataSource: chartData!,
        borderColor: kPrimaryColor,
        color: kPrimaryColor.withOpacity(0.6),
        borderWidth: 2,
        name: 'Average',
        xValueMapper: (_StepAreaData data, _) => data.x,
        yValueMapper: (_StepAreaData data, _) => data.average,
      )
    ];
  }

  @override
  void dispose() {
    chartData!.clear();
    super.dispose();
  }
}

/// Private class for storing the step area chart data point.
class _StepAreaData {
  _StepAreaData(this.x, this.max, this.min, this.average);
  final DateTime x;
  final double max;
  final double average;
  final double min;
}
