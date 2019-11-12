import 'package:flutter/material.dart';
import 'package:plstka_app/features/settings/app_colors.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  var lpr;
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

  String _userName = "";
  String _password = "";
  FocusNode _focusUserName = FocusNode();
  FocusNode _focusPassword = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.PRIMARY_COLOR,
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
            child: IconButton(
              onPressed: () {
                showDialogCall(context);
              },
              icon: Image.asset(
                "assets/icons/phone.png",
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
      backgroundColor: AppColors.PRIMARY_COLOR,
      body: Stack(children: <Widget>[
        Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
                child: ClipPath(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 250,
                color: Colors.white,
              ),
              clipper: CustomClipperexample(),
            ))),
        Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
                height: 150,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
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
                  ],
                )
                // child:
                )),
        Positioned.fill(
          top: 0.0,
          left: 0.0,
          right: 0.0,
          child: form(),
        )
      ]),
      //      body: widget,
    );
  }

  form() {
    return Padding(
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
          Text("Contact us",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontFamily: "GESSTextLight",
                  fontStyle: FontStyle.normal,
                  fontSize: 40.7),
              textAlign: TextAlign.center),
          SizedBox(
            height: 20.0,
          ),
          Text(
              "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontFamily: "GESSTextLight",
                  fontStyle: FontStyle.normal,
                  fontSize: 15.7),
              textAlign: TextAlign.center),
          SizedBox(
            height: 20.0,
          ),
          Container(
            height: 200,
            decoration: new BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30.0),
            ),
            // color: Color(0xffeeeeee),
            padding: EdgeInsets.all(10.0),
            child: new ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: 200.0,
              ),
              child: new Scrollbar(
                child: new SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  reverse: true,
                  child: SizedBox(
                    height: 190.0,
                    child: new TextField(
                      maxLines: 100,
                      decoration: new InputDecoration(
                        border: InputBorder.none,
                        // hintText: 'Add your text here',
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
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

class CustomClipperexample extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height * .8);
    path.quadraticBezierTo(size.width / 2, size.height, 0, size.height * .8);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
