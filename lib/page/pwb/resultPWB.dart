import 'package:delit_app/component/logo.dart';
import 'package:delit_app/page/login_page.dart';
import 'package:delit_app/page/problemDiri.dart';
import 'package:delit_app/providers/startScreenPWB.dart';
import 'package:flutter/material.dart';

class ResultPWB extends StatefulWidget {
  const ResultPWB({Key? key}) : super(key: key);

  @override
  _ResultPWBState createState() => _ResultPWBState();
}

class _ResultPWBState extends State<ResultPWB> {
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

                  Container(
                    margin: EdgeInsets.only(
                      bottom: 10,
                    ),
                    padding: EdgeInsets.only(
                        left: size.width * 0.13, right: size.width * 0.13),
                    child: Text(
                      'Hasil Terbaikmu ada di aspek :',
                      style: TextStyle(
                        fontFamily: 'DMSansMedium',
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  // text pesan
                  Container(
                    padding: EdgeInsets.only(
                        left: size.width * 0.13, right: size.width * 0.13),
                    child: Text(
                      'Environmental Mastery',
                      style: TextStyle(
                        fontFamily: 'DMSansMedium',
                        fontSize: 23,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  Container(
                    width: 60,
                    margin: EdgeInsets.only(
                      top: 5,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: Theme.of(context).backgroundColor, width: 2.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(
                      top: 15,
                      bottom: 10,
                    ),
                    padding: EdgeInsets.only(
                        left: size.width * 0.13, right: size.width * 0.13),
                    child: Text(
                      'Agar Mahan dapat membantu mengembangkan kepribadianmu, kita lanjut ke halaman berikut ya.. ',
                      style: TextStyle(
                        fontFamily: 'DMSansMedium',
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  // button start
                  Center(
                    child: Container(
                      margin: EdgeInsets.only(
                        top: size.height * 0.015,
                        bottom: 30,
                      ),
                      // ignore: deprecated_member_use
                      child: RaisedButton(
                        onPressed: () {
                          Navigator.pushReplacementNamed(context, '/home');
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) {
                          //       return QuestionPWB();
                          //     },
                          //   ),
                          // );
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
