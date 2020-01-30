import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:plstka_app/data/model/LoginModel/loginmodel_data.dart';
import 'package:plstka_app/data/model/confirmcouponmodel/confirmcouponmodel_data.dart';
import 'package:plstka_app/features/settings/app_colors.dart';
import 'package:plstka_app/utils/StringValidator/validator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Item {
  int id;
  double price;
  double aftorDiscount;
  bool enable = false;

  Item({
    @required this.id,
    @required this.price,
    @required this.aftorDiscount,
    @required this.enable,
  });
}

class DiscouentScreen extends StatefulWidget {
  ConfirmCouponModel confirmcouponmodel;
  DiscouentScreen(this.confirmcouponmodel);
  @override
  _DiscouentScreenState createState() => _DiscouentScreenState();
}

class _DiscouentScreenState extends State<DiscouentScreen> {
  final formatter = new NumberFormat("#,##");
  int theValue = 1234;

  final _textController = TextEditingController();
  double numPersentage = 10;
  List<Item> itmesTodicount = List();
  bool calcBool = false;
  bool addItmeBool = true;
  double totalPrice = 0;
  var arabic = ["٠", "١", "٢", "٣", "٤", "٥", "٦", "٧", "٨", "٩"];
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

  String userName;
  getDat() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String user_data = prefs.getString('user');
    Map valueMap = json.decode(user_data);
    var user = LoginModel.fromJson(valueMap);
    setState(() {
      userName = user.data.info.name;
    });
  }

  @override
  void initState() {
    super.initState();
    getDat();
    if (this.widget.confirmcouponmodel.data.service != null) if (this
            .widget
            .confirmcouponmodel
            .data
            .service
            .discount !=
        null) {
      numPersentage =
          this.widget.confirmcouponmodel.data.service.discount.toDouble();
    }
  }

  void showDialogAdd(BuildContext context) async {
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
                height: 150,
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
            SizedBox(
              height: 10.0,
            ),
            Flexible(
                flex: 3,
                child: ConstrainedBox(
                    constraints:
                        const BoxConstraints(minWidth: double.infinity),
                    child: Container(
                      padding: EdgeInsets.all(5),
                      child: new Text("Enter itme price :",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          )),
                    ))),
            Container(
                width: 50,
                child: new TextField(
                  controller: _textController,
                  // maxLength: 5,
                  textAlign: TextAlign.center,

                  autofocus: true,
                  style: const TextStyle(
                      color: AppColors.PRIMARY_COLOR,
                      fontWeight: FontWeight.w400,
                      fontFamily: "GESSTextLight",
                      fontStyle: FontStyle.normal,
                      fontSize: 18.7),
                  onChanged: (text) {
                    setState(() {
                      calcBool = true;
                    });

                    print("First text field: $text");
                  },
                  // autofocus: true,
                  decoration: new InputDecoration(
                      contentPadding: const EdgeInsets.only(bottom: 10.0)),
                  keyboardType: TextInputType.number,
                )),
            SizedBox(
              height: 10.0,
            ),
            Flexible(
                flex: 2,
                child: Container(
                    decoration: decorationT,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                            flex: 3, // 20%
                            child: InkWell(
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
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context, false);
                                setState(() {
                                  double textNumber = double.parse(
                                      replaceFarsiNumber(
                                          _textController.text.toString()));

                                  bool isValid = isFloat(replaceFarsiNumber(
                                      textNumber.toString()));

                                  if (isValid) {
                                    addItmeBool = false;
                                    print("isValid  " + isValid.toString());

                                    double pricetOdISCOUNT =
                                        (numPersentage * textNumber) / 100;
                                    double price = textNumber - pricetOdISCOUNT;
                                    Item itme = Item(
                                        enable: false,
                                        id: 0,
                                        price: textNumber,
                                        aftorDiscount: price);
                                    itmesTodicount.add(itme);
                                    totalPrice += price;
                                  } else {
                                    Fluttertoast.showToast(
                                        msg: "number is not vaild",
                                        toastLength: Toast.LENGTH_LONG);
                                  }
                                  _textController.text = "";
                                });
                              },
                              child: Center(
                                  child: Text('Calculate',
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                textAlign: TextAlign.left)),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 10, right: 10),
          ),
        ],
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
      ),
      bottomNavigationBar: Visibility(
        // visible: true,
        visible: totalPrice != 0,
        child: Container(
          margin: EdgeInsets.only(bottom: 30, right: 100, left: 50),
          decoration: new BoxDecoration(boxShadow: [
            new BoxShadow(
              color: Colors.grey[100],
              blurRadius: .5,
            ),
          ]),
          child: Card(
              elevation: 5,
              child: Container(
                // margin: EdgeInsets.symmetric(horizontal: 100),
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text("Total Price :",
                        style: const TextStyle(
                            color: AppColors.PRIMARY_COLOR,
                            fontWeight: FontWeight.w600,
                            fontFamily: "GESSTextLight",
                            fontStyle: FontStyle.normal,
                            fontSize: 18),
                        textAlign: TextAlign.center),
                    SizedBox(
                      width: 20,
                    ),
                    Text(totalPrice.toString(),
                        // overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        softWrap: true,
                        style: const TextStyle(
                            color: AppColors.PRIMARY_COLOR,
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
                            color: AppColors.PRIMARY_COLOR,
                            fontWeight: FontWeight.bold,
                            fontFamily: "GESSTextLight",
                            fontStyle: FontStyle.normal,
                            fontSize: 15.7),
                        textAlign: TextAlign.center)
                  ],
                ),
              )),
        ),
      ),
      floatingActionButton: Container(
          margin: EdgeInsets.only(
              top: totalPrice != 0 ? 40 : 0,
              right: 10,
              bottom: totalPrice == 0 ? 30 : 0),
          child: FloatingActionButton(
            onPressed: () {
              showDialogAdd(context);
            },
            child: SvgPicture.asset(
              'assets/icons/calc_add.svg',
            ),
            backgroundColor: AppColors.PRIMARY_COLOR,
          )),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      body: Container(
          child: Stack(children: <Widget>[
        Positioned(
          top: 0.0,
          left: 0.0,
          right: 0.0,
          child: Container(
              height: MediaQuery.of(context).size.height / 3,
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
                      height: 20,
                    ),
                    Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 50,
                        ),
                        child: Text(
                            "We could calculate  the new price of an item for you after making discount that client have eamed ",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontFamily: "GESSTextLight",
                                fontStyle: FontStyle.normal,
                                fontSize: 15.7),
                            textAlign: TextAlign.center)),
                    SizedBox(
                      height: 20,
                    ),
                    Stack(
                      fit: StackFit.passthrough,
                      children: <Widget>[
                        Container(
                            // margin: EdgeInsets.only(top: 5),
                            child:
                                this.widget.confirmcouponmodel.data.user != null
                                    ? ClipOval(
                                        child: Image.network(
                                            isURL(widget.confirmcouponmodel.data.user.avatar)? widget.confirmcouponmodel.data.user.avatar:"",
                                             height: 110,
                                            width: 110,
                                            fit: BoxFit.fitHeight),
                                      )
                                    : ClipOval(
                                        child: Image(
                                            image: new AssetImage(
                                                "assets/images/profile_image.png"),
                                            height: 110,
                                            width: 110,
                                            fit: BoxFit.fill),
                                      )),
                      ],
                    ),
                    Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                        child: Text(
                            this.widget.confirmcouponmodel.data.user != null
                                ? this
                                    .widget
                                    .confirmcouponmodel
                                    .data
                                    .user
                                    .name
                                    .toString()
                                : "-----",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w400,
                                fontFamily: "GESSTextLight",
                                fontStyle: FontStyle.normal,
                                fontSize: 15),
                            textAlign: TextAlign.center)),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 50,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("discount",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.normal,
                                  fontFamily: "GESSTextLight",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 22.7),
                              textAlign: TextAlign.center),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                              this.widget.confirmcouponmodel.data.service !=
                                      null
                                  ? "" +
                                      this
                                          .widget
                                          .confirmcouponmodel
                                          .data
                                          .service
                                          .discount
                                          .toString()
                                  : " 0%",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "GESSTextLight",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 22.7),
                              textAlign: TextAlign.center),
                          SizedBox(
                            width: 2,
                          ),
                          Text("%",
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "GESSTextLight",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 22.7),
                              textAlign: TextAlign.center)
                        ],
                      ),
                    ),
                    // Container(
                    //   margin: EdgeInsets.symmetric(horizontal: 50, vertical: 5),
                    //   child: Row(
                    //     mainAxisSize: MainAxisSize.max,
                    //     mainAxisAlignment: MainAxisAlignment.center,
                    //     children: <Widget>[
                    //       Text("valid till",
                    //           style: const TextStyle(
                    //               color: Colors.black,
                    //               fontWeight: FontWeight.normal,
                    //               fontFamily: "GESSTextLight",
                    //               fontStyle: FontStyle.normal,
                    //               fontSize: 10),
                    //           textAlign: TextAlign.center),
                    //       SizedBox(
                    //         width: 5,
                    //       ),
                    //       Text(
                    //           this.widget.confirmcouponmodel != null
                    //               ? this
                    //                   .widget
                    //                   .confirmcouponmodel
                    //                   .data
                    //                   .createdAt
                    //                   .toString()
                    //               : "0 0 0",
                    //           style: const TextStyle(
                    //               color: Colors.black,
                    //               fontWeight: FontWeight.bold,
                    //               fontFamily: "GESSTextLight",
                    //               fontStyle: FontStyle.normal,
                    //               fontSize: 13),
                    //           textAlign: TextAlign.center)
                    //     ],
                    //   ),
                    // ),
                    Expanded(
                      child: showList(),
                    ),
                  ]),
                )),
          ),
        ),
      ])),
    );
  }

  Widget showList() {
    return Column(children: <Widget>[
      Expanded(
          child: Container(
              margin: EdgeInsets.only(top: 8, bottom: 8),
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: itmesTodicount.length,
                  itemBuilder: (context, index) {
                    return rowItme(itmesTodicount[index], index);
                  })))
    ]);
  }

  String replaceFarsiNumber(String input) {
    const english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
    // ٠١٢٣٤٥٦٧٨٩
    const arabic = ["٠", "١", "٢", "٣", "٤", "٥", "٦", "٧", "٨", "٩"];
    const farsi = ['۰', '۱', '٢', '۳', '٤', '٥', '٦', '۷', '۸', '۹'];

    for (int i = 0; i < english.length; i++) {
      input = input.replaceAll(arabic[i], english[i]);
    }
    print("input  " + input.toString());

    return input;
  }

  int maxLengthOfTextField(String text) {
    final int maxBits = 128;
    List<int> unicodeSymbols =
        text.codeUnits.where((ch) => ch > maxBits).toList();
    return unicodeSymbols.length > 0 ? 160 : 70;
  }

  Widget rowItme(Item itmes, int index) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: const Color(0xfffbfbfb)),
        margin: EdgeInsets.only(top: 5, right: 40, left: 40),
        padding: EdgeInsets.symmetric(vertical: 3, horizontal: 5),
        child: Row(
          // mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("Itme " + (index + 1).toString(),
                style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                    fontFamily: "GESSTextLight",
                    fontStyle: FontStyle.normal,
                    fontSize: 18),
                textAlign: TextAlign.center),
            Flexible(
                flex: 2,
                child: Container(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Expanded(
                      flex: 3, // 20%
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(itmes.price.toString(),
                                  // overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  softWrap: true,
                                  style: const TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "GESSTextLight",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 15),
                                  textAlign: TextAlign.center),
                              SizedBox(
                                width: 5,
                              ),
                              Text("L.E",
                                  style: const TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "GESSTextLight",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 15),
                                  textAlign: TextAlign.center)
                            ],
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text('Old Price',
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "GESSTextLight",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 12),
                              textAlign: TextAlign.center),
                        ],
                      ),
                    ),
                    // SizedBox(
                    // width: 1.0,
                    // height: double.infinity,
                    // child:
                    new Container(
                      width: 1.0,
                      height: 30,
                      decoration: BoxDecoration(
                        border: new Border.all(
                            width:
                                1, //                   <--- border width here
                            color: Colors.grey),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(5.0),
                            topRight: Radius.circular(5.0),
                            bottomLeft: Radius.circular(5.0),
                            bottomRight: Radius.circular(5.0)),
                        gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.grey[300],
                            Colors.grey[300],
                            Colors.grey[300],
                            Colors.grey[300],
                          ],
                        ),
                      ),
                    ),
                    // ),
                    Expanded(
                      flex: 3, // 20%
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                  // formatter.format(theValue),

                                  itmes.aftorDiscount.toString(),
                                  // overflow: TextOverflow.ellipsis,
                                  maxLines: 2,
                                  softWrap: true,
                                  style: const TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "GESSTextLight",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 15),
                                  textAlign: TextAlign.center),
                              SizedBox(
                                width: 5,
                              ),
                              Text("L.E",
                                  style: const TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "GESSTextLight",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 15),
                                  textAlign: TextAlign.center)
                            ],
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text('New Price',
                              style: const TextStyle(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "GESSTextLight",
                                  fontStyle: FontStyle.normal,
                                  fontSize: 12),
                              textAlign: TextAlign.center),
                        ],
                      ),
                    )
                  ],
                ))),
            IconButton(
              onPressed: () {
                setState(() {
                  showDialogRemove(context, itmes, index);

                  // itmes.aftorDiscount = itmes.price;
                  // itmes.enable = false;
                });
              },
              icon: Image.asset(
                "assets/icons/delete.png",
                // height: 20,
                // width: 20,
              ),
            ),
          ],
        ));
  }

  void showDialogRemove(BuildContext context, Item itmes, int index) async {
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
                height: 230,
                color: Colors.transparent,
                child: showFormRemove(itmes, index),
              ));
        });
  }

  showFormRemove(Item itmes, int index) {
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
                      child:
                          new Text("Are you sure you want to delet this item ?",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15.0,
                                fontWeight: FontWeight.bold,
                              )),
                    ))),
            Flexible(
                flex: 2,
                child: Container(
                    decoration: decorationT,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Expanded(
                            flex: 3, // 20%
                            child: InkWell(
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
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context, false);
                                setState(() {
                                  totalPrice = totalPrice - itmes.aftorDiscount;
                                  itmesTodicount.removeWhere((re) =>
                                      re.aftorDiscount == itmes.aftorDiscount);
                                });
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

  Widget rowDiscount(Item itmes) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      // width: MediaQuery.of(context).size.width,
      // height: MediaQuery.of(context).size.height,
      child: Column(children: <Widget>[
        Container(
            child: Row(
          // mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text("ITME PRICE :",
                style: const TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.w600,
                    fontFamily: "GESSTextLight",
                    fontStyle: FontStyle.normal,
                    fontSize: 18),
                textAlign: TextAlign.center),
            // SizedBox(
            //   width: 30,
            // ),
            Expanded(
                child: InkWell(
                    onTap: () {
                      setState(() {
                        itmes.enable = true;
                      });
                    },
                    child: new TextField(
                      enabled: itmes.enable,

                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: AppColors.PRIMARY_COLOR,
                          fontWeight: FontWeight.w400,
                          fontFamily: "GESSTextLight",
                          fontStyle: FontStyle.normal,
                          fontSize: 18.7),
                      onChanged: (text) {
                        setState(() {
                          itmes.price = double.parse(text);
                        });

                        print("First text field: $text");
                      },
                      // autofocus: true,
                      decoration: new InputDecoration(
                          hintText: itmes.price.toString(),
                          hintStyle: const TextStyle(
                              color: AppColors.PRIMARY_COLOR,
                              fontWeight: FontWeight.w400,
                              fontFamily: "GESSTextLight",
                              fontStyle: FontStyle.normal,
                              fontSize: 18.7),
                          contentPadding: const EdgeInsets.only(bottom: 10.0)),
                      keyboardType: TextInputType.number,
                    ))),
            // SizedBox(
            //   width: 30,
            // ),
            IconButton(
              onPressed: () {
                setState(() {
                  itmes.aftorDiscount = itmes.price;
                  itmes.enable = false;
                });
              },
              icon: Image.asset(
                "assets/icons/calc.png",
                // height: 20,
                // width: 20,
              ),
            ),
          ],
        )),
        SizedBox(
          height: 5,
        ),
        Container(
          padding: EdgeInsets.only(top: 10, bottom: 10, right: 10, left: 10),
          color: AppColors.PRIMARY_COLOR,
          child: Row(
            // mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                width: 5,
              ),
              Expanded(
                  child: Text(itmes.aftorDiscount.toString(),
                      // overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      softWrap: true,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: "GESSTextLight",
                          fontStyle: FontStyle.normal,
                          fontSize: 15),
                      textAlign: TextAlign.center)),
              SizedBox(
                width: 5,
              ),
              Text("LE",
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: "GESSTextLight",
                      fontStyle: FontStyle.normal,
                      fontSize: 18),
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
