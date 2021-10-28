import 'package:delit_app/Models/get_answer_questions_models.dart';
import 'package:delit_app/Models/questions_models.dart';
import 'package:delit_app/Models/type_answer_pwb.dart';
import 'package:delit_app/Models/user_models.dart';
import 'package:delit_app/component/component.dart';
import 'package:delit_app/page/Homes/home_main_page.dart';
import 'package:delit_app/providers/auth_provider.dart';
import 'package:delit_app/providers/get_answer_question_Provider.dart';
import 'package:delit_app/providers/question_provider.dart';
import 'package:delit_app/providers/type_answer_pwb_provider.dart';
import 'package:flutter/material.dart';
import 'package:delit_app/theme.dart';
import 'package:provider/provider.dart';

class MainResultTest extends StatefulWidget {
  const MainResultTest({Key? key}) : super(key: key);

  @override
  State<MainResultTest> createState() => _MainResultTestState();
}

class _MainResultTestState extends State<MainResultTest> {
  String typePsikologi = "";
  int typePsikologiLevel = 1;
  List typeQuestions = [];
  List typeAnswerText = [];
  bool isLoading = false;
  ScrollController _controller = new ScrollController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModels user = authProvider.user;

    QuestionsProvider questionsProvider =
        Provider.of<QuestionsProvider>(context);
    List<QuestionsModels> question = questionsProvider.questionPWB;

    GetAnswerQuestionsProvider getAnswerProvider =
        Provider.of<GetAnswerQuestionsProvider>(context, listen: false);
    GetAnswerQuestionModels answerPWB = getAnswerProvider.getAnswerQuestion;

    TypeAnswerPWBProvider getTypeAnswerPWBProvider =
        Provider.of<TypeAnswerPWBProvider>(context, listen: false);
    List<TypeAnswerPWBModel> typeAnswer = getTypeAnswerPWBProvider.typeAnswer;

    for (var i = 0; i < questionsProvider.questionPWB.length; i++) {
      typeAnswerText.contains(question[i].typeAnswer!.id)
          ? null
          : typeAnswerText.add(question[i].typeAnswer!.id);
    }

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

