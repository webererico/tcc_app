import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Wind extends StatelessWidget {
  const Wind({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(20),
        child: SfLinearGauge(
          animateAxis: true,
          animateRange: true,
          showLabels: true,
          ranges: const [
            LinearGaugeRange(
              startValue: 0,
              endValue: 50,
            ),
          ],
          markerPointers: const [
            LinearShapePointer(
              value: 50,
            ),
          ],
          barPointers: const [LinearBarPointer(value: 80)],
        ),
      ),
    );
  }
}
