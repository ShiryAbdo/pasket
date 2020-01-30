import 'package:plstka_app/redux/confirmcouponmodel/confirmcouponmodel_middleware.dart';
import 'package:plstka_app/redux/loginmodel/loginmodel_middleware.dart';
import 'package:logging/logging.dart';
import 'package:plstka_app/redux/updatepassword/updatepassword_middleware.dart';
import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:plstka_app/redux/app/app_state.dart';
import 'package:plstka_app/redux/app/app_reducer.dart';

import 'forgetpassword/forgetpassword_middleware.dart';

Future<Store<AppState>> createStore() async {
  return Store(
    appReducer,
    initialState: AppState.initial(),
    middleware: []
      ..addAll(createConfirmCouponModelMiddleware())
      ..addAll(createLoginModelMiddleware())
      ..addAll(createForgetPasswordMiddleware())
      ..addAll(createUpdatePasswordMiddleware())


      ..addAll([
        LoggingMiddleware<dynamic>.printer(level: Level.ALL),
      ]),
  );
}
