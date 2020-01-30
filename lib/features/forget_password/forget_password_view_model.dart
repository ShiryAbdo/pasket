import 'package:plstka_app/data/model/LoginModel/loginmodel_data.dart';
import 'package:plstka_app/data/model/confirmcouponmodel/confirmcouponmodel_data.dart';
import 'package:plstka_app/redux/forgetpassword/forgetpassword_actions.dart';
import 'package:plstka_app/redux/loginmodel/loginmodel_actions.dart';
import 'package:redux/redux.dart';
import 'package:plstka_app/redux/action_report.dart';
import 'package:plstka_app/redux/app/app_state.dart';





class ForgetPasswordModel {
  final ConfirmCouponModel forgetPasswordModel;
   final Function(String) forgetPasswordFun;
  final ActionReport forgetPasswordReport;

  ForgetPasswordModel({
    this.forgetPasswordModel,
    this.forgetPasswordReport,
    this.forgetPasswordFun,
   });

  static ForgetPasswordModel fromStore(Store<AppState> store) {
    return ForgetPasswordModel(
      forgetPasswordModel: store.state.forgetPasswordState.forgetPasswordModel,

      forgetPasswordFun: (phone) {
        store.dispatch(
            ForgetPasswordNormaly(phone: phone));
      },
      forgetPasswordReport: store.state.forgetPasswordState.status["ForgetPasswordNormaly"],
    );
  }
}
