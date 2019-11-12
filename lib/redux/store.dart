import 'package:plstka_app/redux/contactusmodel/contactusmodel_middleware.dart';
import 'package:plstka_app/redux/perofilmodel/perofilmodel_middleware.dart';
import 'package:plstka_app/redux/loginmodel/loginmodel_middleware.dart';
import 'package:logging/logging.dart';
import 'package:redux/redux.dart';
import 'package:redux_logging/redux_logging.dart';
import 'package:plstka_app/redux/app/app_state.dart';
import 'package:plstka_app/redux/app/app_reducer.dart';

Future<Store<AppState>> createStore() async {
  return Store(
    appReducer,
    initialState: AppState.initial(),
    middleware: []
      // ..addAll(createContactUsModelMiddleware())
      // ..addAll(createPerofilModelMiddleware())
      ..addAll(createLoginModelMiddleware())
      ..addAll([
        LoggingMiddleware<dynamic>.printer(level: Level.ALL),
      ]),
  );
}
