import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plstka_app/data/db/Preference.dart';

// import 'ChangePasswordFragment.dart';
// import 'package:health_patient_app/data/model/logindata/datalogin_data.dart';
// import 'package:health_patient_app/db/Preference.dart';
// import 'package:health_patient_app/features/general/acounte/ChangePasswordFragment.dart';
// import 'package:health_patient_app/trans/translations.dart';

class MyAcountFragment extends StatefulWidget {
  @override
  _MyAcountFragmentState createState() => _MyAcountFragmentState();
}

class _MyAcountFragmentState extends State<MyAcountFragment> {
  String showImage, userName, use_email, use_mobile, use_address;

  var show_name, show_email, show_mobile, show_adress;
  bool _enabled_edite = false;
  bool show_data_only = true;
  var decoration = new BoxDecoration(
    border: new Border.all(
        width: 1, //                   <--- border width here
        color: Color(0xFFA03C96)),
    borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20.0),
        topRight: Radius.circular(20.0),
        bottomLeft: Radius.circular(20.0),
        bottomRight: Radius.circular(20.0)),
    gradient: LinearGradient(
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
      colors: [
        Colors.white,
        Colors.white,
        Colors.white,
        Colors.white,
      ],
    ),
  );
  bool _isEnabled = false;

  @override
  void initState() {
    super.initState();
    // Preference.load();
    // String data = Preference.getString('user_data');
    // print("data  " + data);
    // var userMap = json.decode(Preference.getString('user_data'));
    // Map jsonData = json.decode(userMap);
    // String valueMap = json.decode(data);

    // var datalogin = LoginModel.fromJson(valueMap);
    // print("userMap  " + userMap.toString() );
    // print("user_name___ " + datalogin.data[0].name);

    // try {
    //   var datalogin = LoginModel.fromJson(userMap);
    //   print("userMap  " + userMap.toString());
    //   print("user_name___ " + datalogin.data[0].name);
    // } catch (e) {
    //   // print("object_errore  " + e.toString());
    // }

    // var parsedJson = json.decode(Preference.getString('user_data'));
    // var user = LoginModel.fromJson(parsedJson);
    // print('${user.data[0].img} is ${user.data[0].name}');

    // var datalogin = LoginModel.fromJson(userMap);
    // showImage = datalogin.data[0].img;
    // userName = datalogin.data[0].name;
    // use_email = datalogin.data[0].mail;
    // use_mobile = datalogin.data[0].phone;
    // use_address = datalogin.data[0].address;

    if (userName != null) {
      show_name = Container(
        decoration: decoration,
        padding: const EdgeInsets.all(10),
        child: Text(userName + "  "),
      );
    } else {
      show_name = Text("no data to show");
    }

    if (use_email != null) {
      show_email = Container(
        decoration: decoration,
        padding: const EdgeInsets.all(10),
        child: Text(use_email + "  "),
      );
    } else {
      show_email = Text("no data to show");
    }
    if (use_mobile != null) {
      show_mobile = Container(
        decoration: decoration,
        padding: const EdgeInsets.all(10),
        child: Text(use_mobile + "  "),
      );
    } else {
      show_mobile = Text("no data to show");
    }

    if (use_address != null) {
      show_adress = Container(
        decoration: decoration,
        padding: const EdgeInsets.all(10),
        child: Text(use_address + "  "),
      );
    } else {
      show_adress = Text("no data to show");
    }
  }

  String validateEmail(String value) {
    if (value.isEmpty) {
      return 'Please enter mail';
    }

    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Enter Valid Email';
    else
      return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          //`true` if you want Flutter to automatically add Back Button when needed,
          //or `false` if you want to force your own back button every where
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              new Flexible(
                child: Center(child: new Text('الحساب الشخصي ')),
                flex: 3,
              ),
            ],
          ),

          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context, false);
            },
          ),
        ),
        backgroundColor: Colors.white,
        // body: Container()
        // body: showBody(),
        body: !_enabled_edite ? showBodyDisable() : showBody());
  }

  showBody() {
    var image = new Container(
      margin: new EdgeInsets.symmetric(vertical: 5.0, horizontal: 30),
      // alignment: FractionalOffset.centerLeft,
      child: Container(
          color: Colors.white,
          child: SvgPicture.asset(
            'assets/images/user_image.svg',
            height: 150,
            width: 150,
          )
          // Image.asset(
          //   'assets/images/user_image.png',
          //   width: 150.0,
          //   height: 150.0,
          //   fit: BoxFit.cover,
          // )
          ),
    );
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        child: Center(
            child: ListView(
          children: <Widget>[
            Container(
              child: Center(child: image),
            ),
            SizedBox(
              height: 5.0,
            ),
            TextField(
              maxLines: 1,
              // onChanged: (name) => _userName = name,
              style: TextStyle(fontSize: 15.0, color: Colors.black),
              // focusNode: _focusUserName,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.grey, width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  labelText: "الإسم:",
                  hintText: "الإسم:",
                  hintStyle: TextStyle(color: Colors.grey),
                  contentPadding: EdgeInsets.fromLTRB(10.0, 12.0, 10.0, 12.0),
                  border: InputBorder.none,
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w700,
                    fontSize: 15.0,
                  )),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextField(
              maxLines: 1,
              // onChanged: (name) => _userName = name,
              style: TextStyle(fontSize: 15.0, color: Colors.black),
              // focusNode: _focusUserName,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.grey, width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  labelText: "رقم الهاتف:",
                  hintText: "رقم الهاتف:",
                  hintStyle: TextStyle(color: Colors.grey),
                  contentPadding: EdgeInsets.fromLTRB(10.0, 12.0, 10.0, 12.0),
                  border: InputBorder.none,
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w700,
                    fontSize: 15.0,
                  )),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextField(
              maxLines: 1,
              // onChanged: (name) => _userName = name,
              style: TextStyle(fontSize: 15.0, color: Colors.black),
              // focusNode: _focusUserName,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.grey, width: 2.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  labelText: "البريد الإلكتروني:",
                  hintText: "البريد الإلكتروني:",
                  hintStyle: TextStyle(color: Colors.grey),
                  contentPadding: EdgeInsets.fromLTRB(10.0, 12.0, 10.0, 12.0),
                  border: InputBorder.none,
                  labelStyle: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w700,
                    fontSize: 15.0,
                  )),
            ),
            SizedBox(
              height: 10.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                padding: EdgeInsets.all(12),
                color: Color(0xFF2F9965),
                child: Text('حفظ',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    )),
                onPressed: () async {
                  setState(() {
                    _enabled_edite = false;
                  });
                  // if (_userName == null) {
                  //   Fluttertoast.showToast(
                  //       msg: "UserName is empty!",
                  //       toastLength: Toast.LENGTH_LONG);

                  //   // showError("UserName is empty!");
                  //   return;
                  // }
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                padding: EdgeInsets.all(12),
                color: Color(0xFF2F9965),
                child: Text('تغير كلمة المرور',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    )),
                onPressed: () async {
                  showDialogLogout(context);
                },
              ),
            )
          ],
        )));
  }

  showBodyDisable() {
    var image = new Container(
        margin: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 30),
        // alignment: FractionalOffset.centerLeft,
        child: Container(
            child: Container(
                color: Colors.white,
                child: Image.asset(
                  'assets/images/user_image.png',
                  width: 150.0,
                  height: 150.0,
                  fit: BoxFit.cover,
                ))));
    return Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 2),
        child: Center(
            child: ListView(
          children: <Widget>[
            Container(
              child: Center(child: image),
            ),
            SizedBox(
              height: 30.0,
            ),
            new InkWell(
                onTap: () {},
                child: new InputDecorator(
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.grey, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      ),
                      labelText: "الإسم:",
                      hintStyle: TextStyle(color: Colors.grey),
                      contentPadding:
                          EdgeInsets.fromLTRB(10.0, 12.0, 10.0, 12.0),
                      border: InputBorder.none,
                      labelStyle: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w700,
                        fontSize: 15.0,
                      )),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new Text("hsjhs"),
                    ],
                  ),
                )),
            SizedBox(
              height: 20.0,
            ),
            new InkWell(
                onTap: () {},
                child: new InputDecorator(
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.grey, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      ),
                      labelText: "رقم الهاتف:",
                      hintStyle: TextStyle(color: Colors.grey),
                      contentPadding:
                          EdgeInsets.fromLTRB(10.0, 12.0, 10.0, 12.0),
                      border: InputBorder.none,
                      labelStyle: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w700,
                        fontSize: 15.0,
                      )),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new Text("hsjhs"),
                    ],
                  ),
                )),
            SizedBox(
              height: 20.0,
            ),
            new InkWell(
                onTap: () {},
                child: new InputDecorator(
                  decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.grey, width: 2.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(color: Colors.grey, width: 1.0),
                      ),
                      labelText: "البريد الإلكتروني:",
                      hintStyle: TextStyle(color: Colors.grey),
                      contentPadding:
                          EdgeInsets.fromLTRB(10.0, 12.0, 10.0, 12.0),
                      border: InputBorder.none,
                      labelStyle: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w700,
                        fontSize: 15.0,
                      )),
                  child: new Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      new Text("hsjhs"),
                    ],
                  ),
                )),
            SizedBox(
              height: 30.0,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                padding: EdgeInsets.all(12),
                color: Color(0xFF2F9965),
                child: Text(' تعديل البيانات',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    )),
                onPressed: () async {
                  setState(() {
                    _enabled_edite = true;
                  });

                  // if (_userName == null) {
                  //   Fluttertoast.showToast(
                  //       msg: "UserName is empty!",
                  //       toastLength: Toast.LENGTH_LONG);

                  //   // showError("UserName is empty!");
                  //   return;
                  // }
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                padding: EdgeInsets.all(12),
                color: Color(0xFF2F9965),
                child: Text('تغير كلمة المرور',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    )),
                onPressed: () async {
                  showDialogLogout(context);
                },
              ),
            )
          ],
        )));
  }

  void showDialogLogout(BuildContext context) async {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              // shape: RoundedRectangleBorder(
              //   borderRadius: BorderRadius.only(
              //       // topLeft: Radius.circular(5.0),
              //       // topRight: Radius.circular(5.0),
              //       bottomLeft: Radius.circular(5.0),
              //       bottomRight: Radius.circular(5.0)),
              // ),
              contentPadding: EdgeInsets.all(0),
              content: Container(
                width: 300,
                height: 350,
                color: Colors.transparent,
                // child: UpdatePasswordView(),
              ));
        });
  }
}
