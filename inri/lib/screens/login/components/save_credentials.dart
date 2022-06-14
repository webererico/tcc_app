import 'package:flutter/material.dart';

class SaveCredentials extends StatelessWidget {
  final bool value;
  final Function(bool) onChanged;
  const SaveCredentials({required this.value, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: (bool? value) => value != null ? onChanged(value) : null,
        ),
        const Text('Lembrar-me'),
      ],
    );
  }
}