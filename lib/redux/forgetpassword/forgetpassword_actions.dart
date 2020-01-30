import 'package:meta/meta.dart';
import 'package:plstka_app/data/model/confirmcouponmodel/confirmcouponmodel_data.dart';
import 'package:plstka_app/redux/action_report.dart';

//ForgetPassword
class GetForgetPasswordStatusAction {
  final String actionName = "GetForgetPasswordStatusAction";
  final ActionReport report;

  GetForgetPasswordStatusAction({@required this.report});
}

class SyncForgetPasswordAction {
  final String actionName = "SyncForgetPasswordAction";
  final ConfirmCouponModel forgetPasswordModel;

  SyncForgetPasswordAction({@required this.forgetPasswordModel});
}

class ForgetPasswordNormaly {
  final String actionName = "ForgetPasswordNormaly";
  final String phone;

  ForgetPasswordNormaly({
    @required this.phone,
   });

  toJson() {
    return {
      'phone': this.phone,
     };
  }
}
