import 'package:flutter/material.dart';
import 'package:inri/constants/borders.dart';
import 'package:inri/constants/colors.dart';
import 'package:inri/constants/theme.dart';

class CustomDateRange extends StatelessWidget {
  final String title;
  final Function(DateTimeRange) onTap;

  const CustomDateRange(this.title, this.onTap);

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      child: GestureDetector(
        child: Text(title),
        onTap: () => _dataPicker(context).then((value) => value != null ? onTap(value) : null),
      ),
      decoration: InputDecoration(
        labelText: 'Date Interval',
        fillColor: kTextGreyLight,
        hintText: 'Select the interval',
        labelStyle: const TextStyle(color: kTextGreyDark),
        enabledBorder: enableBorder,
        focusedBorder: focusBorder,
        focusedErrorBorder: errorBorder,
        contentPadding: const EdgeInsets.only(left: 12, right: 12),
      ),
    );
  }
}

Future<DateTimeRange?> _dataPicker(BuildContext context) {
  return showDateRangePicker(
    context: context,
    firstDate: DateTime(2000),
    lastDate: DateTime.now().add(Duration(days: 1)),
    cancelText: 'Cancelar',
    saveText: 'Buscar',
    builder: (context, child) {
      return Theme(
        data: theme,
        child: child!,
      );
    },
  );
}
