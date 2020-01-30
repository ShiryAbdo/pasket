import 'package:plstka_app/data/model/confirmcouponmodel/data_data.dart';

class ConfirmCouponModel {
  // int count;
  Data data;
  String message;
  bool status;

  ConfirmCouponModel({
    // this.count = 0,
    this.message = "",
    this.data,
    this.status = false,
  });

  ConfirmCouponModel.fromJson(Map<String, dynamic> map)
      // : count = map['count'] ?? 0,
      : message = map['message'] ?? "",
        // data = map['data'] == [] ? null : Data.fromJson(map['data']),

        data = map['data'] == null || map['data'] == [] || map['data'] is List
            ? null
            : Data.fromJson(map['data']),
        // error = map['error'] == null || map['error'] == []
        //     ? null
        //     : ErrorC.fromJson(map['error']),
        status = map['status'] ?? false;

  Map<String, dynamic> toJson() => {
        // 'count': count,
        'message': message,
        "data": data.toJson(),
        'status': status,
      };

  ConfirmCouponModel copyWith({
    // int count,
    Data data,
    String message,
    bool status,
  }) {
    return ConfirmCouponModel(
      // count: count ?? this.count,
      data: data ?? this.data,
      message: message ?? this.message,
      status: status ?? this.status,
    );
  }
}
