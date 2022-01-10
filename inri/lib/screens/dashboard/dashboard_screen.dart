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
import 'package:inri/screens/wind_speed/wind_speed_top_screen.dart';
import 'package:inri/utils/formatters/date_formater.dart';
import 'package:provider/provider.dart';

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
                          subtitle: Text('Last updated:\n${dateFormat.format(snapshot.data!.windTop.createdAt!)}'),
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
                          onTap: () => Navigator.of(context).pushReplacementNamed(WindSpeedTopScreen.routeName),
                        ),
                        Wind(
                          lateralSpeed: snapshot.data!.windLateral.average!,
                          topSpeed: snapshot.data!.windTop.average!,
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
                          subtitle: const Text('10/10/2021 14:54'),
                          trailing: const Text('18.5 '),
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
