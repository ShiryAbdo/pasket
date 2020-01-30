import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:plstka_app/data/model/updatepasswordmodel/data_data.dart';

class UpdatePassword {
  Data data;
  int count;
  String message;
  bool status;

  UpdatePassword({
    this.data,
    this.count = 0,
    this.message = "",
    this.status = false,
  });

  UpdatePassword.fromJson(Map<String, dynamic>  map) :
        data = map['data'] == null
            ? null
            : Data.fromJson(map['data']),
        count = map['count']  ?? 0,
        message = map['message']  ?? "",
        status = map['status']  ?? false;

  Map<String, dynamic> toJson() => {
        'data': data.toJson(),
        'count': count,
        'message': message,
        'status': status,
      };

  UpdatePassword copyWith({
    Data data,
    int count,
    String message,
    bool status,
  }) {
    return UpdatePassword(
      data: data ?? this.data,
      count: count ?? this.count,
      message: message ?? this.message,
      status: status ?? this.status,
    );
  }

}

