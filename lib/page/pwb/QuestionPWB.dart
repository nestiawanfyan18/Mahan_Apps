import 'dart:convert';

import 'package:delit_app/Models/answer_question.dart';
import 'package:delit_app/Models/questions_models.dart';
import 'package:delit_app/Models/user_models.dart';
import 'package:delit_app/component/loading_bottom.dart';
import 'package:delit_app/component/logo.dart';
import 'package:delit_app/page/login_page.dart';
import 'package:delit_app/page/problemDiri.dart';
import 'package:delit_app/page/pwb/resultPWB.dart';
import 'package:delit_app/providers/startScreenPWB.dart';
import 'package:delit_app/providers/answer_provider.dart';
import 'package:delit_app/providers/auth_provider.dart';
import 'package:delit_app/providers/get_answer_question_Provider.dart';
import 'package:delit_app/providers/question_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:delit_app/theme.dart';

class QuestionPWB extends StatefulWidget {
  const QuestionPWB({Key? key}) : super(key: key);

  @override
  _QuestionPWBState createState() => _QuestionPWBState();
}

class _QuestionPWBState extends State<QuestionPWB> {
  List startValue = [];
  List typeAnswer = [];
  double minValue = 0.0;
  double maxValue = 10.0;
  bool isLoading = false;
  double resultPoint = 0;
  int i = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    QuestionsProvider questionsProvider =
        Provider.of<QuestionsProvider>(context);
    List<QuestionsModels> question = questionsProvider.questionPWB;

    GetAnswerQuestionsProvider getAnswerProvider =
        Provider.of<GetAnswerQuestionsProvider>(context);

    AnswerQuestionProvider answerQuestionProvider =
        Provider.of<AnswerQuestionProvider>(context);

    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModels user = authProvider.user;

    // final String data = jsonDecode(question[1].typeAnswer.toString());
    // print("data Answer - ID Type Answet : ${question[1].}");

    // for (var i = 0; i < questionsProvider.questionPWB.length; i++) {
    //   print("data Answer : ${question[i].typeAnswer}");
    // }

    if (startValue.isEmpty) {
      for (var i = 0; i < questionsProvider.questionPWB.length; i++) {
        startValue.add(0);
        // resultPoint += startValue[i];
        // print("Data Result : ${startValue[i]}");
      }
    }

    handleAnswer() async {
      setState(() {
        isLoading = true;
      });

      print(
          "Data Answer : ${startValue}, Hasil : ${resultPoint} , User_id : ${user.id}, Type Question : ${question[0].jenisPertanyaan!.id}, Type Answer : ${question[0].typeAnswer!.id}");

      for (var i = 0; i < questionsProvider.questionPWB.length; i++) {
        typeAnswer.contains(question[i].typeAnswer!.id)
            ? null
            : typeAnswer.add(question[i].typeAnswer!.id);
      }

      print("Type Answer List ${typeAnswer}");

      if (await answerQuestionProvider.answer(
        answer: startValue,
        point_answer: resultPoint,
        user_id: user.id!.toInt(),
        jenisPertanyaan: question[0].jenisPertanyaan!.id!.toInt(),
        typeAnswer: typeAnswer,
      )) {
        if (await authProvider.updateData(
          email: user.email.toString(),
        )) {
          if (await getAnswerProvider.updateDataGetAnswer(
            user_id: user.id.toString(),
          )) {
            isLoading = false;
            Navigator.pushReplacementNamed(context, '/home');
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: dangerColor,
                content: Text(
                  'Tidak Dapat Hasil Test. Error Get Answer PWB!',
                  textAlign: TextAlign.center,
                  style: primaryTextStyle.copyWith(
                    color: thridTextColor,
                    fontSize: 14,
                    fontWeight: semibold,
                  ),
                ),
              ),
            );
          }
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: dangerColor,
              content: Text(
                'Tidak Dapat Hasil Test. Error Get User!',
                textAlign: TextAlign.center,
                style: primaryTextStyle.copyWith(
                  color: thridTextColor,
                  fontSize: 14,
                  fontWeight: semibold,
                ),
              ),
            ),
          );
        }

        // Navigator.pushReplacement(
        //  context,
        //  MaterialPageRoute(
        //    builder: (context) {
        //      return ResultPWB();
        //    },
        //  ),
        //);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: dangerColor,
            content: Text(
              'Gagal Menjawab',
              textAlign: TextAlign.center,
              style: primaryTextStyle.copyWith(
                color: thridTextColor,
                fontSize: 14,
                fontWeight: semibold,
              ),
            ),
          ),
        );
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
                  itemCount: questionsProvider.questionPWB.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(5),
                          child: ListTile(
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "${(index + 1).toString()}. ${question[index].question} ? Nilai : ${startValue[index].toString()}",
                                  style: TextStyle(),
                                  textAlign: TextAlign.left,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      'Ga Banget',
                                      style: primaryTextStyle.copyWith(
                                        fontSize: 12,
                                        fontWeight: semibold,
                                      ),
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
                                    Text(
                                      'Gue Banget',
                                      style: primaryTextStyle.copyWith(
                                        fontSize: 12,
                                        fontWeight: semibold,
                                      ),
                                    ),
                                  ],
                                )
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
                            child: (isLoading)
                                ? RaisedButton(
                                    padding: EdgeInsets.only(
                                      top: 13,
                                      bottom: 13,
                                      left: size.height * 0.055,
                                      right: size.height * 0.055,
                                    ),
                                    onPressed: (handleAnswer),
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      valueColor: AlwaysStoppedAnimation(
                                        backgroundColor1,
                                      ),
                                    ),
                                    color: Theme.of(context).backgroundColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      side: BorderSide(
                                          color: Theme.of(context)
                                              .backgroundColor),
                                    ),
                                  )
                                : RaisedButton(
                                    padding: EdgeInsets.only(
                                      top: 13,
                                      bottom: 13,
                                      left: size.height * 0.055,
                                      right: size.height * 0.055,
                                    ),
                                    onPressed: handleAnswer,
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
            )
          ],
        ),
      ),
    );
  }
}
