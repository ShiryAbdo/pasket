import 'dart:convert';
import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_qr_reader/qrcode_reader_view.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:plstka_app/data/model/LoginModel/loginmodel_data.dart';
import 'package:plstka_app/features/login_screen/discouent_screen.dart';
import 'package:plstka_app/features/scanview/scanview_view_model.dart';
import 'package:plstka_app/features/settings/app_colors.dart';
import 'package:plstka_app/redux/action_report.dart';
import 'package:plstka_app/redux/app/app_state.dart';
import 'package:plstka_app/utils/modal_progress_hud.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScanViewView extends StatelessWidget {
  ScanViewView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, ScanViewViewModel>(
      distinct: true,
      converter: (store) => ScanViewViewModel.fromStore(store),
      builder: (_, viewModel) => ScanViewDemo(
        viewModel: viewModel,
      ),
    );
  }
}

class ScanViewDemo extends StatefulWidget {
  final ScanViewViewModel viewModel;

  ScanViewDemo({Key key, this.viewModel}) : super(key: key);

  @override
  _ScanViewDemoState createState() => new _ScanViewDemoState();
}

class _ScanViewDemoState extends State<ScanViewDemo> {
  bool _isInAsyncCall = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<QrcodeReaderViewState> _key = GlobalKey();
  String _connectionStatus = 'Unknown';
  final Connectivity _connectivity = Connectivity();
  StreamSubscription<ConnectivityResult> _connectivitySubscription;
  var lpr;
  bool checkCode = false;
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
    initConnectivity();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
        String wifiName, wifiBSSID, wifiIP;

        try {
          if (Platform.isIOS) {
            LocationAuthorizationStatus status =
                await _connectivity.getLocationServiceAuthorization();
            if (status == LocationAuthorizationStatus.notDetermined) {
              status =
                  await _connectivity.requestLocationServiceAuthorization();
            }
            if (status == LocationAuthorizationStatus.authorizedAlways ||
                status == LocationAuthorizationStatus.authorizedWhenInUse) {
              wifiName = await _connectivity.getWifiName();
            } else {
              wifiName = await _connectivity.getWifiName();
            }
          } else {
            wifiName = await _connectivity.getWifiName();
          }
        } on PlatformException catch (e) {
          print(e.toString());
          wifiName = "Failed to get Wifi Name";
        }

        try {
          if (Platform.isIOS) {
            LocationAuthorizationStatus status =
                await _connectivity.getLocationServiceAuthorization();
            if (status == LocationAuthorizationStatus.notDetermined) {
              status =
                  await _connectivity.requestLocationServiceAuthorization();
            }
            if (status == LocationAuthorizationStatus.authorizedAlways ||
                status == LocationAuthorizationStatus.authorizedWhenInUse) {
              wifiBSSID = await _connectivity.getWifiBSSID();
            } else {
              wifiBSSID = await _connectivity.getWifiBSSID();
            }
          } else {
            wifiBSSID = await _connectivity.getWifiBSSID();
          }
        } on PlatformException catch (e) {
          print(e.toString());
          wifiBSSID = "Failed to get Wifi BSSID";
        }

        try {
          wifiIP = await _connectivity.getWifiIP();
        } on PlatformException catch (e) {
          print(e.toString());
          wifiIP = "Failed to get Wifi IP";
        }

