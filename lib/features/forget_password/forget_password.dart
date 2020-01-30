import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plstka_app/features/forget_password/forget_password_view_model.dart';
import 'package:plstka_app/features/settings/app_colors.dart';
import 'package:plstka_app/utils/modal_progress_hud.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:plstka_app/redux/action_report.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:plstka_app/redux/app/app_state.dart';




class ForgetPassword extends StatelessWidget {
  ForgetPassword({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ForgetPasswordModel>(
      distinct: true,
      converter: (store) => ForgetPasswordModel.fromStore(store),
      builder: (_, viewModel) => ForgetPasswordView(
        viewModel: viewModel,
      ),
    );
  }
}


class ForgetPasswordView extends StatefulWidget {

  final ForgetPasswordModel viewModel;

  ForgetPasswordView({Key key, this.viewModel}) : super(key: key);


  @override
  _ForgetPasswordViewState createState() => _ForgetPasswordViewState();
}

class _ForgetPasswordViewState extends State<ForgetPasswordView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _FormKey = GlobalKey<FormState>();

  var lpr;

  String _userName = "";
  String _password = "";
  FocusNode _focusUserName = FocusNode();
  bool _isInAsyncCall = false;
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
        _userName.isNotEmpty) {}
  }

  @override
  void didUpdateWidget(ForgetPasswordView oldWidget) {
    super.didUpdateWidget(oldWidget);
    Future.delayed(Duration.zero, () {
      print("loginReport  " +
          this.widget.viewModel.forgetPasswordReport?.status.toString());
      if (this.widget.viewModel.forgetPasswordReport?.status == ActionStatus.running) {
        // if (lpr == null) {
        //   lpr = new ProgressDialog(context);
        // }
        // lpr.setMessage("Login...");
        // lpr.show();
        setState(() {
          _isInAsyncCall = true;
        });
      } else if (this.widget.viewModel.forgetPasswordReport?.status ==
          ActionStatus.error) {
        setState(() {
          _isInAsyncCall = false;
        });
        // if (lpr != null && lpr.isShowing()) {
        //   lpr.hide();
        //   lpr = null;
        // }
        showError(this.widget.viewModel.forgetPasswordReport?.msg.toString());
      } else if (this.widget.viewModel.forgetPasswordReport?.status ==
          ActionStatus.complete) {
        setState(() {
          _isInAsyncCall = false;
        });
        // if (lpr != null && lpr.isShowing()) {
        //   lpr.hide();
        //   lpr = null;
        // }
        Navigator.of(context).pushReplacementNamed('/NewPassword');
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

  @override
  Widget build(BuildContext context) {
    var widget;

    widget = loginForm();
    return Scaffold(

        // resizeToAvoidBottomInset: false,
        bottomNavigationBar: Container(
            child: ClipPath(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 100,
            color: AppColors.PRIMARY_COLOR,
          ),
          clipper: CustomClipperexample(),
        )),
        key: _scaffoldKey,
        body:
        ModalProgressHUD(
          child: loginForm(),
          inAsyncCall: _isInAsyncCall,
          // demo of some additional parameters
          // opacity: 0.5,
          progressIndicator: CircularProgressIndicator(
            valueColor: new AlwaysStoppedAnimation<Color>(
              AppColors.PRIMARY_COLOR,
            ),
          ),
        ),

        // Column(children: <Widget>[
        //   Expanded(child: loginForm()),
        // ]),
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
        child:
        Form(
        key: this._FormKey,
        child:
        ListView(
          shrinkWrap: true,
          children: [
            SizedBox(
              height: 30.0,
            ),
            Center(
                child: Text(
              'Forgot password?',
              style: TextStyle(fontSize: 30.0, color: Colors.black),
            )),
            SizedBox(
              height: 5.0,
            ),
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/forgetpassword.png"),
                  fit: BoxFit.fitHeight,
                ),
              ),
              // child: null /* add child content here */,
            ),
            SizedBox(
              height: 5.0,
            ),
            Container(
                margin: EdgeInsets.only(top: 10, left: 30, right: 30),
                child: Center(
                    child: Text(
                  "Enter Mobile Number associate with your account",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0, color: Colors.black),
                ))),
            Container(
              margin: EdgeInsets.only(top: 10, left: 50, right: 50),
              child: Center(
                  child: Text(
                "We will send your verrification code to reset your password",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 15.0, color: Colors.grey[600]),
              )),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextFormField(
              onSaved: (value) => _userName = value,
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
                  labelStyle: TextStyle(color: Colors.black54),
                  border: new UnderlineInputBorder(
                      borderSide: new BorderSide(color: Colors.grey))),
            ),
            SizedBox(
              height: 20.0,
            ),
            Container(
              margin: EdgeInsets.only(top: 15),
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 50),
              child: Material(
                borderRadius: BorderRadius.circular(10.0),
                shadowColor: Colors.lightBlueAccent.shade100,
                elevation: 5.0,
                child: RaisedButton(
                  padding: EdgeInsets.symmetric(vertical: 17.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(10.0),
                  ),
                  onPressed: () {
                    setState(() {});
                    if (_userName.isEmpty) {
                      showError("Enter your Mobile number ");
                      return;
                    }



                    widget.viewModel.forgetPasswordFun(_userName);
//                    Navigator.of(context).push(CupertinoPageRoute(
//                        builder: (BuildContext context) => NewPassword()));
                  },
                  color: AppColors.PRIMARY_COLOR,
                  child: Text('Send',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
              ),
            ),
          ],
        ),
        )
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
