import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plstka_app/features/login_screen/verification_screen.dart';
import 'package:plstka_app/features/settings/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewPassword extends StatefulWidget {
  @override
  _NewPasswordState createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
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
  void didUpdateWidget(NewPassword oldWidget) {
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
              'New Password',
              style: TextStyle(fontSize: 30.0, color: Colors.black),
            )),

            Container(
                margin: EdgeInsets.only(top: 5),
                child: ClipOval(
                  child: Image(
                      image: new AssetImage("assets/images/women_star.png"),
                      height: 130,
                      width: 130,
                      fit: BoxFit.fitHeight),
                  //    Image.network(
                  // "https://images.pexels.com/photos/91227/pexels-photo-91227.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                  // width: 140,
                  // height: 140,
                  // fit: BoxFit.cover,
                  // )
                )),
            // Image.asset(
            //   "assets/images/women_star.png",
            //   height: 100,
            //   width: 200,
            // ),

            // Container(
            //     height: 100,
            //     width: 100,
            //     decoration: BoxDecoration(),
            //     child: Image(
            //         // women_star.png
            //         image: new AssetImage("assets/images/women_star.png"),
            //         fit: BoxFit.cover)),
            SizedBox(
              height: 10.0,
            ),
            Container(
                margin: EdgeInsets.only(top: 10, left: 30, right: 30),
                child: Center(
                    child: Text(
                  "The password must contain a mix of letters numbers , and/or special characters",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0, color: Colors.black),
                ))),
            SizedBox(
              height: 10.0,
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
                  suffixIcon: Icon(
                    Icons.lock_outline,
                    color: Colors.grey,
                  ),
                  hintText: "New password",
                  hintStyle: TextStyle(color: Colors.black54),
                  labelText: "New password",
                  labelStyle: new TextStyle(color: Colors.grey),
                  border: new UnderlineInputBorder(
                      borderSide: new BorderSide(color: Colors.grey))),
            ),
            SizedBox(
              height: 10.0,
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
                  suffixIcon: Icon(
                    Icons.lock_outline,
                    color: Colors.grey,
                  ),
                  hintText: "Confirm password",
                  hintStyle: TextStyle(color: Colors.black54),
                  labelText: "Confirm password",
                  labelStyle: new TextStyle(color: Colors.grey),
                  border: new UnderlineInputBorder(
                      borderSide: new BorderSide(color: Colors.grey))),
            ),

            Container(
              margin: EdgeInsets.only(top: 15),
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 40),
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
                        builder: (BuildContext context) =>
                            VerificationScreen()));
                  },
                  color: AppColors.PRIMARY_COLOR,
                  child: Text('Submint',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget loginForm2() {
    return ListView(shrinkWrap: true, children: [
      Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Center(
                child: Text(
              'Verification',
              style: TextStyle(fontSize: 30.0, color: Colors.black),
            )),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    // width: MediaQuery.of(context).size.width / 2,
                    // height: MediaQuery.of(context).size.height / 2,
                    decoration: BoxDecoration(),
                    child: Image(
                        image: new AssetImage("assets/images/gairl.png"),
                        fit: BoxFit.fill)),
              ],
            ),
            Container(
                margin: EdgeInsets.only(top: 3, left: 30, right: 30),
                child: Center(
                    child: Text(
                  "Enter the verification code we just sent you on your mobile ",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0, color: Colors.black),
                ))),
            SizedBox(
              height: 10,
            ),
            Container(
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                  Text(
                    "If you didn't receive a code ! ",
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushNamed('/SignUpScreenView');
                    },
                    child: Text(
                      "Resend",
                    ),
                  )
                ])),
            Column(
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
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
                      onPressed: () {},
                      color: Colors.green,
                      child: Text('Send',
                          style: TextStyle(color: Colors.white, fontSize: 20)),
                    ),
                  ),
                ),
                Container(
                    child: ClipPath(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 80,
                    color: Colors.green,
                  ),
                  clipper: CustomClipperexample(),
                )),
              ],
            ),
          ])
    ]);
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
