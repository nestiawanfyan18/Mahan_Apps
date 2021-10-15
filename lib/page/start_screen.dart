import 'dart:async';

import 'package:delit_app/page/login_page.dart';
import 'package:delit_app/providers/question_provider.dart';
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
    await Provider.of<QuestionsProvider>(context, listen: false).getQuestions();
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SizedBox.expand(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              child: Image.asset('assets/images/logo-mahan.png'),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondScreen {}
