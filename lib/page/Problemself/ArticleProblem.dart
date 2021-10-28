// ignore: unused_import
import 'package:delit_app/component/logo.dart';
// ignore: unused_import
import 'package:delit_app/page/login_page.dart';
import 'package:delit_app/providers/startScreenPWB.dart';
import 'package:delit_app/theme.dart';
// ignore: unused_import
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class ArticleProblem extends StatefulWidget {
  const ArticleProblem({Key? key}) : super(key: key);

  @override
  _ArticleProblemState createState() => _ArticleProblemState();
}

class _ArticleProblemState extends State<ArticleProblem> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      // appBar: AppBar(),
      body: SafeArea(
        child: Container(
          height: size.height * 1,
          width: size.width * 1,
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: size.height * 0.05,
                ),
                padding: EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // logo
                    Container(
                      width: 125,
                      // margin: EdgeInsets.only(bottom: size.height * 0.02),
                      child: Image.asset('assets/images/logo-mahan.png'),
                    ),

                    //exit
                    Container(
                      margin: EdgeInsets.only(
                          // top: size.height * 0.05,
                          ),
                      // ignore: deprecated_member_use
                      child: TextButton(
                        onPressed: () => showDialog<String>(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                            title: Text(
                              "Keluar",
                              style: TextStyle(
                                fontFamily: "FredokaOne",
                              ),
                            ),
                            content: Text(
                              "Apakah kamu yakin ingin keluar ? ",
                              style: TextStyle(
                                fontFamily: "DMSansMedium",
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () =>
                                    Navigator.pop(context, 'Cancel'),
                                child: Text("Cancel"),
                              ),
                              // ignore: deprecated_member_use
                              RaisedButton(
                                onPressed: () => Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return LoginPage();
                                    },
                                  ),
                                ),
                                color: Colors.red[900],
                                child: Text(
                                  "Keluar",
                                  style: TextStyle(
                                      fontFamily: "DMSans-Medium",
                                      color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                        child: Icon(
                          Icons.power_settings_new,
                          color: Theme.of(context).backgroundColor,
                          size: 28,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.only(
                  left: 15,
                  right: 15,
                ),
                child: Stack(
                  children: [
                    SizedBox(
                      height: 80,
                      child: ListView(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            child: Text(
                              "Dari Jawabanmu ternyata kamu tipe :",
                              style: TextStyle(
                                fontFamily: 'DMSansReguler',
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 5),
                            child: Text(
                              "Introvert",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontFamily: 'DMSansMedium',
                                fontSize: 34,
                              ),
                            ),
                          ),
                          Container(
                            width: 60,
                            margin: EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: Theme.of(context).backgroundColor,
                                    width: 3),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          SizedBox(
                            height: 35,
                          ),
                          Container(
                            margin: EdgeInsets.only(
                              bottom: 20,
                            ),
                            child: Text(
                              "Penjelasan",
                              style: TextStyle(
                                fontFamily: 'DMSansMedium',
                                fontWeight: FontWeight.w700,
                                fontSize: 20,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(bottom: 30),
                            child: Wrap(
                              direction: Axis.horizontal,
                              children: <Widget>[
                                Text(
                                  "Lorem Ipsum is simply dummy text of the printing and rambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. ",
                                  softWrap: true,
                                ),
                              ],
                            ),
                          ),

                          // list Artikel
                          Container(
                            child: Text(
                              'Rekomendasi Untuk kamu',
                              style: primaryTextStyle.copyWith(
                                fontSize: 16,
                                fontWeight: semibold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // btn Next
                    Positioned.fill(
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: Container(
                          margin: EdgeInsets.only(
                            top: size.height * 0.002,
                            bottom: 30,
                          ),
                          // ignore: deprecated_member_use
                          child: RaisedButton(
                            padding: EdgeInsets.only(
                              top: 13,
                              bottom: 13,
                              left: size.height * 0.055,
                              right: size.height * 0.055,
                            ),
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return StartScreenPWB();
                                  },
                                ),
                              );
                            },
                            child: Text(
                              "Selanjutnya",
                              style: TextStyle(
                                fontFamily: 'DMSansMedium',
                                fontWeight: FontWeight.w500,
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                            color: Theme.of(context).backgroundColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                              side: BorderSide(
                                  color: Theme.of(context).backgroundColor),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
