import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:inri/components/custom_scaffold.dart';
import 'package:inri/constants/colors.dart';
import 'package:inri/screens/battery_voltage/battery_voltage_screen.dart';
import 'package:inri/screens/dashboard/components/gaugue.dart';
import 'package:inri/screens/dashboard/components/header.dart';
import 'package:inri/screens/dashboard/components/power.dart';
import 'package:inri/screens/dashboard/components/wind.dart';
import 'package:inri/screens/wind_direction/wind_direction_screen.dart';
import 'package:inri/screens/wind_speed/wind_speed_top_screen.dart';

class DashboardScreen extends StatelessWidget {
  static const routeName = '/dashboard-screen';

  const DashboardScreen();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Header(),
            SingleChildScrollView(
              primary: false,
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Gauge(),
                      Power(),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Divider(),
                  ),
                  const SizedBox(height: 5),
                  // ListTile(
                  //   leading: FaIcon(FontAwesomeIcons.bolt),
                  //   title: const Text('Cumulated Total Energy'),
                  //   subtitle: Text('10/10/2021 14:54'),
                  //   trailing: Text('14,5V'),
                  //   onTap: () => Navigator.of(context).pushReplacementNamed(TotalEnergyScreen.routeName),
                  // ),
                  // ListTile(
                  //   leading: FaIcon(FontAwesomeIcons.plug),
                  //   title: const Text('Measured Power'),
                  //   subtitle: Text('10/10/2021 14:54'),
                  //   trailing: Text('14,5V'),
                  //   onTap: () => Navigator.of(context).pushReplacementNamed(MeasuredPowerScreen.routeName),
                  // ),
                  // ListTile(
                  //   leading: FaIcon(FontAwesomeIcons.carBattery),
                  //   title: const Text('Battery Voltage'),
                  //   subtitle: Text('10/10/2021 14:54'),
                  //   trailing: Text('14,5V'),
                  //   onTap: () => Navigator.of(context).pushReplacementNamed(BatteryVoltageScreen.routeNamed),
                  // ),

                  ListTile(
                    leading: const FaIcon(FontAwesomeIcons.wind),
                    title: const Text('Wind Speed'),
                    subtitle: const Text('10/10/2021 14:54'),
                    trailing: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('Lateral Speed', style: TextStyle(color: kError),)
                      ],
                    ),
                    onTap: () => Navigator.of(context).pushReplacementNamed(WindSpeedTopScreen.routeName),
                  ),
                  const Wind(),
                  const SizedBox(height: 5),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Divider(),
                  ),
                  const SizedBox(height: 5),
                  ListTile(
                    leading: const FaIcon(FontAwesomeIcons.compass),
                    title: const Text('Wind Direction'),
                    subtitle: const Text('10/10/2021 14:54'),
                    trailing: const Text('18.5 '),
                    onTap: () => Navigator.of(context).pushReplacementNamed(WindDirectionScreen.routeName),
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
