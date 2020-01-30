import 'package:meta/meta.dart';
import 'package:plstka_app/data/model/LoginModel/loginmodel_data.dart';
 import 'package:plstka_app/data/model/page_data.dart';
import 'package:plstka_app/redux/action_report.dart';

class LoginModelState {
  final Map<String, LoginModel> loginmodels;
  final LoginModel loginmodel;
  final Map<String, ActionReport> status;
  final Page page;

  LoginModelState({
    @required this.loginmodels,
    @required this.loginmodel,
    @required this.status,
    @required this.page,
  });

  LoginModelState copyWith({
    Map<String, LoginModel> loginmodels,
    LoginModel loginmodel,
    Map<String, ActionReport> status,
    Page page,
  }) {
    return LoginModelState(
      loginmodels: loginmodels ?? this.loginmodels ?? Map(),
      loginmodel: loginmodel ?? this.loginmodel,
      status: status ?? this.status,
      page: page ?? this.page,
    );
  }
}
