import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:plstka_app/data/model/LoginModel/loginmodel_data.dart';
import 'package:plstka_app/features/settings/app_colors.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:plstka_app/features/update_password/update_password_view_model.dart';
import 'package:plstka_app/redux/action_report.dart';
import 'package:plstka_app/redux/app/app_state.dart';
import 'package:plstka_app/utils/modal_progress_hud.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangePassword extends StatelessWidget {
  ChangePassword({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, UpdatePasswordModel>(
      distinct: true,
      converter: (store) => UpdatePasswordModel.fromStore(store),
      builder: (_, viewModel) => ChangePasswordView(
        viewModel: viewModel,
      ),
    );
  }
}

class ChangePasswordView extends StatefulWidget {
  final UpdatePasswordModel viewModel;

  ChangePasswordView({Key key, this.viewModel}) : super(key: key);

  @override
  _ChangePasswordViewState createState() => _ChangePasswordViewState();
}

class _ChangePasswordViewState extends State<ChangePasswordView> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _FormKey = GlobalKey<FormState>();

  String _oldPassworde = "";

  String newPassword = "";
  String confirmPassword = "";
  FocusNode _focusOldPassword = FocusNode();
  FocusNode _focusNewPassword = FocusNode();
  FocusNode _focusConfirmPassword = FocusNode();
  bool _isInAsyncCall = false;

  @override
  void didUpdateWidget(ChangePasswordView oldWidget) {
    super.didUpdateWidget(oldWidget);
    Future.delayed(Duration.zero, () {
      print("loginReport  " +
          this.widget.viewModel.updatePasswordReport?.status.toString());
      if (this.widget.viewModel.updatePasswordReport?.status ==
          ActionStatus.running) {
        // if (lpr == null) {
        //   lpr = new ProgressDialog(context);
        // }
        // lpr.setMessage("Login...");
        // lpr.show();
        setState(() {
          _isInAsyncCall = true;
        });
      } else if (this.widget.viewModel.updatePasswordReport?.status ==
          ActionStatus.error) {
        setState(() {
          _isInAsyncCall = false;
        });
        // if (lpr != null && lpr.isShowing()) {
        //   lpr.hide();
        //   lpr = null;
        // }
        showError(this.widget.viewModel.updatePasswordReport?.msg.toString());
      } else if (this.widget.viewModel.updatePasswordReport?.status ==
          ActionStatus.complete) {
        setState(() {
          _isInAsyncCall = false;
        });
        // if (lpr != null && lpr.isShowing()) {
        //   lpr.hide();
        //   lpr = null;
        // }
         _oldPassworde = "";

         newPassword = "";
         confirmPassword = "";
        showError(
            this.widget.viewModel.updatePasswordModel?.message.toString() + "");
        Navigator.pop(context);
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
    return Scaffold(
      key: _scaffoldKey,
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
      body: ModalProgressHUD(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width:  MediaQuery.of(context).size.width,
          child:bodyList() ,
        ),
//        bodyList(),
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

  Widget bodyList() {
    return
      Form(
        key: this._FormKey,
        child:
        ListView(
//        children: <Widget>[
        shrinkWrap: true,
        children: [

          Container(
              height: MediaQuery.of(context).size.height / 2.5,
              child: ClipPath(
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      color: AppColors.PRIMARY_COLOR,
                      child: Column(
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
                                fit: BoxFit.fitHeight,
                                height: MediaQuery.of(context).size.height / 3.5,
                              )
                            ],
                          ),
                        ],
                      )),
                  clipper: CustomClipperexample())),

          Container(
              padding: const EdgeInsets.only(
                left: 30.0,
                right: 30.0,
              ),
    child:
          TextFormField(
            onSaved: (value) => _oldPassworde = value,
            maxLines: 1,
            obscureText: true,
            onChanged: (oldpassword) => _oldPassworde = oldpassword,
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
          )),
          SizedBox(
            height: 10.0,
          ),
    Container(
    padding: const EdgeInsets.only(
    left: 30.0,
    right: 30.0,
    ),
    child:
          TextFormField(
            onSaved: (value) => newPassword = value,
            maxLines: 1,
            obscureText: true,
            onChanged: (newpassword) => newPassword = newpassword,
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
          )),
          SizedBox(
            height: 10.0,
          ),
          Container(
          padding: const EdgeInsets.only(
    left: 30.0,
    right: 30.0,
    ),
    child:
          TextFormField(
            onSaved: (value) => confirmPassword = value,
            maxLines: 1,
            obscureText: true,
            onChanged: (conpassword) => confirmPassword = conpassword,
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
          )),
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
                onPressed: () async {
//                    Navigator.pop(context);
                  if (_oldPassworde.isEmpty) {
                    showError("Old Password is empty!");
                    return;
                  }

                  if (newPassword.isEmpty) {
                    showError("New Password is empty!");
                    return;
                  }
                  if (confirmPassword.isEmpty) {
                    showError("Confirm Password is empty!");
                    return;
                  }

                  if (confirmPassword != newPassword) {
                    showError(" Password  not matched !");

                    return;
                  }
                  SharedPreferences prefs =
                  await SharedPreferences.getInstance();
                  String userData = prefs.getString('user');
                  Map valueMap = json.decode(userData);
                  var user = LoginModel.fromJson(valueMap);



                  widget.viewModel.updatePasswordFun(
                      newPassword,
                      confirmPassword,
                      _oldPassworde,
                      user.data.accessToken.toString());

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









        ]));

  }

      Widget body() {
    return Container(
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
                    child: Column(
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
                              fit: BoxFit.fitHeight,
                              height: MediaQuery.of(context).size.height / 3.5,
                            )
                          ],
                        ),
                      ],
                    )),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[]))),
                  Expanded(
                      flex: 2,
                      child: Container(
                        child: loginForm(),
                      )),
                ]),
          )),
    ]));
  }

  Widget loginForm() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 30.0,
          right: 30.0,
        ),
        child: Form(
            key: this._FormKey,
            child: ListView(
              shrinkWrap: true,
              children: [
                TextFormField(
                  onSaved: (value) => _oldPassworde = value,
                  maxLines: 1,
                  obscureText: true,
                  onChanged: (passOld) => _oldPassworde = passOld,
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
                TextFormField(
                  onSaved: (value) => newPassword = value,
                  maxLines: 1,
                  obscureText: true,
                  onChanged: (passnew) => newPassword = passnew,
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
                TextFormField(
                  onSaved: (value) => confirmPassword = value,
                  maxLines: 1,
                  obscureText: true,
                  onChanged: (confirm) => confirmPassword = confirm,
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
                      onPressed: () async {
//                    Navigator.pop(context);
//                        if (_oldPassworde.isEmpty) {
//                          showError("Old Password is empty!");
//                          return;
//                        }
//
//                        if (newPassword.isEmpty) {
//                          showError("New Password is empty!");
//                          return;
//                        }
//                        if (confirmPassword.isEmpty) {
//                          showError("Confirm Password is empty!");
//                          return;
//                        }
//
//                        if (confirmPassword != newPassword) {
//                          showError(" Password  not matched !");
//
//                          return;
//                        }
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                        String userData = prefs.getString('user');
                        Map valueMap = json.decode(userData);
                        var user = LoginModel.fromJson(valueMap);
                        print("password_p " + newPassword.toString());
                        print("password_confirmation_p " + confirmPassword.toString());
                        print("oldPassword_p " + _oldPassworde.toString());

                        widget.viewModel.updatePasswordFun(
                            newPassword,
                            confirmPassword,
                            _oldPassworde,
                            user.data.accessToken.toString());




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
            )),
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
