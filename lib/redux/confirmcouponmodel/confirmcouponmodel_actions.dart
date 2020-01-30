import 'package:meta/meta.dart';
import 'package:plstka_app/data/model/confirmcouponmodel/confirmcouponmodel_data.dart';
import 'package:plstka_app/redux/action_report.dart';

class GetConfirmCouponStatusAction {
  final String actionName = "GetConfirmCouponStatusAction";
  final ActionReport report;

  GetConfirmCouponStatusAction({@required this.report});
}

class SyncConfirmCouponAction {
  final String actionName = "SyncConfirmCouponAction";
  final ConfirmCouponModel confirmcouponmodel;

  SyncConfirmCouponAction({@required this.confirmcouponmodel});
}

class ConfirmCouponnNormaly {
  final String actionName = "ConfirmCouponnNormaly";
  final String code;
  final String token;

  ConfirmCouponnNormaly({
    @required this.code,
    @required this.token,
  });

  toJson() {
    return {
      'code': this.code,
      // 'token': this.token,
    };
  }
}
