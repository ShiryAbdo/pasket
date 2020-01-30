import 'package:plstka_app/redux/loginmodel/loginmodel_actions.dart';
import 'package:plstka_app/redux/loginmodel/loginmodel_state.dart';
import 'package:redux/redux.dart';

final loginmodelReducer = combineReducers<LoginModelState>([
  TypedReducer<LoginModelState, DataLoginStatusAction>(_loginmodelStatus),
  TypedReducer<LoginModelState, SyncUserAction>(_syncUser),
  // TypedReducer<LoginModelState, ClearDataAction>(_clearData),
]);

LoginModelState _loginmodelStatus(
    LoginModelState state, DataLoginStatusAction action) {
  var status = state.status ?? Map();
  status.update(action.report.actionName, (v) => action.report,
      ifAbsent: () => action.report);
  return state.copyWith(status: status);
}

LoginModelState _syncUser(LoginModelState state, SyncUserAction action) {
  return state.copyWith(loginmodel: action.user);
}

// LoginModelState _clearData(LoginModelState state, ClearDataAction action) {
//   return state = AppState.initial().loginmodelState;
// }
