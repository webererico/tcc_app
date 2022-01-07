import 'package:flutter/material.dart';
import 'package:inri/constants/colors.dart';

final errorBorder = OutlineInputBorder(
  borderSide: const BorderSide(color: kError, width: 1.0),
  borderRadius: BorderRadius.circular(8),
);

final focusBorder = OutlineInputBorder(
  borderSide: const BorderSide(color: kPrimaryColor, width: 1.0),
  borderRadius: BorderRadius.circular(8),
);

final disableBorder = OutlineInputBorder(
  borderSide: const BorderSide(color: kTextGreyLight, width: 1.0),
  borderRadius: BorderRadius.circular(8),
);

final enableBorder = OutlineInputBorder(
  borderSide: const BorderSide(color: kTextGreyLight, width: 1.0),
  borderRadius: BorderRadius.circular(8),
);
