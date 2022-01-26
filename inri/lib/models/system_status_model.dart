import 'dart:convert';

import 'package:inri/models/inversor_model.dart';
import 'package:inri/models/power_grid_model.dart';

class SystemStatusModel {
  InversorModel inversor;
  StationStatus stationStatus;

  SystemStatusModel({required this.inversor, required this.stationStatus});

  

  Map<String, dynamic> toMap() {
    return {
      'inversor_status': inversor.toMap(),
      'station_status': stationStatus.toMap(),
    };
  }

  factory SystemStatusModel.fromMap(Map<String, dynamic> map) {
    return SystemStatusModel(
      inversor: InversorModel.fromMap(map['inversor_status']),
      stationStatus: StationStatus.fromMap(map['station_status']),
    );
  }

  String toJson() => json.encode(toMap());

  factory SystemStatusModel.fromJson(String source) => SystemStatusModel.fromMap(json.decode(source));
}
