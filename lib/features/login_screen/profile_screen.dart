import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plstka_app/data/db/Preference.dart';
import 'package:plstka_app/data/model/LoginModel/loginmodel_data.dart';
import 'package:plstka_app/features/update_password/change_password.dart';
import 'package:plstka_app/features/settings/app_colors.dart';
import 'package:plstka_app/utils/StringValidator/validator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _textController = TextEditingController();

  String nameUser = "";
  String poneUser ="" ;
  String cityUser = "" ;
  String adressUser ="";
  String imageUser ="";
   FocusNode _focusUserName = FocusNode();
  FocusNode _focusponeUser = FocusNode();
  FocusNode _focuscityUser = FocusNode();
  FocusNode _focusadressUser = FocusNode();
  bool _isEnabled = false;
  @override
  void initState() {
    super.initState();
    var urlPattern = r"(https?|http)://([-A-Z0-9.]+)(/[-A-Z0-9+&@#/%=~_|!:,.;]*)?(\?[A-Z0-9+&@#/%=~_|!:‌​,.;]*)?";
    var match = new RegExp(urlPattern, caseSensitive: false).firstMatch('https://www.google.com');
    match = RegExp(urlPattern, caseSensitive: false).firstMatch('http://www.google.com');
    Preference.load();
    SharedPreferences.getInstance().then((SharedPreferences sp) {
      String userData = sp.getString('user');
      Map valueMap = json.decode(userData);
      var user = LoginModel.fromJson(valueMap);
      nameUser = user.data.info.name;
      poneUser= user.data.info.phone;
      cityUser =user.data.info.city;
      adressUser = user.data.info.address;
      imageUser = user.data.info.avatar;
      bool isValid = isURL(imageUser); // false

      setState(() {});
    });
    getData();
  }

  getData()async {
    SharedPreferences prefs =
    await SharedPreferences.getInstance();
    String userData = prefs.getString('user');
    Map valueMap = json.decode(userData);
    var user = LoginModel.fromJson(valueMap);
    nameUser = user.data.info.name;
    poneUser= user.data.info.phone;
    cityUser =user.data.info.city;
    adressUser = user.data.info.address;
    imageUser = user.data.info.avatar;
    print("nameUser"+nameUser +"");
    print("cityUser"+cityUser+"");
    print("adressUser"+adressUser+"");
    print("imageUser"+imageUser+"");


  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.PRIMARY_COLOR,
        title: Center(
            child: Text("Profile",
                style: const TextStyle(
                    color: const Color(0xffffffff),
                    fontWeight: FontWeight.w500,
                    fontFamily: "GESSTextMedium",
                    fontStyle: FontStyle.normal,
                    fontSize: 18.3),
                textAlign: TextAlign.right)),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 10),
            child: IconButton(
              onPressed: () => setState(() => _isEnabled = !_isEnabled),
              icon: SvgPicture.asset(
                'assets/icons/pencil.svg',
              ),
              // icon: Image.asset(
              //   "assets/icons/pencil.png",
              //   // height: 20,
              //   // width: 20,
              // ),
            ),
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
              // height: MediaQuery.of(context).size.height / 4.5,
              child: ClipPath(
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      color: AppColors.PRIMARY_COLOR,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          SizedBox(
                            height: 5,
                          ),
                          Image.asset(
                            "assets/images/mask.png",
                            // height: 20,
                            // width: 20,
                          ),
                        ],
                      )),
                  clipper: CustomClipperexample())),
        ),
        Positioned.fill(
          child: Container(
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Column(children: <Widget>[
                    SizedBox(
                      height: 30,
                    ),
                    Stack(
                      fit: StackFit.passthrough,
                      children: <Widget>[
                        Container(
                            margin: EdgeInsets.only(top: 5),
                            child: ClipOval(
                              child:
//                              Image(
//                                  image:
//                                  new AssetImage(
//                                      "assets/images/profile_image.png"),
//                                  height: 140,
//                                  width: 140,
//                                  fit: BoxFit.fill),
                                  Image.network(
                                    isURL(imageUser)? imageUser:"",
//                               "https://images.pexels.com/photos/91227/pexels-photo-91227.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                               width: 140,
                               height: 140,
                               fit: BoxFit.cover,
                               )
                            )),
                        // ClipOval(
                        //     child: Image.network(
                        //   "https://images.pexels.com/photos/91227/pexels-photo-91227.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                        //   width: 150,
                        //   height: 150,
                        //   fit: BoxFit.cover,
                        // )),
                        // Padding(
                        //   padding:
                        //       const EdgeInsets.fromLTRB(42.0, 70.0, 3.0, 2.0),
                        //   child: Container(
                        //     child: Image.asset(
                        //       "assets/icons/camera.png",
                        //     ),
                        //   ),
                        // )
                      ],
                    ),
                    Expanded(
                      child: loginForm(),
                    ),
                  ]),
                )),
          ),
        ),
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
            SizedBox(
              height: 10.0,
            ),
            TextField(
              enabled: _isEnabled,
              maxLines: 1,
              onChanged: (name) => nameUser = name,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontFamily: "GESSTextMedium",
                  fontStyle: FontStyle.normal,
                  fontSize: 15.7),
              focusNode: _focusUserName,
              decoration: new InputDecoration(
                prefixIcon: Icon(
                  Icons.person_outline,
                  color: Colors.grey[900],
                ),
                hintText: "Enter your name ",
                labelText: nameUser,
                labelStyle: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontFamily: "GESSTextMedium",
                    fontStyle: FontStyle.normal,
                    fontSize: 15.7),
                border: _isEnabled
                    ? new UnderlineInputBorder(
                        borderSide: new BorderSide(color: Colors.grey))
                    : InputBorder.none,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextField(
              enabled: _isEnabled,
              maxLines: 1,
              onChanged: (name) => poneUser = name,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontFamily: "GESSTextMedium",
                  fontStyle: FontStyle.normal,
                  fontSize: 15.7),
              focusNode: _focusponeUser,
              decoration: new InputDecoration(
                prefixIcon: Icon(
                  Icons.phone_android,
                  color: Colors.grey[900],
                ),
                hintText: "Enter your Mobile number ",
                labelText: poneUser,
                labelStyle: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontFamily: "GESSTextMedium",
                    fontStyle: FontStyle.normal,
                    fontSize: 15.7),
                border: _isEnabled
                    ? new UnderlineInputBorder(
                        borderSide: new BorderSide(color: Colors.grey))
                    : InputBorder.none,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextField(
              enabled: _isEnabled,
              maxLines: 1,
              onChanged: (name) => cityUser = name,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontFamily: "GESSTextMedium",
                  fontStyle: FontStyle.normal,
                  fontSize: 15.7),
              focusNode: _focuscityUser,
              decoration: new InputDecoration(
                prefixIcon: Icon(
                  Icons.location_city,
                  color: Colors.grey[900],
                ),
                hintText: "Enter your City   ",
                labelText: cityUser,
                labelStyle: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontFamily: "GESSTextMedium",
                    fontStyle: FontStyle.normal,
                    fontSize: 15.7),
                border: _isEnabled
                    ? new UnderlineInputBorder(
                        borderSide: new BorderSide(color: Colors.grey))
                    : InputBorder.none,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            TextField(
              enabled: _isEnabled,
              maxLines: 1,
              onChanged: (name) => adressUser = name,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontFamily: "GESSTextMedium",
                  fontStyle: FontStyle.normal,
                  fontSize: 15.7),
              focusNode: _focusadressUser,
              decoration: new InputDecoration(
                prefixIcon: Icon(
                  Icons.location_on,
                  color: Colors.grey[900],
                ),
                hintText: "Enter your Adress ",
                labelText: adressUser,
                labelStyle: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontFamily: "GESSTextMedium",
                    fontStyle: FontStyle.normal,
                    fontSize: 15.7),
                border: _isEnabled
                    ? new UnderlineInputBorder(
                        borderSide: new BorderSide(color: Colors.grey))
                    : InputBorder.none,
              ),
            ),
            SizedBox(
              height: 24.0,
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
                    if (!_isEnabled) {
                      Navigator.of(context).push(CupertinoPageRoute(
                          builder: (BuildContext context) => ChangePassword()));
                    } else {
                      setState(() => _isEnabled = !_isEnabled);
                    }
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
                    _isEnabled ? "Save" : 'Change password ',
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
