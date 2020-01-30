import 'dart:convert';
import 'package:intl/intl.dart';

class Areadata {
  String updatedAt;
  int timeTableId;
  String nameAr;
  String name;
  String createdAt;
  int id;
  String state;
  int cityId;

  Areadata({
    this.updatedAt = "",
    this.timeTableId = 0,
    this.nameAr = "",
    this.name = "",
    this.createdAt = "",
    this.id = 0,
    this.state = "",
    this.cityId = 0,
  });

  Areadata.fromJson(Map<String, dynamic>  map) :
        updatedAt = map['updated_at']  ?? "",
        timeTableId = map['time_table_id']  ?? 0,
        nameAr = map['name_ar']  ?? "",
        name = map['name']  ?? "",
        createdAt = map['created_at']  ?? "",
        id = map['id']  ?? 0,
        state = map['state']  ?? "",
        cityId = map['city_id']  ?? 0;

  Map<String, dynamic> toJson() => {
        'updated_at': updatedAt,
        'time_table_id': timeTableId,
        'name_ar': nameAr,
        'name': name,
        'created_at': createdAt,
        'id': id,
        'state': state,
        'city_id': cityId,
      };

  Areadata copyWith({
    String updatedAt,
    int timeTableId,
    String nameAr,
    String name,
    String createdAt,
    int id,
    String state,
    int cityId,
  }) {
    return Areadata(
      updatedAt: updatedAt ?? this.updatedAt,
      timeTableId: timeTableId ?? this.timeTableId,
      nameAr: nameAr ?? this.nameAr,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
      id: id ?? this.id,
      state: state ?? this.state,
      cityId: cityId ?? this.cityId,
    );
  }

}

