import 'package:delit_app/component/logo.dart';
import 'package:delit_app/page/login_page.dart';
import 'package:delit_app/page/problemDiri.dart';
import 'package:flutter/material.dart';

class StartQuestion extends StatefulWidget {
  const StartQuestion({Key? key}) : super(key: key);

  @override
  _StartQuestionState createState() => _StartQuestionState();
}

class _StartQuestionState extends State<StartQuestion> {
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
                        top: size.height * 0.01, right: size.width * 0.03),
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
                    margin: EdgeInsets.only(bottom: size.height * 0.05),
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
                      // 'Kami akan memberikan beberapa pertanyaan untuk mengetahui skor tentang psikologi anda, silakan untuk tenang dalam menjawabnya dan tidak untuk terburu-buru.',
                      // 'Sebelum kita menggunakan aplikasi ini, kita cari tahu dahulu yuk kondisi psikologismu, '
                      'Selamat Datang di Aplikasi Mahan Psikologi. Mahan akan membantumu menjadi pribadi yang sehat mental.',
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
                      margin: EdgeInsets.only(top: size.height * 0.04),
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
                                return ProblemDiri();
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
