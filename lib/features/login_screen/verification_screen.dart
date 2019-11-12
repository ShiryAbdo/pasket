import 'package:flutter/material.dart';
import 'package:plstka_app/features/settings/app_colors.dart';
import 'package:plstka_app/utils/verification_code_input.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VerificationScreen extends StatefulWidget {
  @override
  _VerificationScreenState createState() => _VerificationScreenState();
}

class _VerificationScreenState extends State<VerificationScreen> {
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
  void didUpdateWidget(VerificationScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  void showError(String error) {
    final snackBar = SnackBar(content: Text(error));
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: loginForm(),
      bottomNavigationBar: Container(
          child: ClipPath(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width / 5,
          color: AppColors.PRIMARY_COLOR,
        ),
        clipper: CustomClipperexample(),
      )),
    );
  }

  Widget loginForm() {
    return Center(
        child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.all(0.0),
            children: <Widget>[
          // ListView(shrinkWrap: true, children: [
          // Column(
          //     mainAxisSize: MainAxisSize.max,
          //     crossAxisAlignment: CrossAxisAlignment.stretch,
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: <Widget>[
          SizedBox(
            height: 40,
          ),
          Center(
              child: Text(
            'Verification',
            style: TextStyle(fontSize: 30.0, color: Colors.black),
          )),
          SizedBox(
            height: 30,
          ),
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
          SizedBox(
            height: 20,
          ),
          Container(
              margin: EdgeInsets.only(top: 3, left: 30, right: 30),
              child: Center(
                  child: Text(
                "Enter the verification code we just sent you on your mobile ",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20.0, color: Colors.black),
              ))),
          Center(
              child: VerificationCodeInput(
            keyboardType: TextInputType.number,
            length: 4,
            autofocus: false,
            onCompleted: (String value) {
              print(value);
              setState(() {
                // _onCompleted = value;
              });
            },
          )),
          SizedBox(
            height: 35,
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
          SizedBox(
            height: 20,
          ),
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
                    color: AppColors.PRIMARY_COLOR,
                    child: Text('Send',
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                ),
              ),
            ],
          ),
          // ])
        ]));
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

//   // return Scaffold(
//   body: CustomScrollView(
//     slivers: <Widget>[
//       SliverAppBar(
//         title: Text('Sliver App Bar'),
//         expandedHeight: 125.0,
//       ),
//       SliverList(
//           delegate: SliverChildBuilderDelegate((context, int) {
//         return Text('Boo');
//       }, childCount: 65)),
//       SliverFillRemaining(
//         child: Text('Foo Text'),
//       ),
//     ],
//   ),
//   bottomNavigationBar: Container(
//       child: ClipPath(
//     child: Container(
//       width: MediaQuery.of(context).size.width,
//       height: 80,
//       color: Colors.green,
//     ),
//     clipper: CustomClipperexample(),
//   )),
// );
