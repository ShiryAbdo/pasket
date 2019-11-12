import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:plstka_app/data/db/Preference.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'model/LoginModel/loginmodel_data.dart';

class NetworkCommon {
  static final NetworkCommon _singleton = new NetworkCommon._internal();

  factory NetworkCommon() {
    return _singleton;
  }

  NetworkCommon._internal();

  final JsonDecoder _decoder = new JsonDecoder();

  dynamic decodeResp(d) {
    // ignore: cast_to_non_type
    if (d is Response) {
      final dynamic jsonBody = d.data;

      final statusCode = d.statusCode;
      print("statusCode  " + statusCode.toString());

      if (statusCode < 200 || statusCode >= 300 || jsonBody == null) {
        throw new Exception("statusCode: $statusCode");
      }

      if (jsonBody is String) {
        return _decoder.convert(jsonBody);
      } else {
        return jsonBody;
      }
    } else {
      throw d;
    }
  }

  Dio get dio {
    Dio dio = new Dio();
//    dio.interceptors.add(alice.getDioInterceptor());
    // Set default configs
    dio.options.baseUrl = 'http://plstka.com/api/auth/';
    dio.options.connectTimeout = 50000; //5s
    dio.options.receiveTimeout = 30000;
    dio.options.followRedirects = false;
    dio.interceptors
        .add(InterceptorsWrapper(onRequest: (RequestOptions options) async {
      /// Do something before request is sent
      /// set the token
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String token = prefs.getString('token');
      if (token != null) {
        options.headers["Authorization"] = "Bearer " + token;
      }

//      print("Pre request:${options.method},${options.baseUrl}${options.path}");
//      print("Pre request:${options.headers.toString()}");

      return options; //continue
    }, onResponse: (Response response) async {
      // Do something with response data
      final int statusCode = response.statusCode;
      if (statusCode >= 200 || statusCode < 300) {
//      if (statusCode == 200) {
        if (response.request.path == "login") {
          Preference.load();
          Map jsonData = json.decode(response.toString());

          var user = LoginModel.fromJson(jsonData);
          if (user.status) {
            print("accessToken   " + user.data.accessToken.toString());
            SharedPreferences prefs = await SharedPreferences.getInstance();
            prefs.setString("user_data", response.toString());
            prefs.setBool("CheckLogin", true);

            print("response   " + response.toString());
          }
        }
      } else if (statusCode == 401) {
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        var username = prefs.getString("username");
        var password = prefs.getString("password");
        FormData formData = new FormData.from({
          "username": username,
          "password": password,
        });
        // new Dio().post("login/", data: formData).then((resp) {
        //   final String jsonBody = response.data;
        //   final JsonDecoder _decoder = new JsonDecoder();
        //   final resultContainer = _decoder.convert(jsonBody);
        //   final int code = resultContainer['code'];
        //   if (code == 0) {
        //     final Map results = resultContainer['data'];
        //     prefs.setString("token", results["token"]);
        //     prefs.setInt("expired", results["expired"]);

        //     RequestOptions ro = response.request;
        //     ro.headers["Authorization"] = "Bearer ${prefs.getString('token')}";
        //     return ro;
        //   } else {
        //     throw Exception("Exception in re-login");
        //   }
        // });
      }

//      print(
//          "Response From:${response.request.method},${response.request.baseUrl}${response.request.path}");
//      print("Response From:${response.toString()}");
      return response; // continue
    }, onError: (DioError e) {
      print("DioError_shimaa " + e.toString());

      // Do something with response error
      return e; //continue
    }));
    return dio;
  }
}
