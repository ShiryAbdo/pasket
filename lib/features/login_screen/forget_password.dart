import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plstka_app/features/settings/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'new_password.dart';

class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
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
        _userName.isNotEmpty) {}
  }

  @override
  void didUpdateWidget(ForgetPassword oldWidget) {
    super.didUpdateWidget(oldWidget);
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
            SizedBox(
              height: 20.0,
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
                    Navigator.of(context).push(CupertinoPageRoute(
                        builder: (BuildContext context) => NewPassword()));
                  },
                  color: AppColors.PRIMARY_COLOR,
                  child: Text('Send',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
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
