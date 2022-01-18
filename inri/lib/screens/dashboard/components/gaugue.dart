import 'package:flutter/material.dart';
import 'package:inri/constants/colors.dart';
import 'package:inri/models/battery_voltage_model.dart';
import 'package:inri/screens/battery_voltage/battery_voltage_screen.dart';
import 'package:inri/utils/formatters/date_formater.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class Gauge extends StatelessWidget {
  final BatteryVoltageModel batteryVoltage;

  const Gauge({required this.batteryVoltage});

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
                    maximum: 13.5,
                    ranges: <GaugeRange>[
                      GaugeRange(startValue: 0, endValue: 10.5, color: Colors.red),
                      GaugeRange(startValue: 10.5, endValue: 12, color: Colors.green),
                      GaugeRange(startValue: 12, endValue: 13.5, color: Colors.yellow),
                    ],
                    pointers: const <GaugePointer>[
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
            Text('${batteryVoltage.average} V'),
            const SizedBox(
              width: 5,
            ),
            Row(
              children: [
                Text(
                  'Min: ${batteryVoltage.min}',
                  style: const TextStyle(fontSize: 10, color: kTextGreyDark),
                ),
                const SizedBox(
                  width: 5,
                ),
                Text(
                  'Max: ${batteryVoltage.max}',
                  style: const TextStyle(fontSize: 10, color: kTextGreyDark),
                ),
              ],
            ),
            Text(
              '${dateFormat.format(batteryVoltage.createdAt!)}',
              style: const TextStyle(fontSize: 10, color: kTextGreyDark),
            ),
          ],
        ),
      ),
    );
  }
}
