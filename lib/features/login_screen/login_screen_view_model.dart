import 'package:plstka_app/data/model/LoginModel/loginmodel_data.dart';
import 'package:plstka_app/redux/loginmodel/loginmodel_actions.dart';
import 'package:redux/redux.dart';
import 'package:plstka_app/redux/action_report.dart';
import 'package:plstka_app/redux/app/app_state.dart';

class LoginScreenViewModel {
  final LoginModel loginModel;
  final ActionReport getLoginModelReport;
  final Function(String, String) login;
  final ActionReport loginReport;

  LoginScreenViewModel({
    this.loginModel,
    this.getLoginModelReport,
    this.login,
    this.loginReport,
  });

  static LoginScreenViewModel fromStore(Store<AppState> store) {
    return LoginScreenViewModel(
      loginModel: store.state.loginmodelState.loginmodel,
      getLoginModelReport:
          store.state.loginmodelState.status["LoginActionNormaly"],
      login: (username, password) {
        store.dispatch(
            LoginActionNormaly(username: username, password: password));
      },
      loginReport: store.state.loginmodelState.status["LoginActionNormaly"],
    );
  }
}
