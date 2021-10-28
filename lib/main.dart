// @dart=2.9
import 'package:delit_app/Models/get_answer_questions_models.dart';
import 'package:delit_app/page/Homes/Article/main_article_page.dart';
import 'package:delit_app/page/Homes/Article/view_article_page.dart';
import 'package:delit_app/page/Homes/komik/detail_komik_page.dart';
import 'package:delit_app/page/Homes/komik/main_komik.dart';
import 'package:delit_app/page/Homes/komik/view_chapter_komik_page.dart';
import 'package:delit_app/page/Homes/list_konsul_page.dart';
import 'package:delit_app/page/Homes/main_page.dart';
import 'package:delit_app/page/Homes/podcast/main_podcast_page.dart';
import 'package:delit_app/page/Homes/result_test/main_result_test.dart';
import 'package:delit_app/page/login_page.dart';
import 'package:delit_app/providers/startScreenPWB.dart';
import 'package:delit_app/page/start_screen.dart';
import 'package:delit_app/providers/answer_provider.dart';
import 'package:delit_app/providers/auth_provider.dart';
import 'package:delit_app/providers/get_answer_question_Provider.dart';
import 'package:delit_app/providers/question_provider.dart';
import 'package:delit_app/providers/type_answer_pwb_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'konsultasi/main_home_page.dart';
import 'theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthProvider()),
        ChangeNotifierProvider(create: (context) => QuestionsProvider()),
        ChangeNotifierProvider(create: (context) => AnswerQuestionProvider()),
        ChangeNotifierProvider(create: (context) => TypeAnswerPWBProvider()),
        ChangeNotifierProvider(
            create: (context) => GetAnswerQuestionsProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Delit",
        theme: ThemeData(
          primaryColor: Color(0xFF24D172),
          backgroundColor: Color(0xFF004368),
        ),
        routes: {
          '/': (context) => StartScreen(),
          '/login': (context) => LoginPage(),
          '/home': (context) => MainPage(),

          // education
          '/education': (context) => MainPage(indexPages: 2),

          // konsultasi
          '/konsultasi': (context) => MainPage(indexPages: 1),

          // artikel
          '/article': (context) => MainArticlePage(),
          '/article-view': (context) => ViewArticlePage(),

          // komik
          '/komik': (context) => MainEduKomik(),
          '/detail-komik': (context) => DetailKomikPage(),
          '/view-chapter-komik': (context) => ViewChapterKomikPage(),

          // podcast
          '/podcast': (context) => MainPodcastPage(),

          // result PWB
          '/main-result-test': (context) => MainResultTest(),

          // PWB Link
          '/start-pwb': (context) => StartScreenPWB(),
        },
      ),
    );
  }
}
