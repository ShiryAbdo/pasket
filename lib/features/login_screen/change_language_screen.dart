import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:plstka_app/features/settings/app_colors.dart';

class CangeLanguageScreen extends StatefulWidget {
  @override
  _CangeLanguageScreenState createState() => _CangeLanguageScreenState();
}

class _CangeLanguageScreenState extends State<CangeLanguageScreen> {
  final String assetName = 'assets/images/logo.svg';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
      ),
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/splash.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 30.0,
                right: 30.0,
              ),
              child: ListView(
                shrinkWrap: true,
                children: [
                  Container(
                    child: new SvgPicture.asset(
                      assetName,
                    ),
                    // Image.asset(
                    //   "assets/images/logo.png",
                    //   height: 200,
                    // ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Text("Choose your perferred language ",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w500,
                          fontFamily: "GESSTextLight",
                          fontStyle: FontStyle.normal,
                          fontSize: 20.7),
                      textAlign: TextAlign.center),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text("Please select your language ",
                      style: TextStyle(
                          color: Colors.grey[700],
                          fontWeight: FontWeight.w400,
                          fontFamily: "GESSTextLight",
                          fontStyle: FontStyle.normal,
                          fontSize: 15.7),
                      textAlign: TextAlign.center),
                  SizedBox(
                    height: 10.0,
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
                          'عربي',
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
                          'English',
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
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
