import 'package:delit_app/page/Homes/home_main_page.dart';
import 'package:delit_app/theme.dart';
import 'package:flutter/material.dart';

class ListKonsulPage extends StatelessWidget {
  const ListKonsulPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget headerListKonsul() {
      return Container(
        margin: EdgeInsets.only(
          top: 25,
          bottom: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(
                top: 10,
                bottom: 10,
              ),
              child: Text(
                'Mulai periksa diri kamu dengan para pakar yang kami sediakan',
                style: primaryTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: bold,
                ),
              ),
            ),
            Container(
              width: 60,
              height: 4,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
            )
          ],
        ),
      );
    }

    Widget rekomendasiPsikolog() {
      return Container(
        margin: EdgeInsets.symmetric(
          vertical: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text(
                'Rekomendasi Untuk kamu',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semibold,
                ),
              ),
            ),

            // list Piskolog rekomen
            SizedBox(
              height: 170,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: [
                  CircleRekomenPsikolog(
                    name: 'Tasya Andisari',
                    title: 'Kesehatan mental',
                  ),
                  CircleRekomenPsikolog(
                    name: 'Tasya Andisari',
                    title: 'Kesehatan mental',
                  ),
                  CircleRekomenPsikolog(
                    name: 'Tasya Andisari',
                    title: 'Kesehatan mental',
                  ),
                  CircleRekomenPsikolog(
                    name: 'Tasya Andisari',
                    title: 'Kesehatan mental',
                  ),
                  CircleRekomenPsikolog(
                    name: 'Tasya Andisari',
                    title: 'Kesehatan mental',
                  ),
                  CircleRekomenPsikolog(
                    name: 'Tasya Andisari',
                    title: 'Kesehatan mental',
                  ),
                  CircleRekomenPsikolog(
                    name: 'Tasya Andisari',
                    title: 'Kesehatan mental',
                  ),
                  CircleRekomenPsikolog(
                    name: 'Tasya Andisari',
                    title: 'Kesehatan mental',
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }

    Widget pakarPsikologi() {
      return Container(
          // child: Text('Pakar Psikolgi Yang kamu Sediakan.', style: primaryTextStyle.copyWith(fontSize: ),),
          );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 75,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Image.asset(
          'assets/images/logo-mahan.png',
          width: 85,
        ),
        actions: [
          SettingAppbar(),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        child: ListView(
          children: [
            headerListKonsul(),
            rekomendasiPsikolog(),
            pakarPsikologi(),
          ],
        ),
      ),
    );
  }
}

class CircleRekomenPsikolog extends StatelessWidget {
  const CircleRekomenPsikolog({
    Key? key,
    required this.name,
    this.title,
    this.route,
  }) : super(key: key);

  final String name;
  final String? title;
  final String? route;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 20,
        right: 7,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 100,
            child: CircleAvatar(
              radius: 50,
              backgroundColor: backgroundColor1,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/girl-1.jpg'),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 7,
            ),
            width: 100,
            child: Center(
              child: Text(
                name.toString(),
                style: primaryTextStyle.copyWith(
                  fontSize: 10,
                  fontWeight: regular,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
