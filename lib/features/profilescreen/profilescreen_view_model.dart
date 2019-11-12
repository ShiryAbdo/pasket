import 'package:redux/redux.dart';
//import 'package:plstka_app/data/model/perofilmodel_data.dart';
import 'package:plstka_app/redux/action_report.dart';
import 'package:plstka_app/redux/app/app_state.dart';
import 'package:plstka_app/redux/perofilmodel/perofilmodel_actions.dart';

class ProfileScreenViewModel {
//  final PerofilModel perofilmodel;
  final Function() getPerofilModel;
  final ActionReport getPerofilModelReport;

  ProfileScreenViewModel({
//    this.perofilmodel,
    this.getPerofilModel,
    this.getPerofilModelReport,
  });

  static ProfileScreenViewModel fromStore(Store<AppState> store) {
    return ProfileScreenViewModel(
//      perofilmodel: store.state.perofilmodelState.perofilmodel,
      getPerofilModel: () {
        // store.dispatch(GetPerofilModelAction());
      },
//      getPerofilModelReport:
//          store.state.perofilmodelState.status["GetPerofilModelAction"],
    );
  }
}
