import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

class Service {
  int minimumPoints;
  String updatedAt;
  String name;
  int discount;
  String createdAt;
  int id;
  String state;

  Service({
    this.minimumPoints = 0,
    this.updatedAt = "",
    this.name = "",
    this.discount = 0,
    this.createdAt = "",
    this.id = 0,
    this.state = "",
  });

  Service.fromJson(Map<String, dynamic> map)
      : minimumPoints = map['minimum_points'] ?? 0,
        updatedAt = map['updated_at'] ?? "",
        name = map['name'] ?? "",
        discount = map['discount'] ?? 0,
        createdAt = map['created_at'] ?? "",
        id = map['id'] ?? 0,
        state = map['state'] ?? "";

  Map<String, dynamic> toJson() => {
        'minimum_points': minimumPoints,
        'updated_at': updatedAt,
        'name': name,
        'discount': discount,
        'created_at': createdAt,
        'id': id,
        'state': state,
      };

  Service copyWith({
    int minimumPoints,
    String updatedAt,
    String name,
    int discount,
    String createdAt,
    int id,
    String state,
  }) {
    return Service(
      minimumPoints: minimumPoints ?? this.minimumPoints,
      updatedAt: updatedAt ?? this.updatedAt,
      name: name ?? this.name,
      discount: discount ?? this.discount,
      createdAt: createdAt ?? this.createdAt,
      id: id ?? this.id,
      state: state ?? this.state,
    );
  }
}
