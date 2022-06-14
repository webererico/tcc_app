import 'package:flutter/material.dart';
import 'package:inri/constants/data_type.dart';
import 'package:inri/providers/dashboard_provider.dart';
import 'package:inri/screens/all_data.dart/all_data_screen.dart';
import 'package:provider/provider.dart';

class AllDataTile extends StatelessWidget {
  final DataType dataType;
  const AllDataTile({required this.dataType});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text('See all data'),
      trailing: const Icon(Icons.keyboard_arrow_right),
      onTap: () {
        Provider.of<DashboardProvider>(context, listen: false).dataType = dataType;
        Navigator.of(context).pushNamed(AllDataScreen.routeNamed);
      },
    );
  }
}
