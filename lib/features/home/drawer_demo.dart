import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart' show DragStartBehavior;
import 'package:flutter_svg/flutter_svg.dart';
import 'package:plstka_app/features/login_screen/change_language_screen.dart';
import 'package:plstka_app/features/login_screen/contact_us.dart';
import 'package:plstka_app/features/login_screen/profile_screen.dart';

const String _kAsset0 = 'people/square/trevor.png';
const String _kAsset1 = 'people/square/stella.png';
const String _kAsset2 = 'people/square/sandra.png';
const String _kGalleryAssetsPackage = 'flutter_gallery_assets';

class DrawerDemo extends StatefulWidget {
  static const String routeName = '/material/drawer';

  @override
  _DrawerDemoState createState() => _DrawerDemoState();
}

class _DrawerDemoState extends State<DrawerDemo> with TickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  static const List<String> _drawerContents = <String>[
    'A',
    'B',
    'C',
    'D',
    'E',
  ];

  static final Animatable<Offset> _drawerDetailsTween = Tween<Offset>(
    begin: const Offset(0.0, -1.0),
    end: Offset.zero,
  ).chain(CurveTween(
    curve: Curves.fastOutSlowIn,
  ));

  AnimationController _controller;
  Animation<double> _drawerContentsOpacity;
  Animation<Offset> _drawerDetailsPosition;
  bool _showDrawerContents = true;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _drawerContentsOpacity = CurvedAnimation(
      parent: ReverseAnimation(_controller),
      curve: Curves.fastOutSlowIn,
    );
    _drawerDetailsPosition = _controller.drive(_drawerDetailsTween);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  IconData _backIcon() {
    switch (Theme.of(context).platform) {
      case TargetPlatform.android:
      case TargetPlatform.fuchsia:
        return Icons.arrow_back;
      case TargetPlatform.iOS:
        return Icons.arrow_back_ios;
    }
    assert(false);
    return null;
  }

  void _showNotImplementedMessage() {
    Navigator.pop(context); // Dismiss the drawer.
    _scaffoldKey.currentState.showSnackBar(const SnackBar(
      content: Text("The drawer's items don't do anything"),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          DrawerHeader(
            child: Container(
                margin: EdgeInsets.only(top: 5),
                child: ClipOval(
                  child: Image(
                      image: new AssetImage("assets/images/profile_image.png"),
                      height: 140,
                      width: 140,
                      fit: BoxFit.fitHeight),
                  //    Image.network(
                  // "https://images.pexels.com/photos/91227/pexels-photo-91227.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
                  // width: 140,
                  // height: 140,
                  // fit: BoxFit.cover,
                  // )
                )),
          ),
          MediaQuery.removePadding(
            context: context,
            // DrawerHeader consumes top MediaQuery padding.
            removeTop: true,
            child: Expanded(
              child: ListView(
                dragStartBehavior: DragStartBehavior.down,
                padding: const EdgeInsets.only(top: 8.0),
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      // The initial contents of the drawer.
                      FadeTransition(
                        opacity: _drawerContentsOpacity,
                        child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              InkWell(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                    Navigator.of(context).push(
                                        CupertinoPageRoute(
                                            builder: (BuildContext context) =>
                                                ProfileScreen()));
                                  },
                                  child: Row(
                                    children: <Widget>[
                                      // ConstrainedBox(
                                      //   constraints: BoxConstraints(
                                      //     minWidth: 80,
                                      //     minHeight: 30,
                                      //     maxWidth: 100,
                                      //     maxHeight: 50,
                                      //   ),
                                      //   child:
                                      Container(
                                          // color: Colors.amber,
                                          child: SvgPicture.asset(
                                        'assets/icons/profile.svg',
                                        width: 70,
                                        fit: BoxFit.fill,
                                      )),
                                      // Image.asset(
                                      //     "assets/icons/profile.png",
                                      //     fit: BoxFit.cover),
                                      // ),
                                      SizedBox(width: 10),
                                      Text(
                                        'Profil',
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: "GESSTextMedium",
                                            fontStyle: FontStyle.normal,
                                            fontSize: 15.7),
                                      ),
                                    ],
                                  )),
                              SizedBox(height: 10),
                              InkWell(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                    Navigator.of(context).push(
                                        CupertinoPageRoute(
                                            builder: (BuildContext context) =>
                                                ContactUs()));
                                  },
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                          // color: Colors.amber,
                                          child: SvgPicture.asset(
                                        'assets/icons/contact_us.svg',
                                        width: 70,
                                        fit: BoxFit.fill,
                                      )),
                                      // ConstrainedBox(
                                      //   constraints: BoxConstraints(
                                      //     minWidth: 80,
                                      //     minHeight: 30,
                                      //     maxWidth: 100,
                                      //     maxHeight: 50,
                                      //   ),
                                      //   child: SvgPicture.asset(
                                      //     'assets/icons/contact_us.svg',
                                      //   ),
                                      //   //  Image.asset(
                                      //   //     "assets/icons/contact_us.png",
                                      //   //     fit: BoxFit.cover),
                                      // ),
                                      SizedBox(width: 10),
                                      Text(
                                        'Contact us',
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: "GESSTextMedium",
                                            fontStyle: FontStyle.normal,
                                            fontSize: 15.7),
                                      ),
                                    ],
                                  )),
                              SizedBox(height: 10),
                              InkWell(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                    Navigator.of(context).push(
                                        CupertinoPageRoute(
                                            builder: (BuildContext context) =>
                                                CangeLanguageScreen()));
                                  },
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                          // color: Colors.amber,
                                          child: SvgPicture.asset(
                                        'assets/icons/language.svg',
                                        width: 70,
                                        fit: BoxFit.fill,
                                      )),
                                      // ConstrainedBox(
                                      //   constraints: BoxConstraints(
                                      //     minWidth: 80,
                                      //     minHeight: 30,
                                      //     maxWidth: 100,
                                      //     maxHeight: 50,
                                      //   ),
                                      //   child: SvgPicture.asset(
                                      //     'assets/icons/language.svg',
                                      //   ),
                                      //   //  Image.asset(
                                      //   //     "assets/icons/language.png",
                                      //   //     fit: BoxFit.cover),
                                      // ),
                                      SizedBox(width: 10),
                                      Text(
                                        "Change language",
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: "GESSTextMedium",
                                            fontStyle: FontStyle.normal,
                                            fontSize: 15.7),
                                      ),
                                    ],
                                  )),
                              SizedBox(height: 10),
                              InkWell(
                                  onTap: () {
                                    // Navigator.of(context).pop();
                                    // Navigator.of(context).push(
                                    //     CupertinoPageRoute(
                                    //         builder: (BuildContext context) =>
                                    //             NotesScreenView()));
                                  },
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                          // color: Colors.amber,
                                          child: SvgPicture.asset(
                                        'assets/icons/out.svg',
                                        width: 70,
                                        fit: BoxFit.fill,
                                      )),
                                      // ConstrainedBox(
                                      //   constraints: BoxConstraints(
                                      //     minWidth: 80,
                                      //     minHeight: 30,
                                      //     maxWidth: 100,
                                      //     maxHeight: 50,
                                      //   ),
                                      //   child: SvgPicture.asset(
                                      //     'assets/icons/out.svg',
                                      //   ),
                                      //   // Image.asset(
                                      //   //     "assets/icons/out.png",
                                      //   //     fit: BoxFit.cover),
                                      // ),
                                      SizedBox(width: 10),
                                      Text(
                                        "Sign out",
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: "GESSTextMedium",
                                            fontStyle: FontStyle.normal,
                                            fontSize: 15.7),
                                      ),
                                    ],
                                  )),
                            ]),
                      ),
                      // The drawer's "details" view.
                      SlideTransition(
                        position: _drawerDetailsPosition,
                        child: FadeTransition(
                          opacity: ReverseAnimation(_drawerContentsOpacity),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              ListTile(
                                leading: const Icon(Icons.add),
                                title: const Text('Add account'),
                                onTap: _showNotImplementedMessage,
                              ),
                              ListTile(
                                leading: const Icon(Icons.settings),
                                title: const Text('Manage accounts'),
                                onTap: _showNotImplementedMessage,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showDialogLogout(BuildContext context) async {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              contentPadding: EdgeInsets.all(0),
              content: Container(
                  width: 300,
                  height: 350,
                  color: Colors.transparent,
                  child: Container()
                  // child: LogOutView(),
                  ));
        });
  }

  void _onOtherAccountsTap(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Account switching not implemented.'),
          actions: <Widget>[
            FlatButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }
}
