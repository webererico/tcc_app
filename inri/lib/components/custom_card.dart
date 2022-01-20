import 'package:flutter/material.dart';
import 'package:inri/constants/colors.dart';
import 'package:inri/utils/formatters/date_formater.dart';

class CustomCard extends StatelessWidget {
  final dynamic data;
  final Widget? leading;

  const CustomCard(this.data, {this.leading});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: kSecondaryColor.withOpacity(0.1),
      elevation: 0,
      child: ListTile(
        leading: leading,
        visualDensity: VisualDensity.compact,
        title: Text('${data.average} m/s'),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Min: ${data.min} Max: ${data.max}',
              style: _textStyle,
            ),
            Text(
              'Deviation: ${data.deviation}',
              style: _textStyle,
            )
          ],
        ),
        trailing: Text(
          'Last Update: \n${dateFormatWithSpace.format(data.createdAt!)}',
          style: _textStyle,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}

TextStyle get _textStyle => const TextStyle(fontSize: 10);
