import 'package:flutter/material.dart';
import 'package:inri/constants/colors.dart';

enum messageType { ERROR, SUCCESS, WARNING }

showSnackbar(BuildContext context, String message, messageType messageType) {
  ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text(message), backgroundColor: messageType.backgroundColor));
}

extension messageTypeExtension on messageType {
  Color get backgroundColor {
    switch (this) {
      case messageType.ERROR:
        return kError;
      case messageType.SUCCESS:
        return kSuccess;
      case messageType.WARNING:
        return kWarning;
    }
  }
}
