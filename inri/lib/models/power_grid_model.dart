import 'dart:convert';

class PowerGridModel {
  bool status;
  DateTime createdAt;
  DateTime updatedAt;

  PowerGridModel({required this.status, required this.createdAt, required this.updatedAt});

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  factory PowerGridModel.fromMap(Map<String, dynamic> map) {
    return PowerGridModel(
      status: map['status'] == 1 ? true : false,
      createdAt: DateTime.parse(map['created_at']),
      updatedAt: DateTime.parse(map['updated_at']),
    );
  }

  String toJson() => json.encode(toMap());

  factory PowerGridModel.fromJson(String source) => PowerGridModel.fromMap(json.decode(source));
}
