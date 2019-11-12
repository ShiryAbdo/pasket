import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plstka_app/features/settings/app_colors.dart';

class IntroScreen extends StatefulWidget {
  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  CarouselSlider carouselSlider;
  int _current = 0;
  List imgList = [
    "assets/images/entro1.png",
    "assets/images/entro2.png",
    "assets/images/entro3.png"
  ];

  List title = [
    "Feature name",
    "Feature name",
    "Feature name",
  ];
  List description = [
    "It is a longe established fact that a reader will  be distracted by the readable  content of a page when looking at its layout .",
    "It is a longe established fact that a reader will  be distracted by the readable  content of a page when looking at its layout .",
    "It is a longe established fact that a reader will  be distracted by the readable  content of a page when looking at its layout .",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body:
//      Stack(children: <Widget>[
          Column(
        children: <Widget>[
//            Center(
//                child: Text(
//              "دخول المستخدم",
//              style: TextStyle(fontSize: 30.0, color: Colors.black),
//            )),
//            Center(
//                child: Text(
//              "أدخل الاميل والرقم السري للدخول",
//              style: TextStyle(fontSize: 10.0, color: Colors.grey),
//            )),

          Container(
              child: ClipPath(
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.7,
              color: AppColors.PRIMARY_COLOR,
              child: carouselSlider = CarouselSlider(
                initialPage: 0,
                enlargeCenterPage: false,
                autoPlay: false,
                reverse: false,
                scrollPhysics: NeverScrollableScrollPhysics(),
                enableInfiniteScroll: false,
                scrollDirection: Axis.horizontal,
                onPageChanged: (index) {
                  setState(() {
                    _current = index;
                  });
                },
                items: imgList.map((imgUrl) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          decoration: BoxDecoration(),
                          child: Image(
                              image: new AssetImage(imgUrl), fit: BoxFit.fill));
                    },
                  );
                }).toList(),
              ),
            ),
            clipper: CustomClipperexample(),
          )),
          Expanded(
              child: Container(
//                  height: MediaQuery.of(context).size.height / 1.7,
                  child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                  child: Text(
                title[_current],
                style: TextStyle(fontSize: 30.0, color: Colors.black),
              )),
              Container(
                margin: EdgeInsets.only(top: 10, left: 50, right: 50),
                child: Center(
                    child: Text(
                  description[_current],
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15.0, color: Colors.grey[600]),
                )),
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 70),
                child: Material(
                  borderRadius: BorderRadius.circular(30.0),
                  shadowColor: Colors.lightBlueAccent.shade100,
                  elevation: 5.0,
                  child: RaisedButton(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(2.0),
                    ),
                    onPressed: () {
                      if (_current != title.length - 1) {
                        goToNext();
                        print("_current " + _current.toString());
                      } else {
                        Navigator.of(context)
                            .pushReplacementNamed('/LoginScreenView');
                      }
                    },
                    color: AppColors.PRIMARY_COLOR,
                    child: Text('Next',
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                ),
              ),
            ],
          ))),
        ],
      ),
//        Positioned(
//            top: 0.0,
//            left: 0.0,
//            right: 0.0,
//            child: Container(
//                child: ClipPath(
//              child: Container(
//                width: MediaQuery.of(context).size.width,
//                height: MediaQuery.of(context).size.height / 1.7,
//                color: Colors.green,
//                child: carouselSlider = CarouselSlider(
//                  initialPage: 0,
//                  enlargeCenterPage: false,
//                  autoPlay: false,
//                  reverse: false,
//                  scrollPhysics: NeverScrollableScrollPhysics(),
//                  enableInfiniteScroll: false,
//                  scrollDirection: Axis.horizontal,
//                  onPageChanged: (index) {
//                    setState(() {
//                      _current = index;
//                    });
//                  },
//                  items: imgList.map((imgUrl) {
//                    return Builder(
//                      builder: (BuildContext context) {
//                        return Container(
//                            decoration: BoxDecoration(),
//                            child: Image(
//                                image: new AssetImage(imgUrl),
//                                fit: BoxFit.fill));
//                      },
//                    );
//                  }).toList(),
//                ),
//              ),
//              clipper: CustomClipperexample(),
//            ))),
//        Positioned(
//          bottom: 0.0,
//          left: 0.0,
//          right: 0.0,
//          child: Container(
//              height: MediaQuery.of(context).size.height / 2,
//              child: Column(
//                crossAxisAlignment: CrossAxisAlignment.center,
//                mainAxisAlignment: MainAxisAlignment.center,
//                children: <Widget>[
//                  Center(
//                      child: Text(
//                    title[_current],
//                    style: TextStyle(fontSize: 30.0, color: Colors.black),
//                  )),
//                  Container(
//                    margin: EdgeInsets.only(top: 10, left: 50, right: 50),
//                    child: Center(
//                        child: Text(
//                      description[_current],
//                      style: TextStyle(fontSize: 15.0, color: Colors.grey[600]),
//                    )),
//                  ),
//                  Container(
//                    margin: EdgeInsets.only(top: 15),
//                    width: MediaQuery.of(context).size.width,
//                    padding:
//                        EdgeInsets.symmetric(vertical: 16.0, horizontal: 70),
//                    child: Material(
//                      borderRadius: BorderRadius.circular(30.0),
//                      shadowColor: Colors.lightBlueAccent.shade100,
//                      elevation: 5.0,
//                      child: RaisedButton(
//                        padding: EdgeInsets.symmetric(vertical: 20.0),
//                        shape: RoundedRectangleBorder(
//                          borderRadius: new BorderRadius.circular(2.0),
//                        ),
//                        onPressed: () {
//                          goToNext();
////                        Navigator.of(context).pushReplacementNamed('/HomeScreen');
//                        },
//                        color: Colors.green,
//                        child: Text('Next',
//                            style:
//                                TextStyle(color: Colors.white, fontSize: 20)),
//                      ),
//                    ),
//                  ),
//                ],
//              )),
//        ),
//      ]),
//      body: widget,
    );
  }

  goToPrevious() {
    carouselSlider.previousPage(
        duration: Duration(milliseconds: 300), curve: Curves.ease);
  }

  goToNext() {
    carouselSlider.nextPage(
        duration: Duration(milliseconds: 300), curve: Curves.decelerate);
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
