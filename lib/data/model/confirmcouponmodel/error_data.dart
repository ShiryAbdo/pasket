import 'dart:convert';
import 'package:intl/intl.dart';

class ErrorC {
  List<String> code;

  ErrorC({
    this.code,
  });

  ErrorC.fromJson(Map<String, dynamic>  map) :
        code = map['code'] == null
            ? []
            : map['code'].cast<String>().toList();

  Map<String, dynamic> toJson() => {
        'code': code,
      };

  ErrorC copyWith({
    List<String> code,
  }) {
    return ErrorC(
      code: code ?? this.code,
    );
  }

}

