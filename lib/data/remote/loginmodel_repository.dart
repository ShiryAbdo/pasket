import 'dart:async';
import 'package:dio/dio.dart';
import 'package:plstka_app/data/db/Preference.dart';
import 'package:plstka_app/data/network_common.dart';

class LoginModelRepository {
  const LoginModelRepository();

  Future<Map> loginNormaly(String empho, String pass) {
    FormData formData = new FormData.from({

      "phone": empho,
      "password": pass,

     });
//    var _dio = NetworkCommon().dio;
//    _dio.options.headers= {"Authorization" : token};

    return new NetworkCommon().dio.post("login", data: formData).then((d) {
      var results = new NetworkCommon().decodeResp(d);
      Preference.load();
//      Preference.setString("device_id", udid);
      return results;
    });
  }
}
