import 'package:delit_app/Models/get_answer_questions_models.dart';
import 'package:delit_app/Models/user_models.dart';
import 'package:delit_app/component/component.dart';
import 'package:delit_app/page/Homes/Article/listDataArtikel.dart';
import 'package:delit_app/page/Homes/list_konsul_page.dart';
import 'package:delit_app/providers/auth_provider.dart';
import 'package:delit_app/providers/get_answer_question_Provider.dart';
import 'package:delit_app/providers/type_answer_pwb_provider.dart';
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
  bool isLoading = false;

  @override
  void initState() {
    // getAnswerPWB();
    isLoading = true;

    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      AuthProvider authProvider =
          Provider.of<AuthProvider>(context, listen: false);
      UserModels user = authProvider.user;

      if (user.test_psikologi == '1') {
        GetAnswerQuestionsProvider getAnswerProvider =
            Provider.of<GetAnswerQuestionsProvider>(context, listen: false);
        TypeAnswerPWBProvider getTypeAnswerPWBProvider =
            Provider.of<TypeAnswerPWBProvider>(context, listen: false);

        await getTypeAnswerPWBProvider.getQuestions(user_id: user.id!.toInt());

        if (await getAnswerProvider.updateDataGetAnswer(
          user_id: user.id.toString(),
        )) {
          print("Get Data Answer PWB and type Answer PWB - Success");
          // setState(() {});

          if (mounted) setState(() {});

          GetAnswerQuestionModels answerPWB =
              getAnswerProvider.getAnswerQuestion;

          print("Hellow mendapatkan data nich : ${answerPWB.point_answer}");

          if (answerPWB.point_answer! >= 0 && answerPWB.point_answer! <= 100) {
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

          isLoading = false;
        }
      }
    });

    super.initState();
  }

  // getAnswerPWB() {
  //   WidgetsBinding.instance!.addPostFrameCallback((timeStamp) => getDataAnswerPWB();
  // }

  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModels user = authProvider.user;

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
                border: Border.all(color: backgroundColor1, width: 0.8),
                image: new DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('assets/images/avatar.jpg'),
                ),
              ),
            ),
            Expanded(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Haloo, ${user.name}",
                      style: primaryTextStyle.copyWith(
                        fontWeight: semibold,
                        fontSize: 25,
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
                          fontSize: 16,
                          fontWeight: semibold,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 6),
                      child: (isLoading)
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  width: 16,
                                  height: 16,
                                  child: CircularProgressIndicator(
                                    strokeWidth: 2,
                                    valueColor: AlwaysStoppedAnimation(
                                      primaryColor,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Loading',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontFamily: 'DMSans-Medium',
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            )
                          : Row(
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
                    Container(
                      margin: EdgeInsets.only(
                        top: 13,
                      ),
                      child: Text(
                        "Setiap warna akan memberikan tanda keadaan psikologi kamu.",
                        style: primaryTextStyle.copyWith(
                          fontSize: 11.5,
                          fontWeight: regular,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        (isLoading)
                            ? print(false)
                            : Navigator.pushNamed(context, '/main-result-test');
                      },
                      child: Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(top: 15),
                        padding: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 20,
                        ),
                        child: (isLoading)
                            ? Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 16,
                                    height: 16,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      valueColor: AlwaysStoppedAnimation(
                                        backgroundColor1,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    'Loading',
                                    style: thiridTextStyle.copyWith(
                                      fontSize: 12,
                                      fontWeight: semibold,
                                    ),
                                  ),
                                ],
                              )
                            : Center(
                                child: Text(
                                  'Lihat Selangkapnya',
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
      final List artikel = dataArtikel;
      print("Data Artikel : ${artikel[1]['title']}");

      return Container(
        margin: EdgeInsets.only(
          top: 20,
        ),
        child: Column(
          children: [
            TitleListComponent(
              title: 'Rekomendasi Artikel Untuk Kamu',
              isMore: true,
              route: '/education',
            ),

            for (var i = 0; i < artikel.length; i++)
              CardArticle(
                imgProfile: 'assets/images/man-1.jpg',
                nameUser: 'Nestiawan Ferdiyanto',
                bioUser: 'Hidup Lebih Baik',
                imgCover: artikel[i]['images'].toString(),
                titleArticle: artikel[i]['title'].toString(),
                dateArticle: '2 Minggu yang lalu',
                route: '/article-view',
                argumenID: i,
              ),
            // CardArticle(
            //   imgProfile: 'assets/images/man-1.jpg',
            //   nameUser: 'Nestiawan Ferdiyanto',
            //   bioUser: 'Hidup Lebih Baik',
            //   imgCover: '${dataArtikel2[2]}',
            //   titleArticle: '${dataArtikel2[1]}',
            //   dateArticle: '2 Minggu yang lalu',
            //   route: '/article-view',
            //   argumenID: 2,
            // ),
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

    Widget historyKegiatan() {
      return Container(
        margin: EdgeInsets.only(
          top: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Mulai Dengarkan Kembali.',
                style: primaryTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: semibold,
                ),
              ),
            ),

            // card Aktivitas
            SizedBox(
              height: 160,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  Row(
                    children: [
                      // fiture 1
                      HistoryPodcastHome(
                        images: 'assets/images/Artikel/meditation.jpg',
                        title: 'Menenangkan Diri.',
                        author: 'Nestiawan Ferdiyanto',
                      ),
                      // fiture 2
                      HistoryPodcastHome(
                        images: 'assets/images/Artikel/Mengurangi_Stress.jpg',
                        title: 'Pengaruh Stress',
                        author: 'Nestiawan Ferdiyanto',
                      ),
                      HistoryPodcastHome(
                        images: 'assets/images/Artikel/Pengendalian_Emosi.png',
                        title: 'Kesal Dengan Tindakan',
                        author: 'Nestiawan Ferdiyanto',
                      ),
                      // fiture 3
                      HistoryPodcastHome(
                        images:
                            'assets/images/PodCast/img-profile-podcast.jpeg',
                        title: 'Berani Untuk Berbicara',
                        author: 'Nestiawan Ferdiyanto',
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }

    Widget rekomendasiPsikolog() {
      return Container(
        margin: EdgeInsets.only(
          top: 15,
          bottom: 5,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleListComponent(
              title: 'Konsultasikan Masalahmu',
              isMore: true,
              route: '/konsultasi',
            ),

            // list Piskolog rekomen
            SizedBox(
              height: 160,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: [
                  CircleRekomenPsikolog(
                    name: 'Shinta Mayasari, S.Psi., M.Psi., Psikolog',
                    title: 'Pengalaman 8 tahun',
                    images: 'assets/images/psikolog/shinta.png',
                  ),
                  CircleRekomenPsikolog(
                    name: 'Moch johan pratama, m.psi, psikolog',
                    title: 'Pengalaman 8 tahun',
                    images: 'assets/images/psikolog/johan.jpeg',
                  ),
                  CircleRekomenPsikolog(
                    name: 'Prida Harkina, S.Psi., M.Psi., Psikolog',
                    title: 'Pengalaman 7 tahun',
                    images: 'assets/images/psikolog/prida.png',
                  ),
                  CircleRekomenPsikolog(
                    name: 'Vira Sandayanti ,S.Psi., M.Psi., Psikolog',
                    title: 'Pengalaman 7 tahun',
                    images: 'assets/images/psikolog/vira.png',
                  ),
                  CircleRekomenPsikolog(
                    name: 'Octa Reni Setiawati, S.Psi., M.Psi., Psikolog',
                    title: 'Pengalaman 8 tahun',
                    images: 'assets/images/psikolog/octa.png',
                  ),
                  CircleRekomenPsikolog(
                    name: 'Susanthi Pradini, S.Psi., M.Psi., Psikolog',
                    title: 'Pengalaman 6 tahun',
                    images: 'assets/images/psikolog/susanthi.png',
                  ),
                  CircleRekomenPsikolog(
                    name: 'Tansri Adzlan Syah, S.Psi., M.Psi., Psikolog',
                    title: 'Pengalaman 7 tahun',
                    images: 'assets/images/psikolog/tansri.png',
                  ),
                ],
              ),
            )
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
        child: ScrollConfiguration(
          behavior: MyBehavior(),
          child: ListView(
            children: [
              selamatDatangUser(),
              (user.test_psikologi == '1') ? statusPsikologi() : ajakTest(),
              historyKegiatan(),
              rekomendasiPsikolog(),
              rekomendArtikel(),
            ],
          ),
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
            title.toString(),
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
