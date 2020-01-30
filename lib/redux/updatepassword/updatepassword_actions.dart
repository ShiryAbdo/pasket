import 'package:meta/meta.dart';
import 'package:plstka_app/data/model/updatepasswordmodel/updatepassword_data.dart';
import 'package:plstka_app/redux/action_report.dart';

//UpdatePassword
class GetUpdatePasswordStatusAction {
  final String actionName = "GetUpdatePasswordStatusAction";
  final ActionReport report;

  GetUpdatePasswordStatusAction({@required this.report});
}

class SyncUpdatePasswordAction {
  final String actionName = "SyncUpdatePasswordAction";
  final UpdatePassword updatePasswordModel;

  SyncUpdatePasswordAction({@required this.updatePasswordModel});
}

class UpdatePasswordNormaly {
  final String actionName = "UpdatePasswordNormaly";
  final String password;
  final String password_confirmation;
  final String oldPassword;
  final String token;

  UpdatePasswordNormaly({
    @required this.password,
    @required this.password_confirmation,
    @required this.oldPassword,
    @required this.token,
   });

  toJson() {
    return {
      'password': this.password,
      'password_confirmation': this.password_confirmation,
      'oldPassword': this.oldPassword,
     };
  }
}
