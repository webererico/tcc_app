import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:inri/constants/colors.dart';
import 'package:inri/models/battery_voltage_model.dart';
import 'package:inri/utils/formatters/date_formater.dart';

class BatteryCard extends StatelessWidget {
  final BatteryVoltageModel batteryModel;
  const BatteryCard(this.batteryModel);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kSecondaryColor.withOpacity(0.1),
      elevation: 0,
      child: ListTile(
        leading: const FaIcon(
          FontAwesomeIcons.carBattery,
          color: kSecondaryColor,
        ),
        visualDensity: VisualDensity.compact,
        title: Text('${batteryModel.average} m/s'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Min: ${batteryModel.min} Max: ${batteryModel.max}',
              style: _textStyle,
            ),
            Text(
              'Deviation: ${batteryModel.deviation}',
              style: _textStyle,
            )
          ],
        ),
        trailing: Text(
          'Last Update: \n${dateFormatWithSpace.format(batteryModel.createdAt!)}',
          style: _textStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

TextStyle get _textStyle => const TextStyle(fontSize: 10);