    Widget headerProfile() {
      return Container(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                bottom: 2,
              ),
              width: 95,
              child: CircleAvatar(
                radius: 50,
                backgroundColor: backgroundColor1,
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/man-2.jfif'),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 10,
              ),
              child: Text(
                '${user.name}',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: bold,
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: 4,
              ),
              child: Text(
                '-',
                style: primaryTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: medium,
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget resultTestPWB() {
      return Container(
        margin: EdgeInsets.only(
          top: 40,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(color: backgroundNonActive),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      'Status Psikologi kamu sat ini.',
                      style: primaryTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 4),
                    width: 50,
                    height: 4,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
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
                            fontSize: 14,
                            fontWeight: bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(
                bottom: 20,
              ),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(color: backgroundNonActive),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Text(
                      'Detail Point',
                      style: primaryTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: bold,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 4),
                    width: 50,
                    height: 4,
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    // height: 340,
                    child: Column(
                      children: [
                        ListView.builder(
                          // scrollDirection: Axis.vertical,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: getTypeAnswerPWBProvider.typeAnswer.length,
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Flexible(
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            (typeAnswer[index]
                                                        .type_question_id ==
                                                    1)
                                                ? 'Penerimaan Diri'
                                                : (typeAnswer[index]
                                                            .type_question_id ==
                                                        2)
                                                    ? 'Kemandirian Pikir & Perilaku'
                                                    : (typeAnswer[index]
                                                                .type_question_id ==
                                                            3)
                                                        ? 'Tujuan Hidup yang Bermakna'
                                                        : (typeAnswer[index]
                                                                    .type_question_id ==
                                                                4)
                                                            ? 'Pengelolaan Lingkungan'
                                                            : (typeAnswer[index]
                                                                        .type_question_id ==
                                                                    5)
                                                                ? 'Pertumbuhan Pribadi'
                                                                : (typeAnswer[index]
                                                                            .type_question_id ==
                                                                        6)
                                                                    ? 'Hubungan Positif dengan Orang Lain'
                                                                    : 'Tidak ada',
                                            style: primaryTextStyle.copyWith(
                                              fontSize: 14,
                                              fontWeight: bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Text(
                                        "${typeAnswer[index].point_answer} Point",
                                        style: primaryTextStyle.copyWith(
                                          fontSize: 14,
                                          fontWeight: semibold,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      top: 10,
                                    ),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        ExpansionTile(
                                          title: Text(
                                            'Penjelasan..',
                                            style: primaryTextStyle.copyWith(
                                              fontSize: 12,
                                              fontWeight: medium,
                                            ),
                                          ),
                                          children: [
                                            ListTile(
                                              title: Container(
                                                margin: EdgeInsets.only(
                                                  bottom: 5,
                                                ),
                                                child: Text(
                                                  (typeAnswer[index]
                                                              .type_question_id ==
                                                          1)
                                                      ? "Kemampuan untuk menerima kondisi diri, baik kelebihan maupun kelemahannya, yang ditandai oleh :\n\n●	Memiliki pandangan serta penilaian yang positif terhadap diri sendiri\n●	Memahami serta mengakui segala kelebihan dan kekurangan yang dimiliki oleh diri sendiri\n●	Memiliki pandangan serta penilaian yang positif terhadap pengalaman hidup yang telah dilewati"
                                                      : (typeAnswer[index]
                                                                  .type_question_id ==
                                                              2)
                                                          ? 'Kemampuan untuk berpikir dan berperilaku sesuai dengan standar pribadi, tanpa pengaruh dari orang lain, yang ditandai oleh : \n\n●	Memiliki & menggunakan standar pribadi untuk mengevaluasi (baik & buruk) diri sendiri \n●	Pikiran dan perbuatan yang dilakukan berdasarkan kemauan pribadi, tanpa intervensi dari orang lain \n●	Mengambil berbagai keputusan penting dalam hidup murni berdasarkan hasil pertimbangan pribadi'
                                                          : (typeAnswer[index]
                                                                      .type_question_id ==
                                                                  3)
                                                              ? 'Kemampuan untuk menemukan makna dan arah dalam hidup, yang ditandai oleh : \n\n●	Memiliki tujuan hidup bermakna yang menjadi arah dalam menjalani kehidupan sehari - hari \n●	Memegang keyakinan/prinsip/nilai yang membuat hidup jadi bermakna dan bertujuan \n●	Mampu memaknai kaitan antara apa yang terjadi di masa lalu dengan masa kini'
                                                              : (typeAnswer[index]
                                                                          .type_question_id ==
                                                                      4)
                                                                  ? 'Kemampuan untuk mengontrol atau menciptakan lingkungan yang sesuai dengan konteks serta kapasitas diri, yang ditandai oleh : \n\n●	Mampu mengontrol berbagai berbagai tanggung jawab yang dimiliki dalam kehidupan sehari - hari \n●	Mampu untuk mengelola lingkungan serta menciptakan suasana yang sesuai dengan kebutuhan dan karakteristik diri \n●	Jeli melihat peluang yang ada di lingkungan sekitar dan mampu memanfaatkannya'
                                                                  : (typeAnswer[index]
                                                                              .type_question_id ==
                                                                          5)
                                                                      ? 'Kemampuan untuk selalu memotivasi diri agar senantiasa mengembangkan diri, yang ditandai oleh : \n\n●	Memandang diri sendiri sebagai individu yang dapat terus tumbuh dan berkembang \n●	Selalu bersemangat terhadap hal baru yang dapat mengembangkan diri \n●	Berusaha untuk semakin mengenal diri dan kemudian berusaha memperbaikinya menjadi lebih baik'
                                                                      : (typeAnswer[index].type_question_id ==
                                                                              6)
                                                                          ? 'Kemampuan untuk menjalin dan menjaga hubungan interpersonal yang positif dengan orang lain, yang ditandai oleh : \n\n●	Mampu dan nyaman untuk menjalin hubungan yang saling mempercayai dengan orang lain \n●	Memiliki kasih sayang serta kepedulian tinggi untuk mensejahterakan orang lain \n●	Mampu mengaplikasikan konsep memberi dan menerima untuk menjaga sebuah hubungan'
                                                                          : 'Tidak ada',
                                                  style:
                                                      primaryTextStyle.copyWith(
                                                    fontSize: 11,
                                                    fontWeight: medium,
                                                  ),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }

    Widget rekomendasiKonsultasi() {
      return Container(
        margin: EdgeInsets.only(
          top: 15,
          bottom: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    Container(
                      child: Text(
                        'Lihat Selangkapnya',
                        style: primaryTextStyle.copyWith(
                          fontSize: 11,
                          fontWeight: medium,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 10,
                  ),
                  child: Text(
                    'Status Kamu sedang dalam Keadaan Gawat nih. Mahan bantu berikan beberapa konsultan yang bisa kamu pilih.',
                    style: primaryTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: medium,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 25,
            ),
            ListKonsultanFWidth(
              name: 'Nestiawan Ferdiyanto',
              pengalaman: 1,
              images: 'assets/images/man-3.jfif',
            ),
            ListKonsultanFWidth(
              name: 'Nestiawan Ferdiyanto',
              pengalaman: 1,
              images: 'assets/images/man-3.jfif',
            ),
            ListKonsultanFWidth(
              name: 'Nestiawan Ferdiyanto',
              pengalaman: 1,
              images: 'assets/images/man-3.jfif',
            ),
            ListKonsultanFWidth(
              name: 'Nestiawan Ferdiyanto',
              pengalaman: 1,
              images: 'assets/images/man-3.jfif',
            ),
            ListKonsultanFWidth(
              name: 'Nestiawan Ferdiyanto',
              pengalaman: 1,
              images: 'assets/images/man-3.jfif',
            ),
            SizedBox(
              height: 8,
            ),
          ],
        ),
      );
    }

    Widget podcast() {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    Container(
                      child: Text(
                        'Lihat Selangkapnya',
                        style: primaryTextStyle.copyWith(
                          fontSize: 11,
                          fontWeight: medium,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 10,
                  ),
                  child: Text(
                    'Status Kamu sedang dalam Keadaan Perlu Hati-Hati. Mahan bantu berikan beberapa rekomendasi podcast yang bisa kamu degarkan.',
                    style: primaryTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: medium,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Wrap(
              children: [
                CardPodcast(
                  title: 'Pengembangan Diri',
                  imageCover: 'assets/images/Artikel/pengembangan_diri.jpg',
                  author: 'Nestiawan Ferdiyanto',
                ),
                CardPodcast(
                  title: 'Pengendalian Emosi',
                  imageCover: 'assets/images/Artikel/Pengendalian_Emosi.png',
                  author: 'Nestiawan Ferdiyanto',
                ),
                CardPodcast(
                  title: 'Meredakan Cemas',
                  imageCover: 'assets/images/Artikel/Meredakan_Cemas.jpg',
                  author: 'Nestiawan Ferdiyanto',
                ),
                CardPodcast(
                  title: 'Mengurangi Stress',
                  imageCover: 'assets/images/Artikel/Mengurangi_Stress.jpg',
                  author: 'Nestiawan Ferdiyanto',
                ),
                CardPodcast(
                  title: 'Pengembangan Diri',
                  imageCover: 'assets/images/Artikel/Meredakan_Cemas.jpg',
                  author: 'Nestiawan Ferdiyanto',
                ),
                CardPodcast(
                  title: 'Bahaya Pikiran Negatif',
                  imageCover: 'assets/images/Artikel/Pengendalian_Emosi.png',
                  author: 'Nestiawan Ferdiyanto',
                ),
              ],
            ),
          ],
        ),
      );
    }

    Widget rekomendArtikelKomik() {
      return Container(
        margin: EdgeInsets.only(
          top: 20,
        ),
        child: Column(
          children: [
            TitleListComponent(
              title: 'Rekomendasi Untuk Kamu',
              isMore: false,
              // route: '/education',
            ),
            Container(
              margin: EdgeInsets.only(
                top: 10,
              ),
              child: Text(
                'Status Kamu sedang dalam Keadaan Baik. Mahan bantu berikan beberapa rekomendasi Artikel dan Komik yang bisa kamu baca.',
                style: primaryTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: medium,
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TitleListComponent(
              title: 'Artikel',
              isMore: true,
              route: '',
            ),
            SizedBox(
              height: 10,
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
            TitleListComponent(
              title: 'Komik',
              isMore: true,
              route: '',
            ),
            SizedBox(
              height: 10,
            ),
            Wrap(
              children: [
                ListKomik(
                  image: 'assets/images/cover_comic/Cover_Komik_1.jpg',
                  title: 'Solo Leveling',
                ),
                ListKomik(
                  image: 'assets/images/cover_comic/Cover_Komik_2.jpg',
                  title: 'Log Horizon',
                ),
                ListKomik(
                  image: 'assets/images/cover_comic/Cover_Komik_3.jpg',
                  title: 'Black Clover',
                ),
                ListKomik(
                  image: 'assets/images/cover_comic/Cover_Komik_4.jpg',
                  title: 'i\'m An Evil God ',
                ),
                ListKomik(
                  image: 'assets/images/cover_comic/Cover_Komik_5.png',
                  title: 'Reon And Friends',
                ),
                ListKomik(
                  image: 'assets/images/cover_comic/Cover_Komik_7.jpg',
                  title: '339 Year In Prison ',
                ),
              ],
            )
          ],
        ),
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: appBarHeight,
        title: Text(
          "Hasil Test",
          style: primaryTextStyle.copyWith(
            fontWeight: semibold,
            fontSize: 18,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButtonBackApps(),
        actions: [
          EmergencyButtonAppbar(),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: ListView(
          children: [
            headerProfile(),
            resultTestPWB(),
            (typePsikologiLevel == 1)
                ? rekomendasiKonsultasi()
                : (typePsikologiLevel == 2)
                    ? podcast()
                    : rekomendArtikelKomik(),
          ],
        ),
      ),
    );
  }
}
