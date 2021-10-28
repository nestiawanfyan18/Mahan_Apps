import 'package:delit_app/component/logo.dart';
import 'package:delit_app/page/login_page.dart';
import 'package:delit_app/page/problemDiri.dart';
import 'package:delit_app/page/pwb/QuestionPWB.dart';
import 'package:flutter/material.dart';

class StartScreenPWB extends StatefulWidget {
  const StartScreenPWB({Key? key}) : super(key: key);

  @override
  _StartScreenPWBState createState() => _StartScreenPWBState();
}

class _StartScreenPWBState extends State<StartScreenPWB> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Container(
        child: Center(
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  //exit
                  Container(
                    margin: EdgeInsets.only(
                      top: size.height * 0.01,
                      right: size.width * 0.03,
                    ),
                    alignment: Alignment.topRight,
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
                              onPressed: () => Navigator.pop(context, 'Cancel'),
                              child: Text("Cancel"),
                            ),
                            // ignore: deprecated_member_use
                            RaisedButton(
                              onPressed: () => Navigator.pushReplacementNamed(
                                  context, '/home'),
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
                      ),
                    ),
                  ),

                  // Logo
                  Container(
                    width: 140,
                    margin: EdgeInsets.only(bottom: size.height * 0.01),
                    child: Image.asset('assets/images/logo-mahan.png'),
                  ),

                  // Illustration
                  Container(
                    width: size.width * 0.9,
                    height: size.height * 0.35,
                    margin: EdgeInsets.only(top: size.height * 0.07),
                    child: Image.asset('assets/meditation.png'),
                  ),

                  // text pesan
                  Container(
                    padding: EdgeInsets.only(
                        left: size.width * 0.13, right: size.width * 0.13),
                    child: Text(
                      'Yuk Mahan bantu kenali diri kamu lebih jauh.',
                      style: TextStyle(
                        fontFamily: 'DMSansMedium',
                        fontSize: 16,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  // text info start
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: size.height * 0.05),
                      child: Text(
                        "Silakan pilih mulai untuk memulai",
                        style: TextStyle(
                          fontFamily: 'DMSansMedium',
                          color: Colors.black45,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  ),

                  // button start
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(top: size.height * 0.01),
                      // ignore: deprecated_member_use
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return QuestionPWB();
                              },
                            ),
                          );
                        },
                        padding: EdgeInsets.only(
                            top: 13,
                            bottom: 13,
                            left: size.height * 0.09,
                            right: size.height * 0.09),
                        child: Text(
                          "Mulai",
                          style: TextStyle(
                            fontFamily: 'DMSansMedium',
                            fontSize: 16,
                            color: Colors.white,
                            letterSpacing: 1.1,
                          ),
                        ),
                        color: Theme.of(context).backgroundColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
