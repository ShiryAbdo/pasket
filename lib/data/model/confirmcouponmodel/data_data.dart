import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:plstka_app/data/model/confirmcouponmodel/service_data.dart';
import 'package:plstka_app/data/model/confirmcouponmodel/user_data.dart';
import 'package:sqflite/sqflite.dart';

class Data {
  String code;
  String updatedAt;
  int userId;
  Service service;
  int serviceId;
  String createdAt;
  int id;
  String state;
  User user;

  Data({
    this.code = "",
    this.updatedAt = "",
    this.userId = 0,
    this.service,
    this.serviceId = 0,
    this.createdAt = "",
    this.id = 0,
    this.state = "",
    this.user,
  });

  Data.fromJson(Map<String, dynamic> map)
      : code = map['code'] ?? "",
        updatedAt = map['updated_at'] ?? "",
        userId = map['user_id'] ?? 0,
        service =
            map['service'] == null ? null : Service.fromJson(map['service']),
        serviceId = map['service_id'] ?? 0,
        createdAt = map['created_at'] ?? "",
        id = map['id'] ?? 0,
        state = map['state'] ?? "",
        user = map['user'] == null ? null : User.fromJson(map['user']);

  Map<String, dynamic> toJson() => {
        'code': code,
        'updated_at': updatedAt,
        'user_id': userId,
        'service': service.toJson(),
        'service_id': serviceId,
        'created_at': createdAt,
        'id': id,
        'state': state,
        'user': user.toJson(),
      };

  Data copyWith({
    String code,
    String updatedAt,
    int userId,
    Service service,
    int serviceId,
    String createdAt,
    int id,
    String state,
    User user,
  }) {
    return Data(
      code: code ?? this.code,
      updatedAt: updatedAt ?? this.updatedAt,
      userId: userId ?? this.userId,
      service: service ?? this.service,
      serviceId: serviceId ?? this.serviceId,
      createdAt: createdAt ?? this.createdAt,
      id: id ?? this.id,
      state: state ?? this.state,
      user: user ?? this.user,
    );
  }
}
