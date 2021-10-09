import 'package:delit_app/component/logo.dart';
import 'package:delit_app/page/login_page.dart';
import 'package:delit_app/page/problemDiri.dart';
import 'package:delit_app/page/pwb/resultPWB.dart';
import 'package:delit_app/page/pwb/startScreenPWB.dart';
import 'package:flutter/material.dart';

class QuestionPWB extends StatefulWidget {
  const QuestionPWB({Key? key}) : super(key: key);

  @override
  _QuestionPWBState createState() => _QuestionPWBState();
}

class _QuestionPWBState extends State<QuestionPWB> {
  List startValue = [];
  double minValue = -10.0;
  double maxValue = 10.0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    if (startValue.isEmpty) {
      for (var i = 0; i < 20; i++) {
        startValue.add(0);
      }
    }

    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: size.height * 0.08,
              ),
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // logo
                  Container(
                    width: 130,
                    // margin: EdgeInsets.only(bottom: size.height * 0.01),
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
                        size: 28,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // title Question
            Container(
              padding: EdgeInsets.only(
                left: 15,
                right: 15,
              ),
              margin: EdgeInsets.only(
                top: 30,
                bottom: 20,
              ),
              child: Column(
                children: [
                  Text(
                    "Isi sesuai dengan keadaan dirimu ya, agar hasilnya akurat.",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: 'DMSansRegular',
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: Container(
                margin: EdgeInsets.only(
                  top: 3,
                ),
                child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(5),
                          child: ListTile(
                            title: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "${index.toString()}. Apakah anda sedang dalam merasa kecewa ? Value : ${startValue[index].toString()}",
                                  style: TextStyle(),
                                  textAlign: TextAlign.left,
                                ),
                                Slider(
                                  value: startValue[index].toDouble(),
                                  min: minValue,
                                  max: maxValue,
                                  onChanged: (values) {
                                    setState(() {
                                      startValue[index] = values.toInt();
                                    });
                                  },
                                ),
                              ],
                            ),
                            // trailing: Icon(Icons.add),
                          ),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade400),
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        // Text(index.toString() +
                        //     " - " +
                        //     (startValue.length.toString())),

                        if (index == (startValue.length - 1))
                          Container(
                            alignment: Alignment.bottomRight,
                            margin: EdgeInsets.only(
                              top: size.height * 0.02,
                              bottom: 20,
                              right: 20,
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
                                      return ResultPWB();
                                    },
                                  ),
                                );
                              },
                              child: Text(
                                "Lihat Hasil",
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
                      ],
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
