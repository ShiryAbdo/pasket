import 'package:plstka_app/redux/confirmcouponmodel/confirmcouponmodel_reducer.dart';
import 'package:plstka_app/redux/forgetpassword/forgetpassword_reducer.dart';
import 'package:plstka_app/redux/loginmodel/loginmodel_reducer.dart';
import 'package:plstka_app/redux/app/app_state.dart';
import 'package:plstka_app/redux/updatepassword/updatepassword_reducer.dart';

///register all the Reducer here
///auto add new reducer when using haystack plugin
AppState appReducer(AppState state, dynamic action) {
  return new AppState(
    confirmcouponmodelState:
        confirmcouponmodelReducer(state.confirmcouponmodelState, action),
    loginmodelState: loginmodelReducer(state.loginmodelState, action),
    forgetPasswordState: forgetPasswordReducer(state.forgetPasswordState, action),
    updatePasswordState: updatePasswordReducer(state.updatePasswordState, action),


  );
}
