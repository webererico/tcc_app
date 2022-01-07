import 'package:flutter/material.dart';
import 'package:inri/constants/borders.dart';
import 'package:inri/constants/colors.dart';

class CustomContainer extends StatelessWidget {
  final String text;
  final String label;
  final double? height;
  const CustomContainer({required this.text, required this.label, this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      child: InputDecorator(
        child: Text(text),
        decoration: InputDecoration(
          labelText: label,
          fillColor: kTextGreyLight,
          labelStyle: const TextStyle(color: kTextGreyDark),
          enabledBorder: enableBorder,
          focusedBorder: focusBorder,
          focusedErrorBorder: errorBorder,
          contentPadding: const EdgeInsets.only(left: 12, right: 12),
        ),
      ),
    );
  }
}
