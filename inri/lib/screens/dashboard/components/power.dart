import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:inri/constants/colors.dart';
import 'package:inri/screens/measured_power/measured_power_screen.dart';
import 'package:inri/screens/total_energy/total_energy_screen.dart';

class Power extends StatelessWidget {
  const Power({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 150,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
                  const Text(
                    '64 KWh',
                    style: TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
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
                  const Text(
                    '64 KWh',
                    style: TextStyle(fontWeight: FontWeight.bold, color: kPrimaryColor),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
