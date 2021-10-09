import 'package:delit_app/component/logo.dart';
import 'package:delit_app/page/Problemself/QuestionProblem.dart';
import 'package:delit_app/page/login_page.dart';
// ignore: unused_import
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SelectionProblems extends StatefulWidget {
  const SelectionProblems({Key? key}) : super(key: key);

  @override
  _SelectionProblemsState createState() => _SelectionProblemsState();
}

class _SelectionProblemsState extends State<SelectionProblems> {
  // ignore: unused_field
  var valueChoice;

  List<String> listItem = [
    'Hubungan Dengan Kekasih',
    'Keluarga',
    'Karir',
    'Khawatir dengan Masa Depan'
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: <Widget>[
              //exit
              Container(
                margin: EdgeInsets.only(
                    top: size.height * 0.05, right: size.width * 0.03),
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
                margin: EdgeInsets.only(bottom: size.height * 0.02),
                child: Image.asset('assets/images/logo-mahan.png'),
              ),

              // Illustration
              Container(
                width: size.width * 0.9,
                height: size.height * 0.35,
                margin: EdgeInsets.only(top: size.height * 0.01),
                child: Image.asset('assets/Searching-For-Answers.png'),
              ),

              // text pesan
              Container(
                padding: EdgeInsets.only(
                  left: size.width * 0.13,
                  right: size.width * 0.13,
                ),
                margin: EdgeInsets.only(
                  top: size.height * 0.02,
                ),
                child: Text(
                  'Apa yang kamu khawatirkan ?',
                  style: TextStyle(
                    fontFamily: 'DMSansMedium',
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              // Select problem
              Container(
                padding: EdgeInsets.only(left: 10, right: 10),
                width: size.width * 0.7,
                margin: EdgeInsets.only(top: size.height * 0.0180),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    isExpanded: true,
                    hint: Text("Silakan Pilih Salah satu"),
                    value: valueChoice,
                    onChanged: (selectedValue) {
                      setState(() {
                        valueChoice = selectedValue.toString();
                      });
                    },
                    items: listItem.map((valueItem) {
                      return DropdownMenuItem<String>(
                        child: Text(valueItem),
                        value: valueItem,
                      );
                    }).toList(),
                  ),
                ),
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: BorderSide(color: Theme.of(context).backgroundColor),
                  ),
                ),
              ),

              // text info start
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: size.height * 0.01),
                  child: Text(
                    "Silakan pilih sesuai yang kamu alami.",
                    style: TextStyle(
                      fontFamily: 'DMSansMedium',
                      color: Colors.black45,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),

              // button Next
              Container(
                margin: EdgeInsets.only(top: size.height * 0.11),
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
                          return QuestionProblem();
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
                    side: BorderSide(color: Theme.of(context).backgroundColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
