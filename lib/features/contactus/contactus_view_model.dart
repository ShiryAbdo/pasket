//import 'package:redux/redux.dart';
//import 'package:plstka_app/data/model/contactusmodel_data.dart';
//import 'package:plstka_app/redux/action_report.dart';
//import 'package:plstka_app/redux/app/app_state.dart';
//import 'package:plstka_app/redux/contactusmodel/contactusmodel_actions.dart';
//
//class ContactUsViewModel {
//  final ContactUsModel contactusmodel;
//  final List<ContactUsModel> contactusmodels;
//  final Function(bool) getContactUsModels;
//  final ActionReport getContactUsModelsReport;
//  final Function() getContactUsModel;
//  final ActionReport getContactUsModelReport;
//
//  ContactUsViewModel({
//    this.contactusmodel,
//    this.contactusmodels,
//    this.getContactUsModels,
//    this.getContactUsModelsReport,
//    this.getContactUsModel,
//    this.getContactUsModelReport,
//  });
//
//  static ContactUsViewModel fromStore(Store<AppState> store) {
//    return ContactUsViewModel(
//      contactusmodel: store.state.contactusmodelState.contactusmodel,
//      contactusmodels:
//          store.state.contactusmodelState.contactusmodels.values.toList() ?? [],
//      getContactUsModels: (isRefresh) {
//        store.dispatch(GetContactUsModelsAction(isRefresh: isRefresh));
//      },
//      getContactUsModelsReport:
//          store.state.contactusmodelState.status["GetContactUsModelsAction"],
//      getContactUsModel: () {
//        // store.dispatch(GetContactUsModelAction());
//      },
//      getContactUsModelReport:
//          store.state.contactusmodelState.status["GetContactUsModelAction"],
//    );
//  }
//}
