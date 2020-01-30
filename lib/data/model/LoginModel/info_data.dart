import 'dart:convert';
import 'package:intl/intl.dart';

class Info {
  String area;
  String address;
  String role;
  String city;
  String createdAt;
  String avatar;
  int areaId;
  int points;
  String password;
  String updatedAt;
  String phone;
  String name;
  int id;
  String state;
  String activation;
  int cityId;

  Info({
    this.area = "",
    this.address = "",
    this.role = "",
    this.city = "",
    this.createdAt = "",
    this.avatar = "",
    this.areaId = 0,
    this.points = 0,
    this.password = "",
    this.updatedAt = "",
    this.phone = "",
    this.name = "",
    this.id = 0,
    this.state = "",
    this.activation = "",
    this.cityId = 0,
  });

  Info.fromJson(Map<String, dynamic>  map) :
        area = map['area']  ?? "",
        address = map['address']  ?? "",
        role = map['role']  ?? "",
        city = map['city']  ?? "",
        createdAt = map['created_at']  ?? "",
        avatar = map['avatar']  ?? "",
        areaId = map['area_id']  ?? 0,
        points = map['points']  ?? 0,
        password = map['password']  ?? "",
        updatedAt = map['updated_at']  ?? "",
        phone = map['phone']  ?? "",
        name = map['name']  ?? "",
        id = map['id']  ?? 0,
        state = map['state']  ?? "",
        activation = map['activation']  ?? "",
        cityId = map['city_id']  ?? 0;

  Map<String, dynamic> toJson() => {
        'area': area,
        'address': address,
        'role': role,
        'city': city,
        'created_at': createdAt,
        'avatar': avatar,
        'area_id': areaId,
        'points': points,
        'password': password,
        'updated_at': updatedAt,
        'phone': phone,
        'name': name,
        'id': id,
        'state': state,
        'activation': activation,
        'city_id': cityId,
      };

  Info copyWith({
    String area,
    String address,
    String role,
    String city,
    String createdAt,
    String avatar,
    int areaId,
    int points,
    String password,
    String updatedAt,
    String phone,
    String name,
    int id,
    String state,
    String activation,
    int cityId,
  }) {
    return Info(
      area: area ?? this.area,
      address: address ?? this.address,
      role: role ?? this.role,
      city: city ?? this.city,
      createdAt: createdAt ?? this.createdAt,
      avatar: avatar ?? this.avatar,
      areaId: areaId ?? this.areaId,
      points: points ?? this.points,
      password: password ?? this.password,
      updatedAt: updatedAt ?? this.updatedAt,
      phone: phone ?? this.phone,
      name: name ?? this.name,
      id: id ?? this.id,
      state: state ?? this.state,
      activation: activation ?? this.activation,
      cityId: cityId ?? this.cityId,
    );
  }

}

