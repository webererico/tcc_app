import 'dart:convert';

import 'package:inri/models/inversor_model.dart';
import 'package:inri/models/power_grid_model.dart';

class SystemStatusModel {
  InversorModel inversor;
  PowerGridModel powerGrid;

  SystemStatusModel({required this.inversor, required this.powerGrid});

  

  Map<String, dynamic> toMap() {
    return {
      'inversor_status': inversor.toMap(),
      'power_grid_status': powerGrid.toMap(),
    };
  }

  factory SystemStatusModel.fromMap(Map<String, dynamic> map) {
    return SystemStatusModel(
      inversor: InversorModel.fromMap(map['inversor_status']),
      powerGrid: PowerGridModel.fromMap(map['power_grid_status']),
    );
  }

  String toJson() => json.encode(toMap());

  factory SystemStatusModel.fromJson(String source) => SystemStatusModel.fromMap(json.decode(source));
}
