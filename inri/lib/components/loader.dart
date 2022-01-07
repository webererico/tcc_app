import 'package:flutter/material.dart';
import 'package:inri/constants/colors.dart';

class Loader extends StatelessWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: const CircularProgressIndicator(
        color: kSecondaryColor,
        strokeWidth: 1,
      ),
    );
  }
}
