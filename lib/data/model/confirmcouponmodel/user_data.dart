import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

class User {
  String address;
  String role;
  String phone;
  String name;
  String avatar;
  int id;

  User({
    this.address = "",
    this.role = "",
    this.phone = "",
    this.name = "",
    this.avatar ="",
    this.id = 0,
  });

  User.fromJson(Map<String, dynamic>  map) :
        address = map['address']  ?? "",
        role = map['role']  ?? "",
        phone = map['phone']  ?? "",
        name = map['name']  ?? "",
        avatar = map['avatar']  ?? "",
        id = map['id']  ?? 0;

  Map<String, dynamic> toJson() => {
        'address': address,
        'role': role,
        'phone': phone,
        'name': name,
        'id': id,
    'avatar': avatar,

      };

  User copyWith({
    String address,
    String role,
    String phone,
    String name,
    String avatar,
    int id,
  }) {
    return User(
      address: address ?? this.address,
      role: role ?? this.role,
      avatar: avatar ?? this.avatar,

      phone: phone ?? this.phone,
      name: name ?? this.name,
      id: id ?? this.id,
    );
  }

  static Future createTable(Database db) async {
    db.execute("""
            CREATE TABLE IF NOT EXISTS user (
              address TEXT,
              role TEXT,
              phone TEXT,
              name TEXT,
              id INTEGER 
            )""");}

  User.fromMap(Map<String, dynamic>  map) :
        address = map['address'],
        role = map['role'],
        phone = map['phone'],
        name = map['name'],
        id = map['id'];

  Map<String, dynamic> toMap() => {
        'address': address,
        'role': role,
        'phone': phone,
        'name': name,
        'id': id,
      };

}

class Login {
  String name;
  String password;

  Login(this.name, this.password);

  Map<String, dynamic> toJson() => {
        'name': name,
        'password': password,
      };
}
