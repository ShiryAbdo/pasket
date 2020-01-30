import 'package:plstka_app/redux/confirmcouponmodel/confirmcouponmodel_state.dart';
import 'package:plstka_app/redux/forgetpassword/forgetpassword_state.dart';
import 'package:plstka_app/redux/loginmodel/loginmodel_state.dart';
import 'package:meta/meta.dart';
import 'package:plstka_app/data/model/page_data.dart';
import 'package:plstka_app/redux/updatepassword/updatePassword_state.dart';

/// manage all state of this project
/// auto add new state when using haystack plugin
/// configure the initialize of state
class AppState {
  final ConfirmCouponModelState confirmcouponmodelState;
  final ForgetPasswordState forgetPasswordState ;
  final LoginModelState loginmodelState;
  final UpdatePasswordState updatePasswordState ;

  AppState({
    @required this.confirmcouponmodelState,
    @required this.forgetPasswordState,
    @required this.loginmodelState,
    @required this.updatePasswordState,
  });

  factory AppState.initial() {
    return AppState(
      updatePasswordState: UpdatePasswordState(
        updatePasswordModel: null,
        updatePasswordModels: Map(),
        status: Map(),
         updatePasswordList: null,
      ),
      confirmcouponmodelState: ConfirmCouponModelState(
        confirmcouponmodel: null,
        confirmcouponmodels: Map(),
        status: Map(),
        page: Page(),
        searchConfirmCouponModels: null,
      ),
      forgetPasswordState: ForgetPasswordState(
        forgetPasswordModel: null,
        forgetPasswordModels: Map(),
        status: Map(),
         forgetPasswordList: null,
      ),


//        contactusmodelState: ContactUsModelState(
//            contactusmodel: null,
//            contactusmodels: Map(),
//            status: Map(),
//            page: Page(),),
//        perofilmodelState: PerofilModelState(
//            perofilmodel: null,
//            perofilmodels: Map(),
//            status: Map(),
//            page: Page(),),
      loginmodelState: LoginModelState(
        loginmodel: null,
        loginmodels: Map(),
        status: Map(),
        page: Page(),
      ),
    );
  }
}
