// @dart=2.9
import 'package:delit_app/page/Homes/Article/main_article_page.dart';
import 'package:delit_app/page/Homes/Article/view_article_page.dart';
import 'package:delit_app/page/Homes/main_page.dart';
import 'package:delit_app/page/login_page.dart';
import 'package:delit_app/page/start_screen.dart';
import 'package:delit_app/providers/auth_provider.dart';
import 'package:delit_app/providers/question_provider.dart';
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
          '/article': (context) => MainArticlePage(),
          '/article-view': (context) => ViewArticlePage(),
        },
      ),
    );
  }
}
