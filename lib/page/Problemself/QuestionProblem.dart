// ignore: unused_import
import 'package:delit_app/component/logo.dart';
import 'package:delit_app/page/Problemself/ArticleProblem.dart';
// ignore: unused_import
import 'package:delit_app/page/login_page.dart';
// ignore: unused_import
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class QuestionProblem extends StatefulWidget {
  const QuestionProblem({Key? key}) : super(key: key);

  @override
  _QuestionProblemState createState() => _QuestionProblemState();
}

class _QuestionProblemState extends State<QuestionProblem> {
  List startValue = [];
  double minValue = -10.0;
  double maxValue = 10.0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    // startValue.clear();

    if(startValue.isEmpty){
      for (var i = 0; i < 20; i++) {
        startValue.add(0);
      }
    }

    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.only(
              top: size.height * 0.05,
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
                            fontFamily: "DMSans-Medium", color: Colors.white),
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
          Expanded(
            child: Stack(
              children: [
                // Image.asset(
                //   'assets/images/Wallpaper/698623.png',
                //   fit: BoxFit.cover,
                //   width: double.infinity,
                // ),
                Container(
                  // margin: EdgeInsets.only(top: size.height * 0.05),
                  child: Image.asset(
                    'assets/Searching-For-Answers.png',
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),

                DraggableScrollableSheet(
                  initialChildSize: 0.45,
                  minChildSize: 0.4,
                  maxChildSize: 0.9,
                  builder: (BuildContext contaxt,
                      ScrollController scrollController) {
                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        child: Column(
                          children: [
                            Container(
                              width: size.width * 0.88,
                              margin: EdgeInsets.only(top: 25),
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Hubungan Dalam Keluarga",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'DMSansMedium',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                            Container(
                              width: size.width * 0.88,
                              padding: const EdgeInsets.only(
                                bottom: 10,
                              ),
                              margin: EdgeInsets.only(top: size.height * 0.01),
                              child: Text(
                                "Isi kuesioner ini dulu ya, agar mahan bisa membantumu.",
                                style: TextStyle(
                                    fontSize: 13,
                                    fontFamily: 'DMSansMedium',
                                    fontWeight: FontWeight.w500),
                              ),
                              decoration: BoxDecoration(
                                border: Border(
                                  bottom:
                                      BorderSide(color: Colors.grey.shade400),
                                ),
                              ),
                            ),
                            Expanded(
                              child: ListView.builder(
                                itemCount: 20,
                                controller: scrollController,
                                itemBuilder: (BuildContext context, int index) {
                                  return Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.all(5),
                                        child: ListTile(
                                          title: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                "${index.toString()}. Apakah anda sedang dalam merasa kecewa ? Value : ${startValue[index].toString()}",
                                                style: TextStyle(),
                                                textAlign: TextAlign.left,
                                              ),
                                              Slider(
                                                value: startValue[index]
                                                    .toDouble(),
                                                min: minValue,
                                                max: maxValue,
                                                onChanged: (values) {
                                                  setState(() {
                                                    startValue[index] =
                                                        values.toInt();
                                                  });
                                                },
                                              ),
                                            ],
                                          ),
                                          // trailing: Icon(Icons.add),
                                        ),
                                        decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey.shade400),
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                      // Text(index.toString() +
                                      //     " - " +
                                      //     (startValue.length.toString())),

                                      if (index == (startValue.length - 1))
                                        Container(
                                          margin: EdgeInsets.only(
                                            top: size.height * 0.02,
                                            bottom: 20,
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
                                                    return ArticleProblem();
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
                                            color: Theme.of(context)
                                                .backgroundColor,
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              side: BorderSide(
                                                  color: Theme.of(context)
                                                      .backgroundColor),
                                            ),
                                          ),
                                        ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                        ),
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
