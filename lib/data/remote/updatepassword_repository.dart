import 'dart:async';
import 'package:dio/dio.dart';
import 'package:plstka_app/data/db/Preference.dart';
import 'package:plstka_app/data/network_common.dart';

class UpdatePasswordRepository {
  const UpdatePasswordRepository();

  Future<Map> updatePasswordNormaly(String password,
      String password_confirmation ,String oldPassword ,String token) {
    print("password " + password.toString());
    print("password_confirmation " + password_confirmation.toString());
    print("oldPassword " + oldPassword.toString());



    FormData formData = new FormData.from({
      "password": password,
      "password_confirmation": password_confirmation,
      "oldPassword": oldPassword,

    });
    var _dio = NetworkCommon().dio;

    _dio.options.headers["Authorization"] = "Bearer " + token;
//    _dio.options.headers["Authorization"] = "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiIsImp0aSI6IjYxZWU3M2VlODliNmM5MjI0YmE3ZTVjMzkzYzRiZTM2ZWZkMDJkYWI5OGVlZmVlOGFiY2RjZDhhMWFkN2RkODljYzBmZjA0OWM3NDE3ZjA0In0.eyJhdWQiOiIzIiwianRpIjoiNjFlZTczZWU4OWI2YzkyMjRiYTdlNWMzOTNjNGJlMzZlZmQwMmRhYjk4ZWVmZWU4YWJjZGNkOGExYWQ3ZGQ4OWNjMGZmMDQ5Yzc0MTdmMDQiLCJpYXQiOjE1Nzk5NzI5MzcsIm5iZiI6MTU3OTk3MjkzNywiZXhwIjoxNjExNTk1MzM3LCJzdWIiOiIxNyIsInNjb3BlcyI6W119.aEHv-9luJrERn7PdSP-SLeeWDYx1a2c-BZHbryrczy_SLByKuhyhD_Ur2nfi_RfL8mnfiD-PzOH2ZYPVV0bA9Q";


    return _dio
        .post(
      "client/updatePassword",
      data: formData,
    )
        .then((d) {
      var results = new NetworkCommon().decodeResp(d);
      print("results " + results.toString());
      return results;
    });
  }
}
