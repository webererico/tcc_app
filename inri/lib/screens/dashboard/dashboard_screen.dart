import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:inri/components/custom_scaffold.dart';
import 'package:inri/components/loader.dart';
import 'package:inri/constants/colors.dart';
import 'package:inri/models/dashboard_model.dart';
import 'package:inri/providers/dashboard_provider.dart';
import 'package:inri/screens/dashboard/components/gaugue.dart';
import 'package:inri/screens/dashboard/components/header.dart';
import 'package:inri/screens/dashboard/components/power.dart';
import 'package:inri/screens/dashboard/components/wind.dart';
import 'package:inri/screens/wind_direction/wind_direction_screen.dart';
import 'package:inri/screens/wind_speed/wind_speed_screen.dart';
import 'package:inri/utils/formatters/date_formater.dart';
import 'package:provider/provider.dart';

class DashboardScreen extends StatefulWidget {
  static const routeName = '/dashboard-screen';

  const DashboardScreen();

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool _visible = true;
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      onRefreshTap: () async {
        setState(() => _visible = !_visible);
        await Future.delayed(const Duration(milliseconds: 500));
        setState(() => _visible = !_visible);
      },
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Header(),
            if (!_visible)
              const Padding(
                padding: EdgeInsets.only(top: 200),
                child: Center(
                  child: Loader(),
                ),
              )
            else
              FutureBuilder<DashboardModel>(
                future: Provider.of<DashboardProvider>(context, listen: false).fetchDashboard(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done)
                    return const Center(
                      child: Loader(),
                    );
                  else {
                    return SingleChildScrollView(
                      primary: false,
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              if (snapshot.data?.batteryVoltage.average != null)
                                Gauge(batteryVoltage: snapshot.data!.batteryVoltage),
                              if (snapshot.data?.totalEnergy != null && snapshot.data?.power != null)
                                Power(
                                  power: snapshot.data!.power,
                                  totalEnergy: snapshot.data!.totalEnergy,
                                ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Divider(),
                          ),
                          const SizedBox(height: 5),
                          ListTile(
                            leading: const FaIcon(FontAwesomeIcons.wind),
                            title: const Text('Wind Speed'),
                            isThreeLine: true,
                            subtitle: Text(
                              'Last updated:\n${dateFormat.format(snapshot.data!.windTop.createdAt!)}',
                              style: const TextStyle(fontSize: 11),
                            ),
                            trailing: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: const [
                                Text(
                                  'Lateral Speed',
                                  style: TextStyle(color: kError),
                                ),
                                Text(
                                  'Top Speed',
                                  style: TextStyle(color: kSuccess),
                                )
                              ],
                            ),
                            onTap: () => Navigator.of(context).pushReplacementNamed(windSpeedScreen.routeName),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.of(context).pushReplacementNamed(windSpeedScreen.routeName),
                            child: Wind(
                              lateralSpeed: snapshot.data!.windLateral.average!,
                              topSpeed: snapshot.data!.windTop.average!,
                            ),
                          ),
                          const SizedBox(height: 5),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Divider(),
                          ),
                          const SizedBox(height: 5),
                          ListTile(
                            leading: const FaIcon(FontAwesomeIcons.compass),
                            title: const Text('Wind Direction'),
                            subtitle: Text(
                                'Last updated: ${dateFormat.format(snapshot.data!.windDirection.createdAt!)}',
                                style: const TextStyle(fontSize: 11)),
                            trailing: Text('${snapshot.data!.windDirection.average} º'),
                            onTap: () => Navigator.of(context).pushReplacementNamed(WindDirectionScreen.routeName),
                          ),
                        ],
                      ),
                    );
                  }
                },
              )
          ],
        ),
      ),
    );
  }
}
