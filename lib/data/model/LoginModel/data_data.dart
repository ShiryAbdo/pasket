import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

class LoginData {
  String accessToken;
  String role;
  String expiresAt;
  String state;
  String tokenType;

  LoginData({
    this.accessToken = "",
    this.role = "",
    this.expiresAt = "",
    this.state = "",
    this.tokenType = "",
  });

  LoginData.fromJson(Map<String, dynamic>  map) :
        accessToken = map['access_token']  ?? "",
        role = map['role']  ?? "",
        expiresAt = map['expires_at']  ?? "",
        state = map['state']  ?? "",
        tokenType = map['token_type']  ?? "";

  Map<String, dynamic> toJson() => {
        'access_token': accessToken,
        'role': role,
        'expires_at': expiresAt,
        'state': state,
        'token_type': tokenType,
      };

  LoginData copyWith({
    String accessToken,
    String role,
    String expiresAt,
    String state,
    String tokenType,
  }) {
    return LoginData(
      accessToken: accessToken ?? this.accessToken,
      role: role ?? this.role,
      expiresAt: expiresAt ?? this.expiresAt,
      state: state ?? this.state,
      tokenType: tokenType ?? this.tokenType,
    );
  }

  static Future createTable(Database db) async {
    db.execute("""
            CREATE TABLE IF NOT EXISTS data (
              access_token TEXT,
              role TEXT,
              expires_at TEXT,
              state TEXT,
              token_type TEXT 
            )""");}

  LoginData.fromMap(Map<String, dynamic>  map) :
        accessToken = map['access_token'],
        role = map['role'],
        expiresAt = map['expires_at'],
        state = map['state'],
        tokenType = map['token_type'];

  Map<String, dynamic> toMap() => {
        'access_token': accessToken,
        'role': role,
        'expires_at': expiresAt,
        'state': state,
        'token_type': tokenType,
      };

}

