import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:sqflite/sqflite.dart';

import 'info_data.dart';

class LoginData {
  String accessToken;
  String role;
  String expiresAt;
  String state;
  String tokenType;
  Info info;

  LoginData({
    this.accessToken = "",
    this.role = "",
    this.expiresAt = "",
    this.state = "",
    this.tokenType = "",
    this.info,
  });

  LoginData.fromJson(Map<String, dynamic>  map) :
        accessToken = map['access_token']  ?? "",
        role = map['role']  ?? "",
        expiresAt = map['expires_at']  ?? "",
        state = map['state']  ?? "",
        tokenType = map['token_type']  ?? "",
        info = map['info'] == null
            ? null
            : Info.fromJson(map['info']);

  Map<String, dynamic> toJson() => {
    'access_token': accessToken,
    'role': role,
    'expires_at': expiresAt,
    'state': state,
    'token_type': tokenType,
    'info': info.toJson(),
  };

  LoginData copyWith({
    String accessToken,
    String role,
    String expiresAt,
    String state,
    String tokenType,
    Info info,
  }) {
    return LoginData(
      accessToken: accessToken ?? this.accessToken,
      role: role ?? this.role,
      expiresAt: expiresAt ?? this.expiresAt,
      state: state ?? this.state,
      tokenType: tokenType ?? this.tokenType,
      info: info ?? this.info,
    );
  }

}

