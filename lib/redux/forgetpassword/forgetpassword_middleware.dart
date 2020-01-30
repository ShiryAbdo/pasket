import 'package:plstka_app/data/model/confirmcouponmodel/confirmcouponmodel_data.dart';
import 'package:plstka_app/data/remote/forget_password_repository.dart';
import 'package:plstka_app/redux/forgetpassword/forgetpassword_actions.dart';
import 'package:redux/redux.dart';
import 'package:plstka_app/redux/action_report.dart';
import 'package:plstka_app/redux/app/app_state.dart';

List<Middleware<AppState>> createForgetPasswordMiddleware([
  ForgetPasswordRepository _repository =
  const ForgetPasswordRepository(),
]) {
  final confirmCoupon = _confirmCoupon(_repository);

  return [
    TypedMiddleware<AppState, ForgetPasswordNormaly>(confirmCoupon),
  ];
}

Middleware<AppState> _confirmCoupon(ForgetPasswordRepository repository) {
  return (Store<AppState> store, dynamic action, NextDispatcher next) {
    running(next, action);
    repository
      ..forgetPasswordNormaly(action.phone).then((item) {
        print("item dkkd" + item.toString());
        ConfirmCouponModel confirmCouponModel =
        ConfirmCouponModel.fromJson(item);
        next(SyncForgetPasswordAction(forgetPasswordModel: confirmCouponModel));
        completed(next, action);
      }).catchError((error) {
        catchError(next, action, error);
      });
//    }
  };
}

bool checkActionRunning(Store<AppState> store, action) {
  if (store.state.forgetPasswordState.status[action.actionName]?.status ==
      ActionStatus.running) {
    return true; // do nothing if there is a same action running.
  }
  return false;
}

void catchError(NextDispatcher next, action, error) {
  next(GetForgetPasswordStatusAction(
      report: ActionReport(
          actionName: action.actionName,
          status: ActionStatus.error,
          msg: "${action.actionName} is error;${error.toString()}")));
}

void completed(NextDispatcher next, action) {
  next(GetForgetPasswordStatusAction(
      report: ActionReport(
          actionName: action.actionName,
          status: ActionStatus.complete,
          msg: "${action.actionName} is completed")));
}

void noMoreItem(NextDispatcher next, action) {
  next(GetForgetPasswordStatusAction(
      report: ActionReport(
          actionName: action.actionName,
          status: ActionStatus.complete,
          msg: "no more items")));
}

void running(NextDispatcher next, action) {
  next(GetForgetPasswordStatusAction(
      report: ActionReport(
          actionName: action.actionName,
          status: ActionStatus.running,
          msg: "${action.actionName} is running")));
}

void idEmpty(NextDispatcher next, action) {
  next(GetForgetPasswordStatusAction(
      report: ActionReport(
          actionName: action.actionName,
          status: ActionStatus.error,
          msg: "Id is empty")));
}
