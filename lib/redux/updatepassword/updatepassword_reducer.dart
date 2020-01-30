import 'package:plstka_app/redux/updatepassword/updatePassword_state.dart';
import 'package:plstka_app/redux/updatepassword/updatepassword_actions.dart';
import 'package:redux/redux.dart';



final updatePasswordReducer = combineReducers<UpdatePasswordState>([
  TypedReducer<UpdatePasswordState, SyncUpdatePasswordAction>(
      _syncConfirmCouponModels),

  TypedReducer<UpdatePasswordState, GetUpdatePasswordStatusAction>(
      _searchConfirmCouponModelStatus),

  // TypedReducer<LoginModelState, ClearDataAction>(_clearData),
]);

UpdatePasswordState _searchConfirmCouponModelStatus(
    UpdatePasswordState state, GetUpdatePasswordStatusAction action) {
  var status = state.status ?? Map();
  status.update(action.report.actionName, (v) => action.report,
      ifAbsent: () => action.report);
  return state.copyWith(status: status);
}

UpdatePasswordState _syncConfirmCouponModels(
    UpdatePasswordState state, SyncUpdatePasswordAction action) {
  return state.copyWith(updatePasswordModel: action.updatePasswordModel);
}

// LoginModelState _clearData(LoginModelState state, ClearDataAction action) {
//   return state = AppState.initial().loginmodelState;
// }
