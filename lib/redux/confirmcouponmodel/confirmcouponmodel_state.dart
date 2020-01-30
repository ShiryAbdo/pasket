import 'package:meta/meta.dart';
import 'package:plstka_app/data/model/confirmcouponmodel/confirmcouponmodel_data.dart';
import 'package:plstka_app/data/model/page_data.dart';

import '../action_report.dart';

class ConfirmCouponModelState {
  final List<ConfirmCouponModel> searchConfirmCouponModels;
  final Map<String, ConfirmCouponModel> confirmcouponmodels;
  final Map<String, ActionReport> status;
  final ConfirmCouponModel confirmcouponmodel;
  final Page page;

  ConfirmCouponModelState({
    @required this.searchConfirmCouponModels,
    @required this.confirmcouponmodels,
    @required this.confirmcouponmodel,
    @required this.status,
    @required this.page,
  });

  ConfirmCouponModelState copyWith({
    List<ConfirmCouponModel> searchConfirmCouponModels,
    Map<String, ConfirmCouponModel> confirmcouponmodels,
    ConfirmCouponModel confirmcouponmodel,
    Map<String, ActionReport> status,
    Page page,
  }) {
    return ConfirmCouponModelState(
      searchConfirmCouponModels:
          searchConfirmCouponModels ?? this.searchConfirmCouponModels,
      confirmcouponmodels:
          confirmcouponmodels ?? this.confirmcouponmodels ?? Map(),
      confirmcouponmodel: confirmcouponmodel ?? this.confirmcouponmodel,
      status: status ?? this.status,
      page: page ?? this.page,
    );
  }
}
