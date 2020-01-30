import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plstka_app/data/db/Preference.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final String assetName = 'assets/images/logo.svg';
  SharedPreferences sharedPreferences;
  bool _testValue;
  startTime() async {
    var _duration = new Duration(seconds: 3);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    // Navigator.of(context).pushReplacementNamed('/IntroScreen');
    Preference.load();
    final myBool = Preference.getBool("CheckLogin");

    print(myBool);
    if (myBool != null) {
      if (myBool) {
        Navigator.of(context).pushNamedAndRemoveUntil(
            '/HomeScreen', (Route<dynamic> route) => false);
      } else {
        Navigator.of(context).pushReplacementNamed('/IntroScreen');
      }
    } else {
      Navigator.of(context).pushNamedAndRemoveUntil(
          '/IntroScreen', (Route<dynamic> route) => false);
    }
  }

// CheckLogin
  @override
  void initState() {
    super.initState();
    Preference.load();
    SharedPreferences.getInstance().then((SharedPreferences sp) {
      sharedPreferences = sp;
      _testValue = sharedPreferences.getBool("CheckLogin");
      // will be null if never previously saved
      if (_testValue == null) {
        _testValue = false;
      }
      setState(() {});
    });
    startTime();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/splash.png"),
          fit: BoxFit.cover,
        ),
      ),
      child: new Center(
        child:
            // Image.asset(
            //   "assets/images/logo.png",
            //   height: 200,
            // ),
            new SvgPicture.asset(
          assetName,
        ),
      ),
    ));
  }
}
