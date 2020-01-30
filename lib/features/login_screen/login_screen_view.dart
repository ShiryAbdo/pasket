import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:plstka_app/features/forget_password/forget_password.dart';
import 'package:plstka_app/features/settings/app_colors.dart';
import 'package:plstka_app/redux/action_report.dart';
import 'package:plstka_app/redux/app/app_state.dart';
import 'package:plstka_app/utils/modal_progress_hud.dart';
import 'package:shared_preferences/shared_preferences.dart';

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


//resetPassword
class _login_screenViewContentState extends State<LoginScreenViewContent> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _loginFormKey = GlobalKey<FormState>();

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
        // if (lpr == null) {
        //   lpr = new ProgressDialog(context);
        // }
        // lpr.setMessage("Login...");
        // lpr.show();
        setState(() {
          _isInAsyncCall = true;
        });
      } else if (this.widget.viewModel.loginReport?.status ==
          ActionStatus.error) {
        setState(() {
          _isInAsyncCall = false;
        });
        // if (lpr != null && lpr.isShowing()) {
        //   lpr.hide();
        //   lpr = null;
        // }
        showError(this.widget.viewModel.loginReport?.msg.toString());
      } else if (this.widget.viewModel.loginReport?.status ==
          ActionStatus.complete) {
        setState(() {
          _isInAsyncCall = false;
        });
        // if (lpr != null && lpr.isShowing()) {
        //   lpr.hide();
        //   lpr = null;
        // }
        Navigator.of(context).pushReplacementNamed('/HomeScreen');
        // Navigator.of(context).pushReplacementNamed("/home");
      } else {
        setState(() {
          _isInAsyncCall = false;
        });
        // if (lpr != null && lpr.isShowing()) {
        //   lpr.hide();
        //   lpr = null;
        // }
        // Navigator.of(context).pushReplacementNamed('/HomeScreen');
        // Navigator.of(context).pushReplacementNamed("/home");
      }
    });
  }

  void showError(String error) {
    final snackBar = SnackBar(content: Text(error));
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  bool _isInAsyncCall = false;
  @override
  Widget build(BuildContext context) {
    var widget;

    widget = loginForm();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      key: _scaffoldKey,
      // when in async call
      body: ModalProgressHUD(
        child: buildLoginForm(),
        inAsyncCall: _isInAsyncCall,
        // demo of some additional parameters
        // opacity: 0.5,
        progressIndicator: CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation<Color>(
            AppColors.PRIMARY_COLOR,
          ),
        ),
      ),
      // body:
      //  Column(children: <Widget>[
      //   Expanded(child: loginForm()),
      //   Container(
      //       child: ClipPath(
      //     child: Container(
      //       width: MediaQuery.of(context).size.width,
      //       height: 100,
      //       color: AppColors.PRIMARY_COLOR,
      //     ),
      //     clipper: CustomClipperexample(),
      //   ))

      // ]),
    );
  }

  Widget buildLoginForm() {
    return Column(children: <Widget>[
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
    ]);
  }

  Widget loginForm() {
    return Center(
      child: Padding(
          padding: const EdgeInsets.only(
            left: 30.0,
            right: 30.0,
          ),
          child: Form(
            key: this._loginFormKey,
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
                TextFormField(
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
                  onSaved: (value) => _userName = value,
                ),
                SizedBox(
                  height: 20.0,
                ),
                TextFormField(
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
                  onSaved: (value) => _password = value,
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
                        _loginFormKey.currentState.save();
                        setState(() {});
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
          )),
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
