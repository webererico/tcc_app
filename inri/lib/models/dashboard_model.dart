import 'dart:convert';

import 'package:inri/models/battery_voltage_model.dart';
import 'package:inri/models/power_model.dart';
import 'package:inri/models/total_energy_model.dart';
import 'package:inri/models/wind_model.dart';

class DashboardModel {
  PowerModel power;
  BatteryVoltageModel batteryVoltage;
  TotalEnergyModel totalEnergy;
  WindModel windLateral;
  WindModel windTop;
  WindModel windDirection;

  DashboardModel(
      {required this.power,
      required this.batteryVoltage,
      required this.totalEnergy,
      required this.windLateral,
      required this.windDirection,
      required this.windTop});

  Map<String, dynamic> toMap() {
    return {
      'power': power.toMap(),
      'battery_voltage': batteryVoltage.toMap(),
      'total_energy': totalEnergy.toMap(),
      'wind_lateral': windLateral.toMap(),
      'wind_top': windTop.toMap(),
      'wind_direction': windDirection.toMap()
    };
  }

  factory DashboardModel.fromMap(Map<String, dynamic> map) {
    return DashboardModel(
        power: PowerModel.fromMap(map['power']),
        batteryVoltage: BatteryVoltageModel.fromMap(map['battery_voltage']),
        totalEnergy: TotalEnergyModel.fromMap(map['total_energy']),
        windLateral: WindModel.fromMap(map['wind_lateral']),
        windTop: WindModel.fromMap(map['wind_top']),
        windDirection: WindModel.fromMap(map['wind_direction']));
  }

  String toJson() => json.encode(toMap());

  factory DashboardModel.fromJson(String source) => DashboardModel.fromMap(json.decode(source));
}
