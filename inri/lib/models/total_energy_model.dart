import 'dart:convert';

class TotalEnergyModel {
  int? id;
  double? value;
  DateTime? createdAt;
  DateTime? updatedAt;

  TotalEnergyModel({this.id, this.value, this.createdAt, this.updatedAt});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'value': value,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
    };
  }

  factory TotalEnergyModel.fromMap(Map<String, dynamic> map) {
    return TotalEnergyModel(
      id: map['id']?.toInt(),
      value: map['value']?.toDouble(),
      createdAt: map['created_at'] != null ? DateTime.tryParse(map['created_at']) : null,
      updatedAt: map['updated_at'] != null ? DateTime.tryParse(map['updated_at']) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory TotalEnergyModel.fromJson(String source) => TotalEnergyModel.fromMap(json.decode(source));
}
