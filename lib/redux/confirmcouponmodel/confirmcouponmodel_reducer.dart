import 'package:redux/redux.dart';
import 'package:plstka_app/redux/confirmcouponmodel/confirmcouponmodel_actions.dart';
import 'package:plstka_app/redux/confirmcouponmodel/confirmcouponmodel_state.dart';

final confirmcouponmodelReducer = combineReducers<ConfirmCouponModelState>([
  TypedReducer<ConfirmCouponModelState, SyncConfirmCouponAction>(
      _syncConfirmCouponModels),

  TypedReducer<ConfirmCouponModelState, GetConfirmCouponStatusAction>(
      _searchConfirmCouponModelStatus),

  // TypedReducer<LoginModelState, ClearDataAction>(_clearData),
]);

ConfirmCouponModelState _searchConfirmCouponModelStatus(
    ConfirmCouponModelState state, GetConfirmCouponStatusAction action) {
  var status = state.status ?? Map();
  status.update(action.report.actionName, (v) => action.report,
      ifAbsent: () => action.report);
  return state.copyWith(status: status);
}

ConfirmCouponModelState _syncConfirmCouponModels(
    ConfirmCouponModelState state, SyncConfirmCouponAction action) {
  return state.copyWith(confirmcouponmodel: action.confirmcouponmodel);
}

// LoginModelState _clearData(LoginModelState state, ClearDataAction action) {
//   return state = AppState.initial().loginmodelState;
// }
