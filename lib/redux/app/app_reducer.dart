import 'package:plstka_app/redux/contactusmodel/contactusmodel_reducer.dart';
import 'package:plstka_app/redux/perofilmodel/perofilmodel_reducer.dart';
import 'package:plstka_app/redux/loginmodel/loginmodel_reducer.dart';
import 'package:plstka_app/redux/app/app_state.dart';

///register all the Reducer here
///auto add new reducer when using haystack plugin
AppState appReducer(AppState state, dynamic action) {
  return new AppState(
    // contactusmodelState: contactusmodelReducer(state.contactusmodelState, action),
    // perofilmodelState: perofilmodelReducer(state.perofilmodelState, action),
    loginmodelState: loginmodelReducer(state.loginmodelState, action),
  );
}
