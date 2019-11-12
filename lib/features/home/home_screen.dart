import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plstka_app/data/model/generalmodels/drawer_item.dart';
import 'package:plstka_app/features/change_language/change_language_screen.dart';
import 'package:plstka_app/features/contactus/contactus_view.dart';
import 'package:plstka_app/features/home/scanner_screen.dart';
import 'package:plstka_app/features/login_screen/login_screen_view.dart';
import 'package:plstka_app/features/profilescreen/profilescreen_view.dart';
import 'package:plstka_app/features/settings/app_colors.dart';
import 'package:plstka_app/features/settings/settings_option.dart';
import 'package:plstka_app/trans/translations.dart';

import '../../scanViewDemo.dart';
import 'drawer_demo.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    Key key,
    this.options,
    this.onOptionsChanged,
  }) : super(key: key);
  static String tag = 'home-page';
  final SettingsOptions options;
  final ValueChanged<SettingsOptions> onOptionsChanged;
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  PageController _pageController;
  AnimationController controller;
  int currentIndex;
  int _page = 0;
  var drawerItems;
  var drawerOptions = <Widget>[];

  _getDrawerItemWidget(int pos) {
    switch (pos) {
      case 0:
        return new ProfileScreenView();
      case 1:
//        return new ContactUsView();
      case 2:
        return new ChangeLanguageScreen();

      case 3:
        return show();

      default:
        return new Text("Error");
    }
  }

  void changePage(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  show() {
    return new LoginScreenView();
  }

  bool _checkConfiguration() => true;
  String barcode = "";

  void initState() {
    super.initState();
    _pageController = new PageController();
    controller =
        AnimationController(duration: Duration(milliseconds: 900), vsync: this);
    currentIndex = 0;
    Future.delayed(Duration.zero, () {
      var drawerItems = [
        new DrawerItem(
            Translations.of(context).text("MyAcount"),
            ImageIcon(
              AssetImage("assets/icons/calendartwo.png"),
              color: Colors.black,
            )),
        new DrawerItem(
            Translations.of(context).text("Massage"),
            ImageIcon(
              AssetImage("assets/icons/calendartwo.png"),
              color: Color(0xFFF6F2F2),
            )),
        new DrawerItem(
            Translations.of(context).text("notes"),
            ImageIcon(
              AssetImage("assets/icons/calendartwo.png"),
              color: Color(0xFFF6F2F2),
            )),
        new DrawerItem(
            Translations.of(context).text("Signout"),
            ImageIcon(
              AssetImage("assets/icons/calendartwo.png"),
              color: Color(0xFFF6F2F2),
            )),
      ];
    });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
    controller.dispose();
  }

  void navigationTapped(int page) {
    _pageController.animateToPage(page,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }

  var offerIcons = new SizedBox(
    height: 28.0,
    width: 28.0,
    child: Image(
      image: AssetImage('assets/icons/calendartwo.png'),
      fit: BoxFit.cover,
    ),
  );
  var offerIconsUnselect = new SizedBox(
    height: 28.0,
    width: 28.0,
    child: Image(
        image: AssetImage('assets/icons/calendar.png'), fit: BoxFit.cover),
  );

  var productsIconU = new SizedBox(
    height: 28.0,
    width: 28.0,
    child: Image(
      image: AssetImage('assets/icons/product.png'),
      fit: BoxFit.cover,
    ),
  );
  var productsIcons = new SizedBox(
    height: 28.0,
    width: 28.0,
    child: Image(
      image: AssetImage('assets/icons/medicine.png'),
      fit: BoxFit.cover,
    ),
  );

  var billSelection = new SizedBox(
    height: 28.0,
    width: 28.0,
    child: Image(
      image: AssetImage('assets/icons/calculatortwo.png'),
      fit: BoxFit.cover,
    ),
  );
  var billicone = new SizedBox(
    height: 28.0,
    width: 28.0,
    child: Image(
      image: AssetImage('assets/icons/calculator.png'),
      fit: BoxFit.cover,
    ),
  );
  var collectionSelection = new SizedBox(
    height: 28.0,
    width: 28.0,
    child: Image(
      image: AssetImage('assets/icons/savingstwo.png'),
      fit: BoxFit.cover,
    ),
  );
  var collectionIcone = new SizedBox(
    height: 28.0,
    width: 28.0,
    child: Image(
      image: AssetImage('assets/icons/savings.png'),
      fit: BoxFit.cover,
    ),
  );

  var decoration = new BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      // stops: [0.9, 0.5, 0.7, 0.1],
      colors: [
        Colors.white,
        Colors.white,
        Colors.white,
        Colors.white,
        Colors.white,
      ],
    ),
  );

  int selectedIndex = 0;
  void showDialogLogout(BuildContext context) async {
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              contentPadding: EdgeInsets.all(5),
              content: Container(
                width: 300,
                height: 150,
                color: Colors.transparent,
                child: LoginScreenView(),
              ));
        });
  }

  @override
  Widget build(BuildContext context) {
    return showNewBody();
  }

  showNewBody() {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: new AppBar(
          elevation: 0,
          backgroundColor: AppColors.PRIMARY_COLOR,
          title: Center(
              child: Text("Scan QR Code",
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
                  "assets/icons/pencil.png",
                  // height: 20,
                  // width: 20,
                ),
              ),
            ),
          ],
        ),
        drawer: Theme(
            data: Theme.of(context).copyWith(
              canvasColor: Colors
                  .white, //This will change the drawer background to blue.
              //other styles
            ),
            child: DrawerDemo()
            //  SizedBox(
            //     width: MediaQuery.of(context).size.width * 0.60, //20.0,
            //     child: DrawerDemo())
            ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/home_bacground.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Padding(
                  padding: EdgeInsets.only(bottom: 10.0),
                  child: Container(
                      height: 150,
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
                                  borderRadius: new BorderRadius.circular(2.0),
                                ),
                                // minWidth: 200.0,
                                // height: 42.0,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ScanViewDemo()));

                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //     builder: (context) => ScannerScreen(),
                                  //   ),
                                  // );
                                },
                                color: Colors.white,
                                child: Text(
                                  'Scan code',
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
                      )
                      // child:
                      ))),
        ));
  }
}
//
