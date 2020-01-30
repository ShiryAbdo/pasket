import 'package:plstka_app/data/model/LoginModel/loginmodel_data.dart';
import 'package:plstka_app/data/model/confirmcouponmodel/confirmcouponmodel_data.dart';
import 'package:plstka_app/data/model/updatepasswordmodel/updatepassword_data.dart';
import 'package:plstka_app/redux/forgetpassword/forgetpassword_actions.dart';
import 'package:plstka_app/redux/updatepassword/updatepassword_actions.dart';
import 'package:redux/redux.dart';
import 'package:plstka_app/redux/action_report.dart';
import 'package:plstka_app/redux/app/app_state.dart';





class UpdatePasswordModel {
  final UpdatePassword updatePasswordModel;
  final Function(String ,String ,String ,String) updatePasswordFun;
  final ActionReport updatePasswordReport;

  UpdatePasswordModel({
    this.updatePasswordModel,
    this.updatePasswordFun,
    this.updatePasswordReport,
   });

  static UpdatePasswordModel fromStore(Store<AppState> store) {
    return UpdatePasswordModel(
      updatePasswordModel: store.state.updatePasswordState.updatePasswordModel,

      updatePasswordFun: ( newpassword ,password_confirmation ,oldPassword ,token) {
        store.dispatch(
            UpdatePasswordNormaly(password: newpassword ,password_confirmation:password_confirmation ,oldPassword:oldPassword,token:token));
      },
      updatePasswordReport: store.state.updatePasswordState.status["UpdatePasswordNormaly"],
    );
  }
}
