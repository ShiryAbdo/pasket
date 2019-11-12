import 'package:plstka_app/redux/contactusmodel/contactusmodel_state.dart';
import 'package:plstka_app/redux/perofilmodel/perofilmodel_state.dart';
import 'package:plstka_app/redux/loginmodel/loginmodel_state.dart';
import 'package:meta/meta.dart';
import 'package:plstka_app/data/model/page_data.dart';

/// manage all state of this project
/// auto add new state when using haystack plugin
/// configure the initialize of state
class AppState {
//  final ContactUsModelState contactusmodelState;
//  final PerofilModelState perofilmodelState;
  final LoginModelState loginmodelState;

  AppState({
//    @required this.contactusmodelState,
//    @required this.perofilmodelState,
    @required this.loginmodelState,

  });

  factory AppState.initial() {
    return AppState(
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
            page: Page(),),

    );
  }
}
