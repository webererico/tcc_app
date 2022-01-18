import 'dart:convert';

class InversorModel {
  bool status;
  DateTime createdAt;
  DateTime updatedAt;

  InversorModel({required this.status, required this.createdAt, required this.updatedAt});

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  factory InversorModel.fromMap(Map<String, dynamic> map) {
    return InversorModel(
      status: map['status'] == 1 ? true : false ,
      createdAt: DateTime.parse(map['created_at']),
      updatedAt: DateTime.parse(map['updated_at']),
    );
  }

  String toJson() => json.encode(toMap());

  factory InversorModel.fromJson(String source) => InversorModel.fromMap(json.decode(source));
}
