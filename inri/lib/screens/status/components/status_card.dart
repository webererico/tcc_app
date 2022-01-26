import 'package:flutter/material.dart';
import 'package:inri/constants/colors.dart';
import 'package:inri/utils/formatters/date_formater.dart';

class StatusCard extends StatelessWidget {
  final String title;
  final String status;
  final DateTime date;
  const StatusCard(this.title, this.status, this.date);

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: kPrimaryColor,
      elevation: 2.0,
      child: ListTile(
        isThreeLine: true,
        visualDensity: VisualDensity.comfortable,
        title: Text(title),
        subtitle: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text('Status: $status')],
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [Text(dateFormatWithSpace.format(date))],
        ),
      ),
    );
  }
}
