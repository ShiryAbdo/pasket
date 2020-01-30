import 'package:redux/redux.dart';

import 'forgetpassword_actions.dart';
import 'forgetpassword_state.dart';

final forgetPasswordReducer = combineReducers<ForgetPasswordState>([
  TypedReducer<ForgetPasswordState, SyncForgetPasswordAction>(
      _syncConfirmCouponModels),

  TypedReducer<ForgetPasswordState, GetForgetPasswordStatusAction>(
      _searchConfirmCouponModelStatus),

  // TypedReducer<LoginModelState, ClearDataAction>(_clearData),
]);

ForgetPasswordState _searchConfirmCouponModelStatus(
    ForgetPasswordState state, GetForgetPasswordStatusAction action) {
  var status = state.status ?? Map();
  status.update(action.report.actionName, (v) => action.report,
      ifAbsent: () => action.report);
  return state.copyWith(status: status);
}

ForgetPasswordState _syncConfirmCouponModels(
    ForgetPasswordState state, SyncForgetPasswordAction action) {
  return state.copyWith(forgetPasswordModel: action.forgetPasswordModel);
}

// LoginModelState _clearData(LoginModelState state, ClearDataAction action) {
//   return state = AppState.initial().loginmodelState;
// }
