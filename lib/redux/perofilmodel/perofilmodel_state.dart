//import 'package:meta/meta.dart';
//import 'package:plstka_app/data/model/perofilmodel_data.dart';
//import 'package:plstka_app/data/model/page_data.dart';
//import 'package:plstka_app/redux/action_report.dart';
//
//class PerofilModelState {
//  final Map<String, PerofilModel> perofilmodels;
//  final PerofilModel perofilmodel;
//  final Map<String, ActionReport> status;
//  final Page page;
//
//  PerofilModelState({
//    @required this.perofilmodels,
//    @required this.perofilmodel,
//    @required this.status,
//    @required this.page,
//  });
//
//  PerofilModelState copyWith({
//    Map<String, PerofilModel> perofilmodels,
//    PerofilModel perofilmodel,
//    Map<String, ActionReport> status,
//    Page page,
//  }) {
//    return PerofilModelState(
//      perofilmodels: perofilmodels ?? this.perofilmodels ?? Map(),
//      perofilmodel: perofilmodel ?? this.perofilmodel,
//      status: status ?? this.status,
//      page: page ?? this.page,
//    );
//  }
//}
