import 'dart:async';
import 'package:plstka_app/data/model/confirmcouponmodel/confirmcouponmodel_data.dart';
import 'package:plstka_app/redux/confirmcouponmodel/confirmcouponmodel_actions.dart';
import 'package:redux/redux.dart';
import 'package:plstka_app/redux/action_report.dart';
import 'package:plstka_app/redux/app/app_state.dart';

class ScanViewViewModel {
  ConfirmCouponModel confirmcouponmodel;
  final Function(String, String) getConfirmCouponModel;
  final ActionReport getConfirmCouponModelReport;

  ScanViewViewModel({
    this.confirmcouponmodel,
    this.getConfirmCouponModel,
    this.getConfirmCouponModelReport,
  });

  static ScanViewViewModel fromStore(Store<AppState> store) {
    return ScanViewViewModel(
      confirmcouponmodel:
          store.state.confirmcouponmodelState.confirmcouponmodel,
      getConfirmCouponModel: (code, token) {
        store.dispatch(ConfirmCouponnNormaly(code: code, token: token));
      },
      getConfirmCouponModelReport:
          store.state.confirmcouponmodelState.status["ConfirmCouponnNormaly"],
    );
  }
}
