import 'dart:async';
import 'package:dio/dio.dart';
import 'package:plstka_app/data/db/Preference.dart';
import 'package:plstka_app/data/network_common.dart';

class ForgetPasswordRepository {
  const ForgetPasswordRepository();

  Future<Map> forgetPasswordNormaly(String phone) {
    FormData formData = new FormData.from({
      "phone": phone,
    });
//    var _dio = NetworkCommon().dio;
//    _dio.options.headers= {"Authorization" : token};

    return new NetworkCommon()
        .dio
        .post("client/setCode", data: formData)
        .then((d) {
      var results = new NetworkCommon().decodeResp(d);
      Preference.load();
       return results;
    });
  }
}
