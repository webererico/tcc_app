import 'package:flutter/material.dart';
import 'package:inri/constants/colors.dart';
import 'package:inri/screens/battery_voltage/battery_voltage_screen.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Gauge extends StatelessWidget {
  const Gauge({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).pushReplacementNamed(BatteryVoltageScreen.routeNamed),
      child: Center(
        child: Column(
          children: [
            Container(
              width: 200,
              height: 140,
              child: SfRadialGauge(
                title: const GaugeTitle(text: 'Battery Voltage', textStyle: TextStyle(fontSize: 14)),
                enableLoadingAnimation: true,
                axes: <RadialAxis>[
                  RadialAxis(
                    minimum: 0,
                    maximum: 150,
                    ranges: <GaugeRange>[
                      GaugeRange(
                        startValue: 0,
                        endValue: 50,
                        color: Colors.green,
                      ),
                      GaugeRange(startValue: 50, endValue: 100, color: Colors.orange),
                      GaugeRange(startValue: 100, endValue: 150, color: Colors.red),
                    ],
                    pointers: <GaugePointer>[
                      NeedlePointer(
                        value: 100,
                        needleLength: 0.7,
                        needleStartWidth: 1,
                        needleEndWidth: 3,
                        tailStyle: TailStyle(color: kSecondaryColor, width: 1),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Text('20 V')
          ],
        ),
      ),
    );
  }
}
