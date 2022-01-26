import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:inri/components/menu_drawer_tile.dart';
import 'package:inri/constants/colors.dart';
import 'package:inri/interfaces/shared_preferences.dart';
import 'package:inri/screens/battery_voltage/battery_voltage_screen.dart';
import 'package:inri/screens/dashboard/dashboard_screen.dart';
import 'package:inri/screens/export/export_screen.dart';
import 'package:inri/screens/measured_power/measured_power_screen.dart';
import 'package:inri/screens/status/status_screen.dart';
import 'package:inri/screens/total_energy/total_energy_screen.dart';
import 'package:inri/screens/wind_direction/wind_direction_screen.dart';
import 'package:inri/screens/wind_speed/wind_speed_screen.dart';

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
              title: 'Total Energy',
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
              onPressed: () => Navigator.of(context).pushReplacementNamed(windSpeedScreen.routeName),
              title: 'Wind Speed',
            ),
            MenuDrawerTile(
              icon: FontAwesomeIcons.solarPanel,
              onPressed: () => Navigator.of(context).pushReplacementNamed(StatusScreen.routeName),
              title: 'Status',
            ),
            MenuDrawerTile(
              icon: FontAwesomeIcons.fileExport,
              onPressed: () => Navigator.of(context).pushReplacementNamed(ExportScreen.routeName),
              title: 'Export Data',
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
        FutureBuilder(
            future: Prefs.userName,
            builder: (context, snapshot) {
              return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  alignment: Alignment.centerLeft,
                  child: Text(
                    snapshot.data == null ? '' : 'User: ${snapshot.data}',
                    style: const TextStyle(fontWeight: FontWeight.bold, color: kSecondaryColor),
                  ));
            }),
        const SizedBox(
          height: 10,
        ),
        FutureBuilder(
            future: Prefs.login,
            builder: (context, snapshot) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.centerLeft,
                child: Text(
                  snapshot.data == null ? '' : 'Email: ${snapshot.data}',
                  style: const TextStyle(fontSize: 12),
                ),
              );
            }),
        const SizedBox(
          height: 10,
        ),
      ],
    ),
  );
}
