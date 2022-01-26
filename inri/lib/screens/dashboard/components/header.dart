import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:inri/components/loader.dart';
import 'package:inri/constants/colors.dart';
import 'package:inri/models/system_status_model.dart';
import 'package:inri/providers/dashboard_provider.dart';
import 'package:inri/screens/status/status_screen.dart';
import 'package:inri/services/weather_service.dart';
import 'package:inri/utils/formatters/date_formater.dart';
import 'package:inri/utils/snackbar_message.dart';
import 'package:provider/provider.dart';
import 'package:weather/weather.dart';

class Header extends StatelessWidget {
  const Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 1000,
      color: kAppBarBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: FutureBuilder<Weather>(
                    future: WeatherService().getWeather(),
                    builder: (context, snapshot) {
                      if (snapshot.data == null)
                        return const Center(
                          child: Loader(),
                        );
                      return Column(
                        children: [
                          const Text(
                            'Temperature',
                            style: TextStyle(color: Colors.white),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const FaIcon(
                                FontAwesomeIcons.temperatureLow,
                                color: Colors.white,
                                size: 25,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              if (snapshot.data != null)
                                Text(
                                  '${snapshot.data!.temperature?.celsius?.toStringAsFixed(2)} ºC',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                )
                            ],
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            '${snapshot.data!.areaName}',
                            style: const TextStyle(fontSize: 10, color: Colors.white),
                          ),
                        ],
                      );
                    }),
              ),
              Expanded(
                flex: 4,
                child: FutureBuilder<SystemStatusModel>(
                  future: Provider.of<DashboardProvider>(context, listen: false).fetchStatus(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState != ConnectionState.done || !snapshot.hasData)
                      return const Center(
                        child: Loader(),
                      );
                    return Row(
                      children: [
                        const SizedBox(width: 15),
                        Card(
                          color: kSecondaryColor,
                          elevation: 0,
                          child: Container(
                            width: 70,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Text(
                                  'Inversor \n Status',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white, fontSize: 12),
                                ),
                                _status(
                                  snapshot.data!.inversor.statusId != 6,
                                  context,
                                  snapshot.data!.inversor.createdAt,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Card(
                          color: kSecondaryColor,
                          elevation: 0,
                          child: Container(
                            width: 80,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Text(
                                  'Weather Station \n Status',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(color: Colors.white, fontSize: 12),
                                ),
                                _status(
                                  snapshot.data!.stationStatus.status,
                                  context,
                                  snapshot.data!.stationStatus.createdAt,
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget _status(bool status, BuildContext context, DateTime date) {
  return GestureDetector(
    onTap: () => Navigator.of(context).pushNamed(StatusScreen.routeName),
    child: Icon(
      status ? Icons.check_circle_sharp : Icons.cancel,
      color: status ? kSuccess : kError,
    ),
  );
}
