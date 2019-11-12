//import 'package:meta/meta.dart';
//import 'package:plstka_app/data/model/contactusmodel_data.dart';
//import 'package:plstka_app/data/model/page_data.dart';
//import 'package:plstka_app/redux/action_report.dart';
//
//class ContactUsModelState {
//  final Map<String, ContactUsModel> contactusmodels;
//  final ContactUsModel contactusmodel;
//  final Map<String, ActionReport> status;
//  final Page page;
//
//  ContactUsModelState({
//    @required this.contactusmodels,
//    @required this.contactusmodel,
//    @required this.status,
//    @required this.page,
//  });
//
//  ContactUsModelState copyWith({
//    Map<String, ContactUsModel> contactusmodels,
//    ContactUsModel contactusmodel,
//    Map<String, ActionReport> status,
//    Page page,
//  }) {
//    return ContactUsModelState(
//      contactusmodels: contactusmodels ?? this.contactusmodels ?? Map(),
//      contactusmodel: contactusmodel ?? this.contactusmodel,
//      status: status ?? this.status,
//      page: page ?? this.page,
//    );
//  }
//}
