import 'package:flutter/material.dart';
import 'package:inri/components/custom_scaffold.dart';
import 'package:inri/components/loader.dart';
import 'package:inri/models/system_status_model.dart';
import 'package:inri/providers/dashboard_provider.dart';
import 'package:inri/screens/status/components/status_card.dart';
import 'package:provider/provider.dart';

class StatusScreen extends StatelessWidget {
  static const routeName = '/status-screen';

  const StatusScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Status',
      body: Container(
        padding: const EdgeInsets.all(10),
        child: FutureBuilder<SystemStatusModel>(
          future: Provider.of<DashboardProvider>(context, listen: false).fetchStatus(),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) return const Center(child: Loader());
            if (!snapshot.hasData) return const Center(child: Text('No data found.'));
            return Column(
              children: [
                StatusCard('Aurora Inversor Status', snapshot.data!.inversor.description, snapshot.data!.inversor.createdAt, snapshot.data!.inversor.statusId != 6),
                const SizedBox(
                  height: 40,
                ),
                StatusCard('Weather Station Status', snapshot.data!.stationStatus.status ? 'Working' : 'Error detected', snapshot.data!.stationStatus.createdAt, !snapshot.data!.stationStatus.status),
              ],
            );
          },
        ),
      ),
    );
  }
}
