import 'dart:async';
import 'package:dio/dio.dart';
import 'package:plstka_app/data/network_common.dart';

class ContactUsModelRepository {
  const ContactUsModelRepository();

  Future<Map> sendContactUs(String empho, String pass, String udid) {
    FormData formData = new FormData.from({
      "empho": empho,
      "pass": pass,
      "mode": "check",
      "type": "login",
      "udid": udid,
    });
    return new NetworkCommon().dio.post("type=login", data: formData).then((d) {
      var results = new NetworkCommon().decodeResp(d);
      return results;
    });
  }
}
