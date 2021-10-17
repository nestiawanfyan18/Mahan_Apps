import 'package:delit_app/Models/get_answer_questions_models.dart';
import 'package:delit_app/Models/user_models.dart';
import 'package:delit_app/component/component.dart';
import 'package:delit_app/providers/auth_provider.dart';
import 'package:delit_app/providers/get_answer_question_Provider.dart';
import 'package:flutter/material.dart';
import 'package:delit_app/theme.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String typePsikologi = "";
  int typePsikologiLevel = 1;
  bool successGetData = false;

  @override
  void initState() {
    // getAnswerPWB();
    super.initState();
  }

  // getAnswerPWB() {
  //   WidgetsBinding.instance!.addPostFrameCallback((timeStamp) => getDataAnswerPWB();

  // }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModels user = authProvider.user;

    SchedulerBinding.instance!.addPostFrameCallback((timeStamp) async {
      AuthProvider authProvider =
          Provider.of<AuthProvider>(context, listen: false);
      UserModels user = authProvider.user;

      if (user.test_psikologi == '1') {
        GetAnswerQuestionsProvider getAnswerProvider =
            Provider.of<GetAnswerQuestionsProvider>(context, listen: false);

        if (await getAnswerProvider.updateDataGetAnswer(
          user_id: user.id.toString(),
        )) {
          print("Get Data Answer PWB - Success");

          GetAnswerQuestionModels answerPWB =
              getAnswerProvider.getAnswerQuestion;

          print("Hellow mendapatkan data nich : ${answerPWB.point_answer}");

          if (answerPWB.point_answer! >= 1 && answerPWB.point_answer! <= 100) {
            typePsikologi = "Gawat Nih";
            typePsikologiLevel = 1;
          } else if (answerPWB.point_answer! >= 101 &&
              answerPWB.point_answer! <= 200) {
            typePsikologi = "Perlu Hati-Hati";
            typePsikologiLevel = 2;
          } else {
            typePsikologi = "Kamu Aman";
            typePsikologiLevel = 3;
          }

          setState(() {});
        }
      }
    });

    // void getDataAnswerPWB() async {

    // }

    Widget selamatDatangUser() {
      return Container(
        margin: EdgeInsets.symmetric(vertical: defaultMargin),
        child: Row(
          children: [
            Container(
              width: 67,
              height: 67,
              margin: EdgeInsets.only(right: 15),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/man-1.jpg'),
                ),
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Haloo, ${user.name}",
                    style: primaryTextStyle.copyWith(
                      fontWeight: semibold,
                      fontSize: 23,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: 5,
                    ),
                    child: Text(
                      (user.asal_kampus != null)
                          ? 'Mahasiswa di Universitas Lampung'
                          : '-',
                      style: primaryTextStyle.copyWith(
                        fontSize: 11,
                        fontWeight: regular,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
    }

    Widget statusPsikologi() {
      return Container(
        margin: EdgeInsets.symmetric(
          vertical: 15,
        ),
        padding: EdgeInsets.all(15),
        width: double.infinity,
        decoration: BoxDecoration(
          color: backgroundColor1,
          borderRadius: BorderRadius.circular(10),
          // border: Border.all(color: dangerColor),
        ),
        child: Row(
          children: [
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        'Warna Keadaan Psikologi kamu Saat ini.',
                        style: primaryTextStyle.copyWith(
                          fontSize: 14,
                          fontWeight: semibold,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        top: 7,
                      ),
                      child: Text(
                        "Setiap warna akan memberikan tanda keadaan psikologi kamu.",
                        style: primaryTextStyle.copyWith(
                          fontSize: 10,
                          fontWeight: regular,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 6),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                              top: 10,
                              right: 15,
                            ),
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              color: (typePsikologiLevel == 1)
                                  ? dangerColor
                                  : (typePsikologiLevel == 2)
                                      ? warningColor
                                      : successColor,
                              borderRadius: BorderRadius.circular(100),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 7),
                            child: Text(
                              typePsikologi,
                              style: primaryTextStyle.copyWith(
                                fontSize: 20,
                                fontWeight: bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(top: 15),
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        child: Center(
                          child: Text(
                            'Periksa Sekarang',
                            style: thiridTextStyle.copyWith(
                              fontSize: 12,
                              fontWeight: semibold,
                            ),
                          ),
                        ),
                        decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(7),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget rekomendArtikel() {
      return Container(
        margin: EdgeInsets.only(
          top: 20,
        ),
        child: Column(
          children: [
            TitleListComponent(
              title: 'Rekomendasi Artikel Untuk Kamu',
              isMore: true,
              route: '/article',
            ),
            CardArticle(
              imgProfile: 'assets/images/man-1.jpg',
              nameUser: 'Nestiawan Ferdiyanto',
              bioUser: 'Hidup Lebih Baik',
              imgCover: 'assets/images/Artikel/Pengendalian_Emosi.png',
              titleArticle:
                  'Cara untuk Meredakan emosi ketika dalam kondisi yang tidak kondusif ',
              dateArticle: '2 Minggu yang lalu',
              route: '/article-view',
            ),
            CardArticle(
              imgProfile: 'assets/images/man-1.jpg',
              nameUser: 'Nestiawan Ferdiyanto',
              bioUser: 'Hidup Lebih Baik',
              imgCover: 'assets/images/Artikel/Meredakan_Cemas.jpg',
              titleArticle:
                  'Cara untuk Meredakan emosi ketika dalam kondisi yang tidak kondusif ',
              dateArticle: '2 Minggu yang lalu',
              route: '/article-view',
            ),
            CardArticle(
              imgProfile: 'assets/images/man-1.jpg',
              nameUser: 'Nestiawan Ferdiyanto',
              bioUser: 'Hidup Lebih Baik',
              imgCover: 'assets/images/Artikel/Mengurangi_Stress.jpg',
              titleArticle:
                  'Cara untuk Meredakan emosi ketika dalam kondisi yang tidak kondusif ',
              dateArticle: '2 Minggu yang lalu',
              route: '/article-view',
            ),
          ],
        ),
      );
    }

    Widget ajakTest() {
      return Container(
        margin: EdgeInsets.only(
          bottom: 20,
          top: 15,
        ),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: backgroundColor1,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text(
                'Yuk Mulai Periksa Psikologis kamu. - ${user.test_psikologi}',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: bold,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, '/start-pwb');
              },
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 15),
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                child: Center(
                  child: Text(
                    'Tes Sekarang',
                    style: thiridTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: semibold,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(7),
                ),
              ),
            ),
          ],
        ),
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
        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: ListView(
          children: [
            selamatDatangUser(),
            (user.test_psikologi == '1') ? statusPsikologi() : ajakTest(),
            rekomendArtikel(),
          ],
        ),
      ),
    );
  }
}

class SettingAppbar extends StatelessWidget {
  const SettingAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: 15,
      ),
      width: 28,
      child: Image.asset('assets/icons/setting_icon.png'),
    );
  }
}

class TitleListComponent extends StatelessWidget {
  const TitleListComponent({
    Key? key,
    required this.title,
    required this.isMore,
    this.route,
  }) : super(key: key);

  final String title;
  final bool isMore;
  final String? route;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Rekomendasi Artikel Untuk Kamu',
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: semibold,
            ),
          ),
          (isMore == true)
              ? GestureDetector(
                  onTap: () {
                    (route != null)
                        ? Navigator.pushNamed(context, route.toString())
                        : false;
                  },
                  child: Text(
                    'Selengkapnya',
                    style: primaryTextStyle.copyWith(
                      fontSize: 10,
                      fontWeight: regular,
                    ),
                  ),
                )
              : Text(''),
        ],
      ),
    );
  }
}
