import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:plstka_app/features/settings/app_colors.dart';
import 'package:plstka_app/utils/StringValidator/validator.dart';

class Item {
  int id;
  String price;
  String aftorDiscount;
  bool enable = false;

  Item({
    @required this.id,
    @required this.price,
    @required this.aftorDiscount,
    @required this.enable,
  });
}

class DiscouentScreen extends StatefulWidget {
  @override
  _DiscouentScreenState createState() => _DiscouentScreenState();
}

class _DiscouentScreenState extends State<DiscouentScreen> {
  final _textController = TextEditingController();
  List<Item> itmes = List();
  bool calcBool = false;
  bool addItmeBool = true;
  double totalPrice;
  var arabic = ["٠", "١", "٢", "٣", "٤", "٥", "٦", "٧", "٨", "٩"];

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
                textAlign: TextAlign.right)),
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 10),
            child: IconButton(
              onPressed: () {
                setState(() {
                  addItmeBool = true;
                });
              },
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
        Positioned(
            top: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
                height: MediaQuery.of(context).size.height / 2.4,
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
                                height: 130,
                                width: 130,
                                fit: BoxFit.fill),
                          )),
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
                        height: 5,
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
                            width: 5,
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
                        height: 5,
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
                        height: 5,
                      ),
                      Visibility(
                          visible: true,
                          // visible: totalPrice != null,
                          child: Container(
                            // margin: EdgeInsets.symmetric(horizontal: 100),
                            // padding: EdgeInsets.all(10),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text("Total :",
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
                                Text(totalPrice.toString(),
                                    // overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    softWrap: true,
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
                          )),
                    ])))),
        Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
                child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height / 2.5,
                    child: Column(children: <Widget>[
                      Visibility(
                          visible: addItmeBool,
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text("ITME PRICE :",
                                  style: const TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "GESSTextLight",
                                      fontStyle: FontStyle.normal,
                                      fontSize: 18.7),
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
                                        contentPadding: const EdgeInsets.only(
                                            bottom: 10.0)),
                                    keyboardType: TextInputType.number,
                                  )),
                              SizedBox(
                                width: 30,
                              ),
                              Visibility(
                                  visible: calcBool,
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        Item itme = Item(
                                            enable: false,
                                            id: 0,
                                            price:
                                                _textController.text.toString(),
                                            aftorDiscount: _textController.text
                                                .toString());
                                        itmes.add(itme);
                                        String data = _textController.text;
                                        totalPrice = double.parse(
                                            replaceFarsiNumber(data));
                                        // if (arabic.contains(data[0])) {
                                        //   totalPrice = double.parse(
                                        //       replaceFarsiNumber(data));
                                        // } else {
                                        //   totalPrice = double.parse(data);
                                        // }

                                        bool isValid =
                                            isFloat(replaceFarsiNumber(data));

                                        print("isValid  " + isValid.toString());
                                        if (isValid) {
                                          addItmeBool = false;
                                        } else {
                                          Fluttertoast.showToast(
                                              msg: "number is not vaild",
                                              toastLength: Toast.LENGTH_LONG);
                                        }
                                        _textController.text = "";
                                        //

                                        // } else {
                                        //   totalPrice = double.parse(data);
                                        // }
                                        // print("totalPrice  " +
                                        //     totalPrice.toString());
                                        // addItmeBool = false;
                                        // totalPrice = num.parse(
                                        //     totalPrice.toStringAsFixed(2));
                                      });
                                    },
                                    icon: Image.asset(
                                      "assets/icons/calc.png",
                                      // height: 20,
                                      // width: 20,
                                    ),
                                  )),
                            ],
                          )),
                      Expanded(
                          child: Container(
                              margin: EdgeInsets.only(top: 8, bottom: 8),
                              child: ListView.builder(
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: itmes.length,
                                  itemBuilder: (context, index) {
                                    return rowDiscount(itmes[index]);
                                  })))
                    ]))))
      ])),
    );
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

  String normalise(String input) => input
      .replaceAll('\u0610', '') //ARABIC SIGN SALLALLAHOU ALAYHE WA SALLAM
      .replaceAll('\u0611', '') //ARABIC SIGN ALAYHE ASSALLAM
      .replaceAll('\u0612', '') //ARABIC SIGN RAHMATULLAH ALAYHE
      .replaceAll('\u0613', '') //ARABIC SIGN RADI ALLAHOU ANHU
      .replaceAll('\u0614', '') //ARABIC SIGN TAKHALLUS

      //Remove koranic anotation
      .replaceAll('\u0615', '') //ARABIC SMALL HIGH TAH
      .replaceAll(
          '\u0616', '') //ARABIC SMALL HIGH LIGATURE ALEF WITH LAM WITH YEH
      .replaceAll('\u0617', '') //ARABIC SMALL HIGH ZAIN
      .replaceAll('\u0618', '') //ARABIC SMALL FATHA
      .replaceAll('\u0619', '') //ARABIC SMALL DAMMA
      .replaceAll('\u061A', '') //ARABIC SMALL KASRA
      .replaceAll('\u06D6',
          '') //ARABIC SMALL HIGH LIGATURE SAD WITH LAM WITH ALEF MAKSURA
      .replaceAll('\u06D7',
          '') //ARABIC SMALL HIGH LIGATURE QAF WITH LAM WITH ALEF MAKSURA
      .replaceAll('\u06D8', '') //ARABIC SMALL HIGH MEEM INITIAL FORM
      .replaceAll('\u06D9', '') //ARABIC SMALL HIGH LAM ALEF
      .replaceAll('\u06DA', '') //ARABIC SMALL HIGH JEEM
      .replaceAll('\u06DB', '') //ARABIC SMALL HIGH THREE DOTS
      .replaceAll('\u06DC', '') //ARABIC SMALL HIGH SEEN
      .replaceAll('\u06DD', '') //ARABIC END OF AYAH
      .replaceAll('\u06DE', '') //ARABIC START OF RUB EL HIZB
      .replaceAll('\u06DF', '') //ARABIC SMALL HIGH ROUNDED ZERO
      .replaceAll('\u06E0', '') //ARABIC SMALL HIGH UPRIGHT RECTANGULAR ZERO
      .replaceAll('\u06E1', '') //ARABIC SMALL HIGH DOTLESS HEAD OF KHAH
      .replaceAll('\u06E2', '') //ARABIC SMALL HIGH MEEM ISOLATED FORM
      .replaceAll('\u06E3', '') //ARABIC SMALL LOW SEEN
      .replaceAll('\u06E4', '') //ARABIC SMALL HIGH MADDA
      .replaceAll('\u06E5', '') //ARABIC SMALL WAW
      .replaceAll('\u06E6', '') //ARABIC SMALL YEH
      .replaceAll('\u06E7', '') //ARABIC SMALL HIGH YEH
      .replaceAll('\u06E8', '') //ARABIC SMALL HIGH NOON
      .replaceAll('\u06E9', '') //ARABIC PLACE OF SAJDAH
      .replaceAll('\u06EA', '') //ARABIC EMPTY CENTRE LOW STOP
      .replaceAll('\u06EB', '') //ARABIC EMPTY CENTRE HIGH STOP
      .replaceAll('\u06EC', '') //ARABIC ROUNDED HIGH STOP WITH FILLED CENTRE
      .replaceAll('\u06ED', '') //ARABIC SMALL LOW MEEM

      //Remove tatweel
      .replaceAll('\u0640', '')

      //Remove tashkeel
      .replaceAll('\u064B', '') //ARABIC FATHATAN
      .replaceAll('\u064C', '') //ARABIC DAMMATAN
      .replaceAll('\u064D', '') //ARABIC KASRATAN
      .replaceAll('\u064E', '') //ARABIC FATHA
      .replaceAll('\u064F', '') //ARABIC DAMMA
      .replaceAll('\u0650', '') //ARABIC KASRA
      .replaceAll('\u0651', '') //ARABIC SHADDA
      .replaceAll('\u0652', '') //ARABIC SUKUN
      .replaceAll('\u0653', '') //ARABIC MADDAH ABOVE
      .replaceAll('\u0654', '') //ARABIC HAMZA ABOVE
      .replaceAll('\u0655', '') //ARABIC HAMZA BELOW
      .replaceAll('\u0656', '') //ARABIC SUBSCRIPT ALEF
      .replaceAll('\u0657', '') //ARABIC INVERTED DAMMA
      .replaceAll('\u0658', '') //ARABIC MARK NOON GHUNNA
      .replaceAll('\u0659', '') //ARABIC ZWARAKAY
      .replaceAll('\u065A', '') //ARABIC VOWEL SIGN SMALL V ABOVE
      .replaceAll('\u065B', '') //ARABIC VOWEL SIGN INVERTED SMALL V ABOVE
      .replaceAll('\u065C', '') //ARABIC VOWEL SIGN DOT BELOW
      .replaceAll('\u065D', '') //ARABIC REVERSED DAMMA
      .replaceAll('\u065E', '') //ARABIC FATHA WITH TWO DOTS
      .replaceAll('\u065F', '') //ARABIC WAVY HAMZA BELOW
      .replaceAll('\u0670', '') //ARABIC LETTER SUPERSCRIPT ALEF

      //Replace Waw Hamza Above by Waw
      .replaceAll('\u0624', '\u0648')

      //Replace Ta Marbuta by Ha
      .replaceAll('\u0629', '\u0647')

      //Replace Ya
      // and Ya Hamza Above by Alif Maksura
      .replaceAll('\u064A', '\u0649')
      .replaceAll('\u0626', '\u0649')

      // Replace Alifs with Hamza Above/Below
      // and with Madda Above by Alif
      .replaceAll('\u0622', '\u0627')
      .replaceAll('\u0623', '\u0627')
      .replaceAll('\u0625', '\u0627');

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
                          itmes.price = text;
                        });

                        print("First text field: $text");
                      },
                      // autofocus: true,
                      decoration: new InputDecoration(
                          hintText: itmes.price,
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
                  child: Text(itmes.aftorDiscount,
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
