import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:inri/constants/colors.dart';
import 'package:inri/models/power_model.dart';
import 'package:inri/models/total_energy_model.dart';
import 'package:inri/screens/measured_power/measured_power_screen.dart';
import 'package:inri/screens/total_energy/total_energy_screen.dart';

class Power extends StatelessWidget {
  final TotalEnergyModel totalEnergy;
  final PowerModel power;
  const Power({required this.totalEnergy, required this.power});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () => Navigator.of(context).pushReplacementNamed(MeasuredPowerScreen.routeName),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  FaIcon(FontAwesomeIcons.plug),
                  Text(
                    ' Measured Power',
                    style: TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor),
                  ),
                ],
              ),
              Text(
                '${power.average} KWh',
                style: const TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor),
              ),
              maxMin(power.max!, power.min!),
            ],
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        GestureDetector(
          onTap: () => Navigator.of(context).pushReplacementNamed(TotalEnergyScreen.routeName),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  FaIcon(FontAwesomeIcons.bolt),
                  Text(
                    ' Total Energy',
                    style: TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor),
                  ),
                ],
              ),
              Text(
                '${totalEnergy.average} KWh',
                style: const TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor),
              ),
              maxMin(totalEnergy.max!, totalEnergy.min!),
            ],
          ),
        )
      ],
    );
  }
}

Widget maxMin(double max, double min) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        'Max: $max',
        style: maxMinStyle,
      ),
      const SizedBox(
        width: 10,
      ),
      Text(
        'Min: $min',
        style: maxMinStyle,
      ),
    ],
  );
}

get maxMinStyle => TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor.withOpacity(0.6), fontSize: 10);
