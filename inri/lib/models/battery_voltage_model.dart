import 'dart:convert';

class BatteryVoltageModel {
  int? id;
  double? max;
  double? min;
  double? deviation;
  double? average;
  DateTime? createdAt;
  DateTime? updatedAt;

  BatteryVoltageModel({this.id, this.max, this.min, this.deviation, this.average, this.createdAt, this.updatedAt});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'max': max,
      'min': min,
      'deviation': deviation,
      'average': average,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }

  factory BatteryVoltageModel.fromMap(Map<String, dynamic> map) {
    return BatteryVoltageModel(
      id: map['id']?.toInt(),
      max: map['max']?.toDouble(),
      min: map['min']?.toDouble(),
      deviation: map['deviation']?.toDouble(),
      average: map['average']?.toDouble(),
      createdAt: map['created_at'] != null ? DateTime.tryParse(map['created_at']) : null,
      updatedAt: map['updated_at'] != null ? DateTime.tryParse(map['updated_at']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory BatteryVoltageModel.fromJson(String source) => BatteryVoltageModel.fromMap(json.decode(source));
}