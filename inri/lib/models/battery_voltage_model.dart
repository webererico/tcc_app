import 'dart:convert';

class BatteryVoltageModel {
  int? id;
  double? max;
  double? min;
  double? average;
  DateTime? createdAt;
  DateTime? updatedAt;

  BatteryVoltageModel({this.id, this.max, this.min, this.average, this.createdAt, this.updatedAt});

  factory BatteryVoltageModel.fromMap(Map<String, dynamic> map) {
    return BatteryVoltageModel(
      id: map['id']?.toInt(),
      max: map['max']?.toDouble(),
      min: map['min']?.toDouble(),
      average: map['average']?.toDouble(),
      createdAt: map['created_at'] != null ? DateTime.tryParse(map['created_at']) : null,
      updatedAt: map['updated_at'] != null ? DateTime.tryParse(map['updated_at']) : null,
    );
  }

  factory BatteryVoltageModel.fromJson(String source) => BatteryVoltageModel.fromMap(json.decode(source));
}
