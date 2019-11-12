//import 'package:meta/meta.dart';
//import 'package:plstka_app/data/model/loginmodel_data.dart';
//import 'package:plstka_app/data/model/perofilmodel_data.dart';
//import 'package:plstka_app/redux/action_report.dart';
//import 'package:plstka_app/data/model/page_data.dart';
//
//class GetPerofilModelsAction {
//  final String actionName = "GetPerofilModelsAction";
//  final bool isRefresh;
//
//  GetPerofilModelsAction({this.isRefresh});
//}
//
//class SyncPerofilAction {
//  final String actionName = "SyncPerofilAction";
//  final LoginModel user;
//
//  SyncPerofilAction({@required this.user});
//}
//
//class UpdatePerofil {
//  final String actionName = "UpdatePerofil";
//  final String username;
//  final String password;
//  final String udid;
//
//  UpdatePerofil({
//    @required this.username,
//    @required this.password,
//    @required this.udid,
//  });
//
//  toJson() {
//    return {
//      'username': this.username,
//      'password': this.password,
//      'udid': this.udid,
//    };
//  }
//}
