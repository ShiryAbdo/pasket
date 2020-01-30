import 'dart:convert';
import 'package:intl/intl.dart';

class Citydata {
  String updatedAt;
  String nameAr;
  String name;
  String description;
  String createdAt;
  int id;
  String state;

  Citydata({
    this.updatedAt = "",
    this.nameAr = "",
    this.name = "",
    this.description = "",
    this.createdAt = "",
    this.id = 0,
    this.state = "",
  });

  Citydata.fromJson(Map<String, dynamic>  map) :
        updatedAt = map['updated_at']  ?? "",
        nameAr = map['name_ar']  ?? "",
        name = map['name']  ?? "",
        description = map['description']  ?? "",
        createdAt = map['created_at']  ?? "",
        id = map['id']  ?? 0,
        state = map['state']  ?? "";

  Map<String, dynamic> toJson() => {
        'updated_at': updatedAt,
        'name_ar': nameAr,
        'name': name,
        'description': description,
        'created_at': createdAt,
        'id': id,
        'state': state,
      };

  Citydata copyWith({
    String updatedAt,
    String nameAr,
    String name,
    String description,
    String createdAt,
    int id,
    String state,
  }) {
    return Citydata(
      updatedAt: updatedAt ?? this.updatedAt,
      nameAr: nameAr ?? this.nameAr,
      name: name ?? this.name,
      description: description ?? this.description,
      createdAt: createdAt ?? this.createdAt,
      id: id ?? this.id,
      state: state ?? this.state,
    );
  }

}

