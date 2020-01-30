// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:plstka_app/utils/modal_progress_hud.dart';

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: LoginPage(
//         onSignIn: () => print('login successful!'),
//       ),
//     );
//   }
// }

// class LoginPage extends StatefulWidget {
//   final VoidCallback _onSignIn;

//   LoginPage({@required onSignIn})
//       : assert(onSignIn != null),
//         _onSignIn = onSignIn;

//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   // maintains validators and state of form fields
//   final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();

//   // manage state of modal progress HUD widget
//   bool _isInAsyncCall = false;

//   bool _isInvalidAsyncUser = false; // managed after response from server
//   bool _isInvalidAsyncPass = false; // managed after response from server

//   // String _username;
//   String _password;
//   bool _isLoggedIn = false;

//   // validate user name
//   String _validateUserName(String userName) {
//     if (userName.length < 8) {

//       return 'Username must be at least 8 characters';
//     }

//     if (_isInvalidAsyncUser) {
//       // disable message until after next async call
//       _isInvalidAsyncUser = false;
//       return 'Incorrect user name';
//     }

//     return null;
//   }

//   // validate password
//   String _validatePassword(String password) {
//     if (password.length < 8) {
//       return 'Password must be at least 8 characters';
//     }

//     if (_isInvalidAsyncPass) {
//       // disable message until after next async call
//       _isInvalidAsyncPass = false;
//       return 'Incorrect password';
//     }

//     return null;
//   }

//   void _submit() {
//     if (_loginFormKey.currentState.validate()) {
//       _loginFormKey.currentState.save();

//       // dismiss keyboard during async call
//       FocusScope.of(context).requestFocus(new FocusNode());

//       // start the modal progress HUD
//       setState(() {
//         _isInAsyncCall = true;
//       });

//       // Simulate a service call
//       Future.delayed(Duration(seconds: 1), () {
//         final _accountUsername = 'username1';
//         final _accountPassword = 'password1';
//         setState(() {
//           if (_username == _accountUsername) {
//             _isInvalidAsyncUser = false;
//             if (_password == _accountPassword) {
//               // username and password are correct
//               _isInvalidAsyncPass = false;
//               _isLoggedIn = true;
//             } else
//               // username is correct, but password is incorrect
//               _isInvalidAsyncPass = true;
//           } else {
//             // incorrect username and have not checked password result
//             _isInvalidAsyncUser = true;
//             // no such user, so no need to trigger async password validator
//             _isInvalidAsyncPass = false;
//           }
//           // stop the modal progress HUD
//           _isInAsyncCall = false;
//         });
//         if (_isLoggedIn)
//           // do something
//           widget._onSignIn();
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Modal Progress HUD Demo'),
//         backgroundColor: Colors.blue,
//       ),
//       // display modal progress HUD (heads-up display, or indicator)
//       // when in async call
//       body: ModalProgressHUD(
//         child: SingleChildScrollView(
//           child: Container(
//             padding: const EdgeInsets.all(16.0),
//             child: buildLoginForm(context),
//           ),
//         ),
//         inAsyncCall: _isInAsyncCall,
//         // demo of some additional parameters
//         opacity: 0.5,
//         progressIndicator: CircularProgressIndicator(),
//       ),
//     );
//   }

//   Widget buildLoginForm(BuildContext context) {
//     final TextTheme textTheme = Theme.of(context).textTheme;
//     // run the validators on reload to process async results
//     _loginFormKey.currentState?.validate();
//     return Center(
//         child: Padding(
//             padding: const EdgeInsets.only(
//               left: 30.0,
//               right: 30.0,
//             ),
//             child: Form(
//               key: this._loginFormKey,
//               child: ListView(
//                 shrinkWrap: true,
//                 children: [
//                   Center(
//                       child: Text(
//                     "Log in",
//                     style: TextStyle(fontSize: 40.0, color: Colors.black),
//                   )),
//                   SizedBox(
//                     height: 48.0,
//                   ),
//                   TextFormField(
//                     key: Key('username'),
//                     decoration: InputDecoration(
//                         prefixIcon: Icon(
//                           Icons.phone_android,
//                           color: Colors.grey,
//                         ),
//                         hintText: "Enter your Mobile number ",
//                         labelText: "Mobile number",
//                         hintStyle: TextStyle(color: Colors.grey),
//                         border: new UnderlineInputBorder(
//                             borderSide: new BorderSide(color: Colors.grey))),
//                     style: TextStyle(
//                         fontSize: 20.0, color: textTheme.button.color),
//                     validator: _validateUserName,
//                     onSaved: (value) => _username = value,
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: TextFormField(
//                       key: Key('password'),
//                       obscureText: true,
//                       decoration: InputDecoration(
//                           hintText: 'enter password', labelText: 'Password'),
//                       style: TextStyle(
//                           fontSize: 20.0, color: textTheme.button.color),
//                       validator: _validatePassword,
//                       onSaved: (value) => _password = value,
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(32.0),
//                     child: RaisedButton(
//                       onPressed: _submit,
//                       child: Text('Login'),
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: _isLoggedIn
//                         ? Text(
//                             'Login successful!',
//                             key: Key('loggedIn'),
//                             style: TextStyle(fontSize: 20.0),
//                           )
//                         : Text(
//                             'Not logged in',
//                             key: Key('notLoggedIn'),
//                             style: TextStyle(fontSize: 20.0),
//                           ),
//                   ),
//                 ],
//               ),
//             )));
//   }
// }

import 'dart:async';
import 'package:alice/alice.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:plstka_app/features/login_screen/login_screen_view.dart';
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

// import 'features/login_screen/discouent_screen copy 2.dart';
import 'features/login_screen/discouent_screen.dart';
import 'features/update_password/new_password.dart';
import 'features/scanview/scanViewDemo.dart';
import 'features/splashScreen/intro_screen.dart';
import 'features/splashScreen/splash_screen.dart';

Alice alice = Alice(showNotification: true);

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
          navigatorKey: alice.getNavigatorKey(),
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
//editprofile
  Map<String, WidgetBuilder> _routes() {
    return <String, WidgetBuilder>{
      "/settings": (_) => SettingsOptionsPage(
            options: _options,
            onOptionsChanged: _handleOptionsChanged,
          ),
      "/LoginScreenView": (_) => new LoginScreenView(),
      "/HomeScreen": (_) => new HomeScreen(),
      "/IntroScreen": (_) => new IntroScreen(),
      "/NewPassword": (_) => new NewPassword(),

    };
  }
}
