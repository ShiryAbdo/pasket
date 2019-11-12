import 'package:flutter/material.dart';
import 'package:plstka_app/features/settings/app_colors.dart';

class DiscouentScreen extends StatefulWidget {
  @override
  _DiscouentScreenState createState() => _DiscouentScreenState();
}

class _DiscouentScreenState extends State<DiscouentScreen> {
  final _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.PRIMARY_COLOR,
        title: Center(
            child: Text("CLIENT",
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
              onPressed: () {},
              icon: Image.asset(
                "assets/icons/add.png",
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
              height: MediaQuery.of(context).size.height / 2,
              child: ClipPath(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    color: AppColors.PRIMARY_COLOR,
                  ),
                  clipper: CustomClipperexample())),
        ),
        Positioned.fill(
          child: Container(
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Column(children: <Widget>[
                    Stack(
                      fit: StackFit.passthrough,
                      children: <Widget>[
                        Container(
                            child: ClipOval(
                          child: Image(
                              image:
                                  new AssetImage("assets/images/profile.png"),
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
                        Padding(
                          padding:
                              const EdgeInsets.fromLTRB(42.0, 70.0, 3.0, 2.0),
                          child: Container(
                            child: Image.asset(
                              "assets/icons/camera.png",
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("Amer Yasser Saied",
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontFamily: "GESSTextMedium",
                            fontStyle: FontStyle.normal,
                            fontSize: 15.7),
                        textAlign: TextAlign.center),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Discount",
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: "GESSTextLight",
                                fontStyle: FontStyle.normal,
                                fontSize: 22.7),
                            textAlign: TextAlign.center),
                        SizedBox(
                          width: 20,
                        ),
                        Text("10%",
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontFamily: "GESSTextLight",
                                fontStyle: FontStyle.normal,
                                fontSize: 22.7),
                            textAlign: TextAlign.center)
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text("volid till 30 june , 2019",
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontFamily: "GESSTextLight",
                            fontStyle: FontStyle.normal,
                            fontSize: 15.7),
                        textAlign: TextAlign.center),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("TIME PRICE :",
                            style: const TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.bold,
                                fontFamily: "GESSTextLight",
                                fontStyle: FontStyle.normal,
                                fontSize: 22.7),
                            textAlign: TextAlign.center),
                        SizedBox(
                          width: 30,
                        ),
                        Container(
                            width: 50,
                            child: new TextField(
                              controller: _textController,
                              // maxLength: 5,
                              textAlign: TextAlign.center,
                              // autofocus: true,
                              decoration: new InputDecoration(
                                  hintText: "50",
                                  hintStyle: const TextStyle(
                                      color: AppColors.PRIMARY_COLOR,
                                      fontWeight: FontWeight.w400,
                                      fontFamily: "GESSTextLight",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 18.7),
                                  contentPadding:
                                      const EdgeInsets.only(bottom: 10.0)),
                              keyboardType: TextInputType.number,
                            )),
                        SizedBox(
                          width: 30,
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Image.asset(
                            "assets/icons/calc.png",
                            // height: 20,
                            // width: 20,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5),
                      height: 1,
                      color: Colors.grey[300],
                    ),
                    Expanded(
                      child: Container(
                          margin: EdgeInsets.only(top: 8, bottom: 8),
                          child: ListView.builder(
                              shrinkWrap: true,
                              scrollDirection: Axis.vertical,
                              itemCount: 10,
                              itemBuilder: (context, index) {
                                return rowDiscount();
                              })),
                    )
                  ]),
                )),
          ),
        ),
      ])),
    );
  }

  Widget rowDiscount() {
    return Container(
      // width: MediaQuery.of(context).size.width,
      // height: MediaQuery.of(context).size.height,
      child: Column(children: <Widget>[
        Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text("TIME PRICE :",
                style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontFamily: "GESSTextLight",
                    fontStyle: FontStyle.normal,
                    fontSize: 22.7),
                textAlign: TextAlign.center),
            SizedBox(
              width: 30,
            ),
            Container(
                width: 50,
                child: new Text(
                  "50",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    decoration: TextDecoration.underline,
                    color: AppColors.PRIMARY_COLOR,
                    fontWeight: FontWeight.w400,
                    fontFamily: "GESSTextLight",
                    fontStyle: FontStyle.normal,
                    fontSize: 18.7,
                  ),
                )),
            SizedBox(
              width: 30,
            ),
            IconButton(
              onPressed: () {},
              icon: Image.asset(
                "assets/icons/calc.png",
                // height: 20,
                // width: 20,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 50),
          padding: EdgeInsets.all(10),
          color: AppColors.PRIMARY_COLOR,
          child: Row(
            // mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text("PRICE AFTER DISCOUNT :",
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontFamily: "GESSTextLight",
                      fontStyle: FontStyle.normal,
                      fontSize: 18),
                  textAlign: TextAlign.center),
              SizedBox(
                width: 20,
              ),
              Text("10",
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: "GESSTextLight",
                      fontStyle: FontStyle.normal,
                      fontSize: 15.7),
                  textAlign: TextAlign.center),
              SizedBox(
                width: 5,
              ),
              Text("LE",
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: "GESSTextLight",
                      fontStyle: FontStyle.normal,
                      fontSize: 15.7),
                  textAlign: TextAlign.center)
            ],
          ),
        )
      ]),
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
