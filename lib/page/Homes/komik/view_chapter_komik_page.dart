import 'package:flutter/material.dart';
import 'package:delit_app/theme.dart';
import 'package:delit_app/component/component.dart';

class ViewChapterKomikPage extends StatelessWidget {
  const ViewChapterKomikPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: appBarHeight,
          title: Text(
            "Chapter 1 - Perkenalan",
            style: primaryTextStyle.copyWith(
              fontWeight: semibold,
              fontSize: 18,
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButtonBackApps(),
          // actions: [
          //   EmergencyButtonAppbar(),
          // ],
        ),
        body: Container(
          width: double.infinity,
          child: Image.asset('assets/images/cover_comic/chapter-komik.jpg'),
        ));
  }
}
