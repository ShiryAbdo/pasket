import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:plstka_app/data/model/LoginModel/data_data.dart';
import 'package:sqflite/sqflite.dart';

class LoginModel {
  LoginData data;
  int count;
  String message;
  bool status;

  LoginModel({
    this.data,
    this.count = 0,
    this.message = "",
    this.status = false,
  });

  LoginModel.fromJson(Map<String, dynamic>  map) :
        data = map['data'] == null
            ? null
            : LoginData.fromJson(map['data']),
        count = map['count']  ?? 0,
        message = map['message']  ?? "",
        status = map['status']  ?? false;

  Map<String, dynamic> toJson() => {
        'data': data.toJson(),
        'count': count,
        'message': message,
        'status': status,
      };

  LoginModel copyWith({
    LoginData data,
    int count,
    String message,
    bool status,
  }) {
    return LoginModel(
      data: data ?? this.data,
      count: count ?? this.count,
      message: message ?? this.message,
      status: status ?? this.status,
    );
  }

  static Future createTable(Database db) async {
    db.execute("""
            CREATE TABLE IF NOT EXISTS loginmodel (
              count INTEGER,
              message TEXT,
              status INTEGER 
            )""");}

  LoginModel.fromMap(Map<String, dynamic>  map) :
        count = map['count'],
        message = map['message'],
        status = (map['status'] == 1);

  Map<String, dynamic> toMap() => {
        'count': count,
        'message': message,
        'status': (status == true)?1:0,
      };

}

