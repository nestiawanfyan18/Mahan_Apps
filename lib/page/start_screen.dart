import 'dart:async';

import 'package:delit_app/page/login_page.dart';
import 'package:delit_app/providers/question_provider.dart';
import 'package:delit_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  void initState() {
    getInit();
    super.initState();
  }

  getInit() async {
    print('get data question');

    await Provider.of<QuestionsProvider>(context, listen: false).getQuestions();
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: Stack(
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      bottom: 20,
                    ),
                    width: 120,
                    height: 120,
                    child: Image.asset('assets/logo-delit.png'),
                  ),
                  Container(
                    child: Text(
                      "Delit",
                      style: thiridTextStyle.copyWith(
                        fontSize: 28,
                        fontWeight: bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 10,
                    ),
                    child: Text(
                      "Deteksi Mental & Intervensi Terpadu",
                      style: thiridTextStyle.copyWith(
                        fontSize: 16,
                        fontWeight: medium,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                      bottom: 15,
                    ),
                    child: Text(
                      'supported by :',
                      style: thiridTextStyle.copyWith(
                        fontSize: 14,
                        fontWeight: medium,
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                        child: Container(
                          width: 50,
                          // height: 60,
                          child: Image.asset('assets/lppm-unila.png'),
                        ),
                      ),
                      SizedBox(
                        height: 3,
                      ),
                      Text(
                        "LPPM UNIILA",
                        style: thiridTextStyle.copyWith(
                          fontSize: 10.5,
                          fontWeight: medium,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondScreen {}
