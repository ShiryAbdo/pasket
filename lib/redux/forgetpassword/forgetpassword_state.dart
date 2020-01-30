import 'package:meta/meta.dart';
import 'package:plstka_app/data/model/LoginModel/loginmodel_data.dart';
import 'package:plstka_app/data/model/confirmcouponmodel/confirmcouponmodel_data.dart';
import 'package:plstka_app/data/model/page_data.dart';
import 'package:plstka_app/redux/action_report.dart';


//Forgetpassword
class ForgetPasswordState {
   final List<ConfirmCouponModel> forgetPasswordList;
  final Map<String, ConfirmCouponModel> forgetPasswordModels;
  final Map<String, ActionReport> status;
  final ConfirmCouponModel forgetPasswordModel;

  ForgetPasswordState({
    @required this.forgetPasswordList,
    @required this.forgetPasswordModels,
    @required this.forgetPasswordModel,
    @required this.status,
   });

  ForgetPasswordState copyWith({
    List<ConfirmCouponModel> forgetPasswordList,
    Map<String, ConfirmCouponModel> forgetPasswordModels,
    ConfirmCouponModel forgetPasswordModel,
    Map<String, ActionReport> status,
    Page page,
  }) {
    return ForgetPasswordState(
      forgetPasswordList:
      forgetPasswordList ?? this.forgetPasswordList,
      forgetPasswordModels:
      forgetPasswordModels ?? this.forgetPasswordModels ?? Map(),
      forgetPasswordModel: forgetPasswordModel ?? this.forgetPasswordModel,
      status: status ?? this.status,
     );
  }
}
