import 'dart:convert';

class InversorModel {
  int statusId;
  String description;
  DateTime createdAt;
  DateTime updatedAt;

  InversorModel({required this.statusId, required this.description, required this.createdAt, required this.updatedAt});

  Map<String, dynamic> toMap() {
    return {
      'status_id': statusId,
      'description': description,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  factory InversorModel.fromMap(Map<String, dynamic> map) {
    return InversorModel(
      statusId: map['status_id']?.toInt() ?? 0,
      description: map['description'] ?? '',
      createdAt: DateTime.parse(map['created_at']),
      updatedAt: DateTime.parse(map['updated_at']),
    );
  }

  String toJson() => json.encode(toMap());

  factory InversorModel.fromJson(String source) => InversorModel.fromMap(json.decode(source));
}
