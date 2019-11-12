import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:plstka_app/features/settings/app_colors.dart';
import 'package:plstka_app/redux/action_report.dart';
import 'package:plstka_app/redux/app/app_state.dart';
import 'package:plstka_app/utils/progress_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'forget_password.dart';
import 'login_screen_view_model.dart';

class LoginScreenView extends StatelessWidget {
  LoginScreenView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, LoginScreenViewModel>(
      distinct: true,
      converter: (store) => LoginScreenViewModel.fromStore(store),
      builder: (_, viewModel) => LoginScreenViewContent(
        viewModel: viewModel,
      ),
    );
  }
}

class LoginScreenViewContent extends StatefulWidget {
  final LoginScreenViewModel viewModel;

  LoginScreenViewContent({Key key, this.viewModel}) : super(key: key);

  @override
  _login_screenViewContentState createState() =>
      _login_screenViewContentState();
}

class _login_screenViewContentState extends State<LoginScreenViewContent> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  var lpr;

  String _userName = "";
  String _password = "";
  FocusNode _focusUserName = FocusNode();
  FocusNode _focusPassword = FocusNode();

  @override
  void initState() {
    super.initState();
    initLogin();
  }

  Future initLogin() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _userName = prefs.getString("username");
    _password = prefs.getString("password");
    if (_userName != null &&
        _password != null &&
        _password.isNotEmpty &&
        _userName.isNotEmpty) {
      widget.viewModel.login(_userName, _password);
    }
  }

  @override
  void didUpdateWidget(LoginScreenViewContent oldWidget) {
    super.didUpdateWidget(oldWidget);
    Future.delayed(Duration.zero, () {
      print("loginReport  " +
          this.widget.viewModel.loginReport?.status.toString());
      if (this.widget.viewModel.loginReport?.status == ActionStatus.running) {
        if (lpr == null) {
          lpr = new ProgressDialog(context);
        }
        lpr.setMessage("Login...");
        lpr.show();
      } else if (this.widget.viewModel.loginReport?.status ==
          ActionStatus.error) {
        if (lpr != null && lpr.isShowing()) {
          lpr.hide();
          lpr = null;
        }
        showError(this.widget.viewModel.loginReport?.msg.toString());
      } else if (this.widget.viewModel.loginReport?.status ==
          ActionStatus.complete) {
        if (lpr != null && lpr.isShowing()) {
          lpr.hide();
          lpr = null;
        }
        Navigator.of(context).pushReplacementNamed('/HomeScreen');
        // Navigator.of(context).pushReplacementNamed("/home");
      } else {
        if (lpr != null && lpr.isShowing()) {
          lpr.hide();
          lpr = null;
        }
        Navigator.of(context).pushReplacementNamed('/HomeScreen');
        // Navigator.of(context).pushReplacementNamed("/home");
      }
    });
  }

  void showError(String error) {
    final snackBar = SnackBar(content: Text(error));
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    var widget;

    widget = loginForm();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      body: Column(children: <Widget>[
        Expanded(child: loginForm()),
        Container(
            child: ClipPath(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            color: AppColors.PRIMARY_COLOR,
          ),
          clipper: CustomClipperexample(),
        ))

//        Positioned(
//            bottom: 0.0,
//            left: 0.0,
//            right: 0.0,
//            child: Container(
//                child: ClipPath(
//              child: Container(
//                width: MediaQuery.of(context).size.width,
//                height: 100,
//                color: Colors.green,
//              ),
//              clipper: CustomClipperexample(),
//            ))
//        ),
//        Positioned.fill(
//          top: 0.0,
//          left: 0.0,
//          right: 0.0,
//          child: loginForm(),
//        )
      ]),
//      body: widget,
    );
  }

  Widget loginForm() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 30.0,
          right: 30.0,
        ),
        child: ListView(
          shrinkWrap: true,
          children: [
            Center(
                child: Text(
              "Log in",
              style: TextStyle(fontSize: 40.0, color: Colors.black),
            )),
            SizedBox(
              height: 48.0,
            ),
            TextField(
              maxLines: 1,
              onChanged: (name) => _userName = name,
              style: TextStyle(fontSize: 15.0, color: Colors.black),
              focusNode: _focusUserName,
              decoration: new InputDecoration(
                  prefixIcon: Icon(
                    Icons.phone_android,
                    color: Colors.grey,
                  ),
                  hintText: "Enter your Mobile number ",
                  labelText: "Mobile number",
                  hintStyle: TextStyle(color: Colors.grey),
                  border: new UnderlineInputBorder(
                      borderSide: new BorderSide(color: Colors.grey))),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextField(
              maxLines: 1,
              obscureText: true,
              onChanged: (password) => _password = password,
              style: TextStyle(fontSize: 15.0, color: Colors.black),
              focusNode: _focusPassword,
              decoration: new InputDecoration(
                  prefixIcon: Icon(
                    Icons.lock_outline,
                    color: Colors.grey,
                  ),
                  hintText: "Enter your password",
                  hintStyle: TextStyle(color: Colors.grey),
                  labelText: "Password",
                  labelStyle: new TextStyle(color: Colors.grey),
                  border: new UnderlineInputBorder(
                      borderSide: new BorderSide(color: Colors.grey))),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                FlatButton(
                  child: Text(
                    'Forgot password?',
                    style: TextStyle(color: Colors.black54),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ForgetPassword(),
                      ),
                    );
                  },
                ),
              ],
            ),
            SizedBox(
              height: 24.0,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 40,
              ),
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: Material(
                borderRadius: BorderRadius.circular(30.0),
                shadowColor: Colors.lightBlueAccent.shade100,
                elevation: 5.0,
                child: RaisedButton(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(2.0),
                  ),
                  // minWidth: 200.0,
                  // height: 42.0,
                  onPressed: () {
                    print("shimoooooooooooooo here");
                    if (_userName.isEmpty) {
                      showError("UserName is empty!");
                      return;
                    }

                    if (_password.isEmpty) {
                      showError("Password is empty!");
                      return;
                    }

                    widget.viewModel.login(_userName, _password);
                  },
                  color: AppColors.PRIMARY_COLOR,
                  child: Text(
                    'Log In',
                    style: const TextStyle(
                        color: const Color(0xffffffff),
                        fontWeight: FontWeight.w500,
                        fontFamily: "GESSTextMedium",
                        fontStyle: FontStyle.normal,
                        fontSize: 18.3),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomClipperexample extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.quadraticBezierTo(size.width / 2, size.height, size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}
