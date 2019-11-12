import 'package:flutter/material.dart';
import 'package:plstka_app/features/settings/app_colors.dart';

class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final _textController = TextEditingController();

  String _userName = "";
  String _password = "";
  FocusNode _focusUserName = FocusNode();
  FocusNode _focusOldPassword = FocusNode();
  FocusNode _focusNewPassword = FocusNode();
  FocusNode _focusConfirmPassword = FocusNode();

  bool _isEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.PRIMARY_COLOR,
        title: Center(
            child: Text("Change password",
                style: const TextStyle(
                    color: const Color(0xffffffff),
                    fontWeight: FontWeight.w500,
                    fontFamily: "GESSTextMedium",
                    fontStyle: FontStyle.normal,
                    fontSize: 20.3),
                textAlign: TextAlign.right)),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 10),
            width: 30,
          ),
        ],
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
      ),
      body: Container(
          child: Stack(children: <Widget>[
        Positioned(
          top: 0.0,
          left: 0.0,
          right: 0.0,
          child: Container(
              height: MediaQuery.of(context).size.height / 2.5,
              child: ClipPath(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    color: AppColors.PRIMARY_COLOR,
                  ),
                  clipper: CustomClipperexample())),
        ),
        Positioned.fill(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                        // flex: 1,
                        child: Container(
                            // color: Colors.grey,
                            child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              SizedBox(
                                width: 30,
                              ),
                              Image.asset(
                                "assets/images/password.png",
                              )
                            ],
                          )
                        ]))),
                    Expanded(
                        flex: 2,
                        child: Container(
                          child: loginForm(),
                        )),
                  ]),
            )),
      ])),
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
            TextField(
              maxLines: 1,
              obscureText: true,
              onChanged: (password) => _password = password,
              style: TextStyle(fontSize: 15.0, color: Colors.black),
              focusNode: _focusOldPassword,
              decoration: new InputDecoration(
                  prefixIcon: Icon(
                    Icons.lock_outline,
                    color: Colors.grey,
                  ),
                  suffixIcon: Icon(
                    Icons.lock_outline,
                    color: Colors.grey,
                  ),
                  hintText: "Old Password",
                  hintStyle: TextStyle(color: Colors.black54),
                  labelText: "Old Password",
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
              focusNode: _focusNewPassword,
              decoration: new InputDecoration(
                  prefixIcon: Icon(
                    Icons.lock_outline,
                    color: Colors.grey,
                  ),
                  suffixIcon: Icon(
                    Icons.lock_outline,
                    color: Colors.grey,
                  ),
                  hintText: "New Password",
                  hintStyle: TextStyle(color: Colors.black54),
                  labelText: "New Password",
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
              focusNode: _focusConfirmPassword,
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
            SizedBox(
              height: 20.0,
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 50,
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
                    Navigator.pop(context);
//                    if (_userName.isEmpty) {
//                      showError("UserName is empty!");
//                      return;
//                    }
//
//                    if (_password.isEmpty) {
//                      showError("Password is empty!");
//                      return;
//                    }
//
//                    widget.viewModel.login(_userName, _password, "");
                  },
                  color: AppColors.PRIMARY_COLOR,
                  child: Text(
                    'Change password ',
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
    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        size.width / 2, size.height - 100, size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
}

class RoundedClipper extends CustomClipper<Path> {
  final double height;

  RoundedClipper(this.height);

  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, height - 200);
    path.quadraticBezierTo(
      size.width / 2,
      height,
      size.width,
      height - 200,
    );
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
