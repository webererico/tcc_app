import 'package:flutter/material.dart';
import 'package:inri/constants/borders.dart';
import 'package:inri/constants/colors.dart';

class CustomDropdown extends StatelessWidget {
  final String? value;
  final List<String> items;
  final String label;
  final Function(String?) onChanged;
  const CustomDropdown(this.value, this.items, this.onChanged, this.label);

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      child: DropdownButton<String>(
        hint: Text(label),
        isExpanded: true,
        value: value,
        underline: DropdownButtonHideUnderline(
          child: Container(),
        ),
        items: items.map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: onChanged,
      ),
      decoration: InputDecoration(
        labelText: label,
        fillColor: kTextGreyLight,
        labelStyle: const TextStyle(color: kTextGreyDark),
        focusedBorder: focusBorder,
        focusedErrorBorder: errorBorder,
        contentPadding: const EdgeInsets.only(left: 12, right: 12),
      ),
    );
  }
}
