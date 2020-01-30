import 'package:plstka_app/data/model/LoginModel/loginmodel_data.dart';
import 'package:redux/redux.dart';
import 'package:plstka_app/redux/action_report.dart';
import 'package:plstka_app/redux/app/app_state.dart';
import 'package:plstka_app/redux/loginmodel/loginmodel_actions.dart';
 import 'package:plstka_app/data/remote/loginmodel_repository.dart';

//DataLogin
List<Middleware<AppState>> createLoginModelMiddleware([
  LoginModelRepository _repository = const LoginModelRepository(),
]) {
  final getDataLogin = _createGetDataLogin(_repository);

  return [
    TypedMiddleware<AppState, LoginActionNormaly>(getDataLogin),
  ];
}

Middleware<AppState> _createGetDataLogin(LoginModelRepository repository) {
  return (Store<AppState> store, dynamic action, NextDispatcher next) {
    running(next, action);
    repository
      ..loginNormaly(action.username, action.password)
          .then((item) {
        LoginModel loginData = LoginModel.fromJson(item);
        print("loginData  "+item.toString());
        next(SyncUserAction(user: loginData));
        completed(next, action);
      }).catchError((error) {
        catchError(next, action, error);
      });
//    }
  };
}

bool checkActionRunning(Store<AppState> store, action) {
  if (store.state.loginmodelState.status[action.actionName]?.status ==
      ActionStatus.running) {
    return true; // do nothing if there is a same action running.
  }
  return false;
}

void catchError(NextDispatcher next, action, error) {
  next(DataLoginStatusAction(
      report: ActionReport(
          actionName: action.actionName,
          status: ActionStatus.error,
          msg: "${action.actionName} is error;${error.toString()}")));
}

void completed(NextDispatcher next, action) {
  next(DataLoginStatusAction(
      report: ActionReport(
          actionName: action.actionName,
          status: ActionStatus.complete,
          msg: "${action.actionName} is completed")));
}

void noMoreItem(NextDispatcher next, action) {
  next(DataLoginStatusAction(
      report: ActionReport(
          actionName: action.actionName,
          status: ActionStatus.complete,
          msg: "no more items")));
}

void running(NextDispatcher next, action) {
  next(DataLoginStatusAction(
      report: ActionReport(
          actionName: action.actionName,
          status: ActionStatus.running,
          msg: "${action.actionName} is running")));
}

void idEmpty(NextDispatcher next, action) {
  next(DataLoginStatusAction(
      report: ActionReport(
          actionName: action.actionName,
          status: ActionStatus.error,
          msg: "Id is empty")));
}
