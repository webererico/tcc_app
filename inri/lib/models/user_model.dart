import 'dart:convert';

class UserModel {
  String name;
  String occupation;
  String email;
  String? password;
  bool? isAdmin;

  UserModel(this.name, this.email, this.occupation, this.password, this.isAdmin);

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'occupation': occupation,
      'email': email,
      'password': password,
      'isAdmin': isAdmin,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      map['name'] ?? '',
      map['occupation'] ?? '',
      map['email'] ?? '',
      map['password'],
      map['isAdmin'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));
}
