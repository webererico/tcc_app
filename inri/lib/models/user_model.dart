import 'dart:convert';

class UserModel {
  String? name;
  String? occupation;
  String? email;
  String? password;
  String? contact;
  String? course;
  bool? isAdmin;
  String? registerKey;

  UserModel({
    this.name,
    this.email,
    this.occupation,
    this.password,
    this.isAdmin,
    this.contact,
    this.course,
    this.registerKey,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'occupation': occupation,
      'email': email,
      'password': password,
      'contact_number': contact,
      'course': course,
      'is_admin': isAdmin,
      'register_key': registerKey,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'],
      occupation: map['occupation'],
      email: map['email'],
      password: map['password'],
      contact: map['contact_number'],
      course: map['course'],
      isAdmin: map['is_admin'] == 1 ? true : false,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source));
}