        setState(() {
          _connectionStatus = '$result\n'
              'Wifi Name: $wifiName\n'
              'Wifi BSSID: $wifiBSSID\n'
              'Wifi IP: $wifiIP\n';
        });
        break;
      case ConnectivityResult.mobile:
      case ConnectivityResult.none:
        Fluttertoast.showToast(
            msg: "Failed to get connect", toastLength: Toast.LENGTH_LONG);
        setState(() => _connectionStatus = result.toString());
        break;
      default:
        Fluttertoast.showToast(
            msg: "Failed to get connect", toastLength: Toast.LENGTH_LONG);
        setState(() => _connectionStatus = 'Failed to get connectivity.');
        break;
    }
  }

  @override
  void didUpdateWidget(ScanViewDemo oldWidget) {
    super.didUpdateWidget(oldWidget);
    Future.delayed(Duration.zero, () {
      print("getConfirmCouponModelReport  " +
          this.widget.viewModel.getConfirmCouponModelReport?.status.toString());
      if (this.widget.viewModel.getConfirmCouponModelReport?.status ==
          ActionStatus.running) {
        setState(() {
          _key.currentState.stopScan();
          _isInAsyncCall = true;
        });
      } else if (this.widget.viewModel.getConfirmCouponModelReport?.status ==
          ActionStatus.error) {
        setState(() {
          _key.currentState.startScan();
          _isInAsyncCall = false;
        });
        if (this.widget.viewModel.confirmcouponmodel != null) {
          Fluttertoast.showToast(
              msg: this.widget.viewModel.confirmcouponmodel.message.toString(),
              toastLength: Toast.LENGTH_LONG);
        } else {
          Fluttertoast.showToast(
              msg: "Code is not vaild", toastLength: Toast.LENGTH_LONG);
        }
      } else if (this.widget.viewModel.getConfirmCouponModelReport?.status ==
          ActionStatus.complete) {
        setState(() {
          _isInAsyncCall = false;
        });

        if (this.widget.viewModel.confirmcouponmodel.message ==
            "discount done") {
          Navigator.pop(context, false);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => DiscouentScreen(
                      this.widget.viewModel.confirmcouponmodel)));
        } else {
          if (this.widget.viewModel.confirmcouponmodel.message != null) {
            showDialogCall(
                context, this.widget.viewModel.confirmcouponmodel.message);
          }
        }

        setState(() {
          this.widget.viewModel.confirmcouponmodel.message = null;
          this.widget.viewModel.confirmcouponmodel.status = null;
        });
      } else {
        setState(() {
          _key.currentState.startScan();
          _isInAsyncCall = false;
        });
      }
    });
  }

  void showError(String error) {
    final snackBar = SnackBar(content: Text(error));
    _scaffoldKey.currentState.showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: _scaffoldKey,
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
      // body: Center(child: Text('Connection Status: $_connectionStatus')),
      body: ModalProgressHUD(
        child: bodyShow(),
        inAsyncCall: _isInAsyncCall,
        // demo of some additional parameters
        // opacity: 0.5,
        progressIndicator: CircularProgressIndicator(
          valueColor: new AlwaysStoppedAnimation<Color>(
            AppColors.PRIMARY_COLOR,
          ),
        ),
      ),
    );
  }

  Widget bodyShow() {
    return Container(
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
                  ))),
          Visibility(
              visible: false,
              // visible: checkCode,
              child: Align(
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
                                    padding:
                                        EdgeInsets.symmetric(vertical: 16.0),
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          new BorderRadius.circular(2.0),
                                    ),
                                    // minWidth: 200.0,
                                    // height: 42.0,
                                    onPressed: () async {
                                      if (this
                                              .widget
                                              .viewModel
                                              .confirmcouponmodel
                                              .data !=
                                          null) {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DiscouentScreen(this
                                                        .widget
                                                        .viewModel
                                                        .confirmcouponmodel)));
                                      } else {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DiscouentScreen(null)));
                                      }
                                    },
                                    color: Colors.white,
                                    child: Text(
                                      'Show Discount',
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
                          )))))
        ]));
  }

  Future onScan(String data) async {
    print("code_scane " + data.toString());
    _key.currentState.stopScan();

    SharedPreferences prefs = await SharedPreferences.getInstance();
    String user_data = prefs.getString('user');
    Map valueMap = json.decode(user_data);
    var user = LoginModel.fromJson(valueMap);

    this
        .widget
        .viewModel
        .getConfirmCouponModel(data, user.data.accessToken.toString());
//     await showCupertinoDialog(
//       context: context,
//       builder: (context) {
//         return CupertinoAlertDialog(
//           title: Text("Your code is"),
//           content: Container(
//               margin: EdgeInsets.only(top: 10), child: Text(data + "")),
//           actions: <Widget>[
//             CupertinoDialogAction(
//               child: Text("Check code validation",
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     color: AppColors.PRIMARY_COLOR,
//                     fontSize: 15.0,
//                     fontWeight: FontWeight.bold,
//                   )),
//               onPressed: () async {
//                  Navigator.pop(context);
//
//                 SharedPreferences prefs = await SharedPreferences.getInstance();
//                 String user_data = prefs.getString('user');
//                 Map valueMap = json.decode(user_data);
//                 var user = LoginModel.fromJson(valueMap);
//
//                 this.widget.viewModel.getConfirmCouponModel(
//                     data, user.data.accessToken.toString());
//               },
//             )
//           ],
//         );
//       },
//     );
  }

  @override
  void dispose() {
    _connectivitySubscription.cancel();
    super.dispose();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initConnectivity() async {
    ConnectivityResult result;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      result = await _connectivity.checkConnectivity();
    } on PlatformException catch (e) {
      print(e.toString());
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) {
      return;
    }

    _updateConnectionStatus(result);
  }

  void showDialogCall(BuildContext context, String showData) async {
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
                height: 250,
                color: Colors.transparent,
                child: showForm(showData),
              ));
        });
  }

  showForm(String showData) {
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
                  image: AssetImage('assets/images/cancel.png'),
                  fit: BoxFit.fill,
                )),
            Flexible(
                flex: 3,
                child: ConstrainedBox(
                    constraints:
                        const BoxConstraints(minWidth: double.infinity),
                    child: Container(
                      padding: EdgeInsets.all(5),
                      child: new Text(showData,
                          // "Are you sure you want to make a Call to (+20)123 456 78",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          )),
                    ))),
            // SizedBox(
            //   height: 20.0,
            // ),
            Flexible(
                flex: 2,
                child: Container(
                    decoration: decorationT,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        // Expanded(
                        //     flex: 3, // 20%
                        //     child: InkWell(
                        //         onTap: () {
                        //           Navigator.pop(context, false);
                        //         },
                        //         child: Center(
                        //           child: Text('Cancel',
                        //               textAlign: TextAlign.center,
                        //               style: TextStyle(
                        //                   color: const Color(0xFFFFFFFF),
                        //                   fontSize: 15.0,
                        //                   fontWeight: FontWeight.bold,
                        //                   fontFamily: 'Poppins')),
                        //         ))),
                        // SizedBox(
                        //   width: 1.0,
                        //   child: new Container(
                        //     width: 1.0,
                        //     decoration: BoxDecoration(
                        //       border: new Border.all(
                        //           width:
                        //               1, //                   <--- border width here
                        //           color: Colors.white),
                        //       borderRadius: BorderRadius.only(
                        //           topLeft: Radius.circular(5.0),
                        //           topRight: Radius.circular(5.0),
                        //           bottomLeft: Radius.circular(5.0),
                        //           bottomRight: Radius.circular(5.0)),
                        //       gradient: LinearGradient(
                        //         begin: Alignment.bottomCenter,
                        //         end: Alignment.topCenter,
                        //         colors: [
                        //           Colors.white,
                        //           Colors.white,
                        //           Colors.white,
                        //           Colors.white,
                        //         ],
                        //       ),
                        //     ),
                        //   ),
                        // ),
                        Expanded(
                            flex: 3, // 20%
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context, false);
                                Navigator.pop(context, false);
                              },
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
