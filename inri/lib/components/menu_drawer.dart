import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:inri/components/menu_drawer_tile.dart';
import 'package:inri/constants/colors.dart';
import 'package:inri/screens/battery_voltage/battery_voltage_screen.dart';
import 'package:inri/screens/dashboard/dashboard_screen.dart';
import 'package:inri/screens/measured_power/measured_power_screen.dart';
import 'package:inri/screens/total_energy/total_energy_screen.dart';
import 'package:inri/screens/wind_direction/wind_direction_screen.dart';
import 'package:inri/screens/wind_speed/wind_speed_lateral_screen.dart';
import 'package:inri/screens/wind_speed/wind_speed_top_screen.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Drawer(
        child: ListView(
          children: [
            _buildDrawerHeader(context),
            MenuDrawerTile(
              icon: Icons.home,
              onPressed: () => Navigator.of(context).pushReplacementNamed(DashboardScreen.routeName),
              title: 'Dashboard',
            ),
            MenuDrawerTile(
              icon: FontAwesomeIcons.bolt,
              onPressed: () => Navigator.of(context).pushReplacementNamed(TotalEnergyScreen.routeName),
              title: 'Cumulated Total Energy',
            ),
            MenuDrawerTile(
              icon: FontAwesomeIcons.plug,
              onPressed: () => Navigator.of(context).pushReplacementNamed(MeasuredPowerScreen.routeName),
              title: 'Measured Power',
            ),
            MenuDrawerTile(
              icon: FontAwesomeIcons.carBattery,
              onPressed: () => Navigator.of(context).pushReplacementNamed(BatteryVoltageScreen.routeNamed),
              title: 'Battery Voltage',
            ),
            MenuDrawerTile(
              icon: FontAwesomeIcons.compass,
              onPressed: () => Navigator.of(context).pushReplacementNamed(WindDirectionScreen.routeName),
              title: 'Wind Direction',
            ),
            MenuDrawerTile(
              icon: FontAwesomeIcons.wind,
              onPressed: () => Navigator.of(context).pushReplacementNamed(WindSpeedTopScreen.routeName),
              title: 'Wind Speed Top',
            ),
            MenuDrawerTile(
              icon: FontAwesomeIcons.wind,
              onPressed: () => Navigator.of(context).pushReplacementNamed(WindSpeedLateralScreen.routeName),
              title: 'Wind Speed Lateral',
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildDrawerHeader(BuildContext context) {
  return Container(
    color: kPrimaryColor.withOpacity(0.5),
    child: Column(
      children: [
        Container(
          margin: const EdgeInsets.all(30),
          child: Image.asset(
            'assets/png/inri_horizontal.png',
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.centerLeft,
          child: Text(
            'User: name',
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.centerLeft,
          child: Text(
            'teste@gmail.com',
            style: const TextStyle(fontSize: 12),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    ),
  );
}
