import 'package:flutter/material.dart';
import 'package:inri/constants/colors.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Wind extends StatelessWidget {
  final double lateralSpeed;
  final double topSpeed;
  const Wind({required this.lateralSpeed, required this.topSpeed});

  @override
  Widget build(BuildContext context) {
    double bigger = lateralSpeed > topSpeed ? lateralSpeed : topSpeed;
    return Center(
        child: Row(
      children: [
        Expanded(
          flex: 8,
          child: Container(
            margin: const EdgeInsets.all(20),
            child: SfLinearGauge(
              maximum: bigger + 5,
              animateAxis: true,
              animateRange: true,
              showLabels: true,
              ranges: [
                LinearGaugeRange(
                  startValue: 0,
                  endValue: lateralSpeed,
                ),
              ],
              markerPointers: [
                LinearShapePointer(
                  value: lateralSpeed,
                ),
              ],
              barPointers: [
                LinearBarPointer(
                  value: topSpeed,
                  color: kSuccess,
                )
              ],
            ),
          ),
        ),
        Expanded(
            flex: 2,
            child: Column(
              children: [
                Text(
                  lateralSpeed.toString() + ' m/s',
                  style: const TextStyle(color: kError),
                ),
                Text(
                  topSpeed.toString() + ' m/s',
                  style: const TextStyle(color: kSuccess),
                ),
              ],
            ))
      ],
    ));
  }
}
