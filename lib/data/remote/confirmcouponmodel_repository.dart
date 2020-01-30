import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:plstka_app/data/db/Preference.dart';
import 'package:plstka_app/data/network_common.dart';

class ConfirmCouponModelRepository {
  const ConfirmCouponModelRepository();

  Future<Map> createConfirmCouponModel(String code,String token) {
    FormData formData = new FormData.from({"code": code});
    print("code " + code.toString());
    var _dio = NetworkCommon().dio;

    _dio.options.headers["Authorization"] = "Bearer " + token;

    return _dio
        .post(
      "coupon/confirmCoupon",
      data: formData,
    )
        .then((d) {
      var results = new NetworkCommon().decodeResp(d);
      print("results " + results.toString());
      return results;
    });
  }
}
