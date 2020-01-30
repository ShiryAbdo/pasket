import 'package:meta/meta.dart';
import 'package:plstka_app/data/model/LoginModel/loginmodel_data.dart';
import 'package:plstka_app/redux/action_report.dart';

class DataLoginStatusAction {
  final String actionName = "DataLoginStatusAction";
  final ActionReport report;

  DataLoginStatusAction({@required this.report});
}

class SyncUserAction {
  final String actionName = "SyncUserAction";
  final LoginModel user;

  SyncUserAction({@required this.user});
}

class LoginActionNormaly {
  final String actionName = "LoginActionNormaly";
  final String username;
  final String password;

  LoginActionNormaly({
    @required this.username,
    @required this.password,
  });

  toJson() {
    return {
      'username': this.username,
      'password': this.password,
    };
  }
}
