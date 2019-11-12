import 'dart:async';
import 'package:fast_qr_reader_view/fast_qr_reader_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:plstka_app/features/login_screen/login_screen_view.dart';
import 'package:plstka_app/features/login_screen/profile_screen.dart';
import 'package:plstka_app/trans/translations.dart';

import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:plstka_app/redux/app/app_state.dart';
import 'package:plstka_app/redux/store.dart';
import 'package:flutter/foundation.dart';
import 'package:plstka_app/features/settings/settings_option.dart';
import 'package:plstka_app/features/settings/settings_option_page.dart';
import 'package:plstka_app/features/settings/text_scale.dart';
import 'package:plstka_app/features/settings/theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'features/home/home_screen.dart';
import 'features/login_screen/change_language_screen.dart';
import 'features/login_screen/change_password.dart';
import 'features/login_screen/contact_us.dart';
import 'features/login_screen/forget_password.dart';
import 'features/login_screen/new_password.dart';
import 'features/login_screen/verification_screen.dart';
import 'features/settings/app_colors.dart';
import 'features/splashScreen/intro_screen.dart';
import 'features/splashScreen/splash_screen.dart';

Future<Null> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  var store = await createStore();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MyApp(store));
  });
}

class MyApp extends StatefulWidget {
  final Store<AppState> store;

  MyApp(this.store);

  @override
  _MyAppState createState() => new _MyAppState();
}

class _MyAppState extends State<MyApp> {
  SettingsOptions _options;

  @override
  void initState() {
    super.initState();
    _options = new SettingsOptions(
      theme: AppTheme().appTheme,
      textScaleFactor: appTextScaleValues[0],
      platform: defaultTargetPlatform,
    );
    SharedPreferences.getInstance().then((prefs) {
      var isDark = prefs.getBool("isDark") ?? false;
      if (isDark) {
        AppTheme.configure(ThemeName.DARK);
        setState(() {
          _options = _options.copyWith(theme: AppTheme().appTheme);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
        store: widget.store,
        child: MaterialApp(
          title: 'plstka_app',
          debugShowCheckedModeBanner: false,
          home: SplashScreen(),
          routes: _routes(),
          theme: _options.theme.copyWith(platform: _options.platform),
          builder: (BuildContext context, Widget child) {
            return new Directionality(
              textDirection: _options.textDirection,
              child: _applyTextScaleFactor(child),
            );
          },
          localizationsDelegates: [
            const TranslationsDelegate(),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: [
            const Locale('zh', 'CH'),
            const Locale('en', 'US'),
          ],
        ));
  }

  Widget _applyTextScaleFactor(Widget child) {
    return new Builder(
      builder: (BuildContext context) {
        return new MediaQuery(
          data: MediaQuery.of(context).copyWith(
            textScaleFactor: _options.textScaleFactor.scale,
          ),
          child: child,
        );
      },
    );
  }

  void _handleOptionsChanged(SettingsOptions newOptions) {
    setState(() {
      _options = newOptions;
    });
  }

  Map<String, WidgetBuilder> _routes() {
    return <String, WidgetBuilder>{
      "/settings": (_) => SettingsOptionsPage(
            options: _options,
            onOptionsChanged: _handleOptionsChanged,
          ),
      "/LoginScreenView": (_) => new LoginScreenView(),
      "/HomeScreen": (_) => new HomeScreen(),
      "/IntroScreen": (_) => new IntroScreen(),
    };
  }
}
