import 'package:plstka_app/data/model/confirmcouponmodel/confirmcouponmodel_data.dart';
import 'package:plstka_app/data/model/updatepasswordmodel/updatepassword_data.dart';
import 'package:plstka_app/data/remote/updatepassword_repository.dart';
import 'package:plstka_app/redux/updatepassword/updatepassword_actions.dart';
import 'package:redux/redux.dart';
import 'package:plstka_app/redux/action_report.dart';
import 'package:plstka_app/redux/app/app_state.dart';

List<Middleware<AppState>> createUpdatePasswordMiddleware([
  UpdatePasswordRepository _repository =
  const UpdatePasswordRepository(),
]) {
  final confirmCoupon = _confirmCoupon(_repository);

  return [
    TypedMiddleware<AppState, UpdatePasswordNormaly>(confirmCoupon),
  ];
}

Middleware<AppState> _confirmCoupon(UpdatePasswordRepository repository) {
  return (Store<AppState> store, dynamic action, NextDispatcher next) {
    running(next, action);
    repository
      ..updatePasswordNormaly( action.password ,action.password_confirmation ,action.oldPassword ,action.token).then((item) {
        print("item" + item.toString());
        UpdatePassword updatePassword =
        UpdatePassword.fromJson(item);
        next(SyncUpdatePasswordAction(updatePasswordModel: updatePassword));
        completed(next, action);
      }).catchError((error) {
        catchError(next, action, error);
      });
//    }
  };
}

bool checkActionRunning(Store<AppState> store, action) {
  if (store.state.updatePasswordState.status[action.actionName]?.status ==
      ActionStatus.running) {
    return true; // do nothing if there is a same action running.
  }
  return false;
}

void catchError(NextDispatcher next, action, error) {
  next(GetUpdatePasswordStatusAction(
      report: ActionReport(
          actionName: action.actionName,
          status: ActionStatus.error,
          msg: "${action.actionName} is error;${error.toString()}")));
}

void completed(NextDispatcher next, action) {
  next(GetUpdatePasswordStatusAction(
      report: ActionReport(
          actionName: action.actionName,
          status: ActionStatus.complete,
          msg: "${action.actionName} is completed")));
}

void noMoreItem(NextDispatcher next, action) {
  next(GetUpdatePasswordStatusAction(
      report: ActionReport(
          actionName: action.actionName,
          status: ActionStatus.complete,
          msg: "no more items")));
}

void running(NextDispatcher next, action) {
  next(GetUpdatePasswordStatusAction(
      report: ActionReport(
          actionName: action.actionName,
          status: ActionStatus.running,
          msg: "${action.actionName} is running")));
}

void idEmpty(NextDispatcher next, action) {
  next(GetUpdatePasswordStatusAction(
      report: ActionReport(
          actionName: action.actionName,
          status: ActionStatus.error,
          msg: "Id is empty")));
}
