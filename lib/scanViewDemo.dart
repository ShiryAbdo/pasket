import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_qr_reader/qrcode_reader_view.dart';
import 'package:plstka_app/features/settings/app_colors.dart';

import 'features/login_screen/discouent_screen.dart';

class ScanViewDemo extends StatefulWidget {
  ScanViewDemo({Key key}) : super(key: key);

  @override
  _ScanViewDemoState createState() => new _ScanViewDemoState();
}

class _ScanViewDemoState extends State<ScanViewDemo> {
  GlobalKey<QrcodeReaderViewState> _key = GlobalKey();
  static var decorationT = BoxDecoration(
    border: new Border.all(
        width: 1, //                   <--- border width here
        color: Color(0xFF2F9965)),
    borderRadius: BorderRadius.only(
        //     // topLeft: Radius.circular(5.0),
        //     // topRight: Radius.circular(5.0),
        bottomLeft: Radius.circular(20.0),
        bottomRight: Radius.circular(20.0)),
    gradient: LinearGradient(
      begin: Alignment.bottomCenter,
      end: Alignment.topCenter,
      colors: [
        AppColors.PRIMARY_COLOR,
        AppColors.PRIMARY_COLOR,
        AppColors.PRIMARY_COLOR,
        AppColors.PRIMARY_COLOR,
      ],
    ),
  );
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: new AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
        elevation: 0,
        backgroundColor: AppColors.PRIMARY_COLOR,
        title: Center(
            child: Text("Scan QR Code",
                style: const TextStyle(
                    color: const Color(0xffffffff),
                    fontWeight: FontWeight.w500,
                    fontFamily: "GESSTextMedium",
                    fontStyle: FontStyle.normal,
                    fontSize: 20.3),
                textAlign: TextAlign.right)),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            width: 20,
          ),
        ],
      ),
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/home_bacground.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(children: <Widget>[
            Center(
                child: Container(
                    margin: EdgeInsets.only(bottom: 10),
                    height: MediaQuery.of(context).size.width * 0.70,
                    width: MediaQuery.of(context).size.width * 0.70,
                    child: QrcodeReaderView(
                      key: _key,
                      onScan: onScan,
                      // headerWidget: AppBar(
                      //   backgroundColor: Colors.transparent,
                      //   elevation: 0.0,
                      // ),
                    ))),
            Align(
                alignment: FractionalOffset.bottomCenter,
                child: Padding(
                    padding: EdgeInsets.only(bottom: 10.0),
                    child: Container(
                        height: 130,
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Material(
                              borderRadius: BorderRadius.circular(30.0),
                              shadowColor: Colors.lightBlueAccent.shade100,
                              elevation: 5.0,
                              child: ButtonTheme(
                                minWidth: 220.0,
                                height: 60.0,
                                child: RaisedButton(
                                  padding: EdgeInsets.symmetric(vertical: 16.0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        new BorderRadius.circular(2.0),
                                  ),
                                  // minWidth: 200.0,
                                  // height: 42.0,
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ScanViewDemo()));

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DiscouentScreen(),
                                      ),
                                    );
                                  },
                                  color: Colors.white,
                                  child: Text(
                                    'Show Discouent',
                                    style: const TextStyle(
                                        color: AppColors.PRIMARY_COLOR,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "GESSTextMedium",
                                        fontStyle: FontStyle.normal,
                                        fontSize: 20.3),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ))))
          ])),
    );
  }

  Future onScan(String data) async {
    await showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text("Your code is"),
          content: Text(data + "  ldlfdldfdlkfdfkdflk"),
          actions: <Widget>[
            CupertinoDialogAction(
              child: Text("Ok"),
              onPressed: () => Navigator.pop(context),
            )
          ],
        );
      },
    );
    _key.currentState.startScan();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void showDialogCall(BuildContext context) async {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              contentPadding: EdgeInsets.all(0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              content: Container(
                width: 300,
                height: 300,
                color: Colors.transparent,
                child: showForm(),
              ));
        });
  }

  showForm() {
    return Container(
      margin: EdgeInsets.only(top: 10),
      decoration: new BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
                margin: EdgeInsets.only(top: 10),
                child: Image(
                  image: AssetImage('assets/images/call_star.png'),
                  fit: BoxFit.fill,
                )),
            Flexible(
                flex: 3,
                child: ConstrainedBox(
                    constraints:
                        const BoxConstraints(minWidth: double.infinity),
                    child: Container(
                      padding: EdgeInsets.all(5),
                      child: new Text(
                          "Are you sure you want to make a Call to (+20)123 456 78",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          )),
                    ))),
            SizedBox(
              height: 20.0,
            ),
            Flexible(
                flex: 1,
                child: Container(
                    decoration: decorationT,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                            flex: 3, // 20%
                            child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context, false);
                                },
                                child: Center(
                                  child: Text('Cancel',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: const Color(0xFFFFFFFF),
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'Poppins')),
                                ))),
                        SizedBox(
                          width: 1.0,
                          child: new Container(
                            width: 1.0,
                            decoration: BoxDecoration(
                              border: new Border.all(
                                  width:
                                      1, //                   <--- border width here
                                  color: Colors.white),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(5.0),
                                  topRight: Radius.circular(5.0),
                                  bottomLeft: Radius.circular(5.0),
                                  bottomRight: Radius.circular(5.0)),
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
                            ),
                          ),
                        ),
                        Expanded(
                            flex: 3, // 20%
                            child: GestureDetector(
                              onTap: () {},
                              child: Center(
                                  child: Text('ok',
                                      style: TextStyle(color: Colors.white))),
                            ))
                      ],
                    ))),
          ],
        ),
      ),
      // Expanded(
      //     flex: 1, // 20%
    );
  }
}
