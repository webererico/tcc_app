import 'dart:convert';

class StationStatus {
  bool status;
  DateTime createdAt;
  DateTime updatedAt;

  StationStatus({required this.status, required this.createdAt, required this.updatedAt});

  Map<String, dynamic> toMap() {
    return {
      'status': status,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }

  factory StationStatus.fromMap(Map<String, dynamic> map) {
    return StationStatus(
      status: map['status'] == 1 ? true : false,
      createdAt: DateTime.parse(map['created_at']),
      updatedAt: DateTime.parse(map['updated_at']),
    );
  }

  String toJson() => json.encode(toMap());

  factory StationStatus.fromJson(String source) => StationStatus.fromMap(json.decode(source));
}
