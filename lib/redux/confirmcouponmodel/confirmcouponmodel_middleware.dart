import 'package:plstka_app/data/model/confirmcouponmodel/confirmcouponmodel_data.dart';
import 'package:redux/redux.dart';
import 'package:plstka_app/redux/action_report.dart';
import 'package:plstka_app/redux/app/app_state.dart';
import 'package:plstka_app/redux/confirmcouponmodel/confirmcouponmodel_actions.dart';
import 'package:plstka_app/data/remote/confirmcouponmodel_repository.dart';

List<Middleware<AppState>> createConfirmCouponModelMiddleware([
  ConfirmCouponModelRepository _repository =
      const ConfirmCouponModelRepository(),
]) {
  final confirmCoupon = _confirmCoupon(_repository);

  return [
    TypedMiddleware<AppState, ConfirmCouponnNormaly>(confirmCoupon),
  ];
}

Middleware<AppState> _confirmCoupon(ConfirmCouponModelRepository repository) {
  return (Store<AppState> store, dynamic action, NextDispatcher next) {
    running(next, action);
    repository
      ..createConfirmCouponModel(action.code, action.token).then((item) {
        print("item dkkd" + item.toString());
        // int count = item['count'] ?? 0;
        // String message = item['message'] ?? "";

        // bool status = item['status'] ?? false;
        // if (status) {
        //   print("ype");
        //   var nnn = item['data'];
        //   Data loginData = item['data'] == null || item['data'] == []
        //       ? null
        //       : Data.fromJson(item['data']);
        //   print(loginData);
        //   // Data data =
        //   //     item['data'] == null || item['data'] == [] ? null : item['data'];
        // }
        // ConfirmCouponModel confirmCouponModel = ConfirmCouponModel(
        //     count: count,
        //     data: null,
        //     message: message,
        //     error: null,
        //     status: status);
        ConfirmCouponModel confirmCouponModel =
            ConfirmCouponModel.fromJson(item);
        next(SyncConfirmCouponAction(confirmcouponmodel: confirmCouponModel));
        completed(next, action);
      }).catchError((error) {
        catchError(next, action, error);
      });
//    }
  };
}

bool checkActionRunning(Store<AppState> store, action) {
  if (store.state.confirmcouponmodelState.status[action.actionName]?.status ==
      ActionStatus.running) {
    return true; // do nothing if there is a same action running.
  }
  return false;
}

void catchError(NextDispatcher next, action, error) {
  next(GetConfirmCouponStatusAction(
      report: ActionReport(
          actionName: action.actionName,
          status: ActionStatus.error,
          msg: "${action.actionName} is error;${error.toString()}")));
}

void completed(NextDispatcher next, action) {
  next(GetConfirmCouponStatusAction(
      report: ActionReport(
          actionName: action.actionName,
          status: ActionStatus.complete,
          msg: "${action.actionName} is completed")));
}

void noMoreItem(NextDispatcher next, action) {
  next(GetConfirmCouponStatusAction(
      report: ActionReport(
          actionName: action.actionName,
          status: ActionStatus.complete,
          msg: "no more items")));
}

void running(NextDispatcher next, action) {
  next(GetConfirmCouponStatusAction(
      report: ActionReport(
          actionName: action.actionName,
          status: ActionStatus.running,
          msg: "${action.actionName} is running")));
}

void idEmpty(NextDispatcher next, action) {
  next(GetConfirmCouponStatusAction(
      report: ActionReport(
          actionName: action.actionName,
          status: ActionStatus.error,
          msg: "Id is empty")));
}
