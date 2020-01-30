import 'package:meta/meta.dart';
import 'package:plstka_app/data/model/page_data.dart';
import 'package:plstka_app/data/model/updatepasswordmodel/updatepassword_data.dart';
import 'package:plstka_app/redux/action_report.dart';


//UpdatePassword
class UpdatePasswordState {
   final List<UpdatePassword>updatePasswordList;
  final Map<String, UpdatePassword> updatePasswordModels;
  final Map<String, ActionReport> status;
  final UpdatePassword updatePasswordModel;

   UpdatePasswordState({
    @required this.updatePasswordList,
    @required this.updatePasswordModels,
    @required this.updatePasswordModel,
    @required this.status,
   });

   UpdatePasswordState copyWith({
    List<UpdatePassword> updatePasswordList,
    Map<String, UpdatePassword> updatePasswordModels,
     UpdatePassword updatePasswordModel,
    Map<String, ActionReport> status,
    Page page,
  }) {
    return UpdatePasswordState(
      updatePasswordList:
      updatePasswordList ?? this.updatePasswordList,
      updatePasswordModels:
      updatePasswordModels ?? this.updatePasswordModels ?? Map(),
      updatePasswordModel: updatePasswordModel ?? this.updatePasswordModel,
      status: status ?? this.status,
     );
  }
}
