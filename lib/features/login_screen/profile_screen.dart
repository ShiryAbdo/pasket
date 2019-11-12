import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plstka_app/features/login_screen/change_password.dart';
import 'package:plstka_app/features/settings/app_colors.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _textController = TextEditingController();

  String _userName = "";
  String _password = "";
  FocusNode _focusUserName = FocusNode();
  FocusNode _focusPassword = FocusNode();
  bool _isEnabled = false;

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
              icon: Image.asset(
                "assets/icons/pencil.png",
                // height: 20,
                // width: 20,
              ),
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
                              child: Image(
                                  image: new AssetImage(
                                      "assets/images/profile.png"),
                                  height: 140,
                                  width: 140,
                                  fit: BoxFit.fill),
                              //    Image.network(
                              // "https://images.pexels.com/photos/91227/pexels-photo-91227.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                              // width: 140,
                              // height: 140,
                              // fit: BoxFit.cover,
                              // )
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
              onChanged: (name) => _userName = name,
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
                labelText: "Shimaa Abdo",
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
              onChanged: (name) => _userName = name,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontFamily: "GESSTextMedium",
                  fontStyle: FontStyle.normal,
                  fontSize: 15.7),
              focusNode: _focusUserName,
              decoration: new InputDecoration(
                prefixIcon: Icon(
                  Icons.phone_android,
                  color: Colors.grey[900],
                ),
                hintText: "Enter your Mobile number ",
                labelText: "01210387863",
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
              onChanged: (name) => _userName = name,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontFamily: "GESSTextMedium",
                  fontStyle: FontStyle.normal,
                  fontSize: 15.7),
              focusNode: _focusUserName,
              decoration: new InputDecoration(
                prefixIcon: Icon(
                  Icons.location_city,
                  color: Colors.grey[900],
                ),
                hintText: "Enter your City   ",
                labelText: "Tanta",
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
              onChanged: (name) => _userName = name,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontFamily: "GESSTextMedium",
                  fontStyle: FontStyle.normal,
                  fontSize: 15.7),
              focusNode: _focusUserName,
              decoration: new InputDecoration(
                prefixIcon: Icon(
                  Icons.location_on,
                  color: Colors.grey[900],
                ),
                hintText: "Enter your Adress ",
                labelText: "Cairo ,tanta",
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
