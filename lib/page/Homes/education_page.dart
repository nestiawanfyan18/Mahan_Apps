import 'package:delit_app/component/component.dart';
import 'package:delit_app/page/Homes/Article/listDataArtikel.dart';
import 'package:flutter/material.dart';
import 'package:delit_app/theme.dart';

class EducationPage extends StatelessWidget {
  const EducationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // Widget
    Widget header() {
      return Container(
        margin: EdgeInsets.symmetric(
          vertical: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Temukan sesuatu yang menarik untuk kebahagianmu",
              style: primaryTextStyle.copyWith(
                fontWeight: bold,
                fontSize: 23,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 10,
              ),
              alignment: Alignment.topLeft,
              width: 80,
              height: 4,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        ),
      );
    }

    Widget aktivitas() {
      return Container(
        margin: EdgeInsets.symmetric(
          vertical: 0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Cari kegiatan yang ingin kamu lakukan.',
                style: primaryTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: semibold,
                ),
              ),
            ),

            // card Aktivitas
            SizedBox(
              height: 147,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  Row(
                    children: [
                      // fiture 1
                      EducationCategory(
                        images:
                            'assets/images/cover_comic/Manhua-Like-Apotheosis.jpg',
                        title: 'Komik',
                        route: '/komik',
                      ),
                      // fiture 2
                      EducationCategory(
                        images: 'assets/images/Artikel/Mengurangi_Stress.jpg',
                        title: 'Artikel',
                        route: '/article',
                      ),
                      // fiture 3
                      EducationCategory(
                        images:
                            'assets/images/PodCast/img-profile-podcast.jpeg',
                        title: 'Podcast',
                        route: '/podcast',
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

    Widget listKomik() {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(
                top: 20,
                bottom: 15,
              ),
              child: Text(
                'Komik yang mungkin kamu suka',
                style: primaryTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: semibold,
                ),
              ),
            ),
            Wrap(
              children: [
                ListKomik(
                  image: 'assets/images/cover_comic/Cover_Komik_1.jpg',
                  title: 'Solo Leveling',
                  route: '/detail-komik',
                ),
                ListKomik(
                  image: 'assets/images/cover_comic/Cover_Komik_2.jpg',
                  title: 'Log Horizon',
                  route: '/detail-komik',
                ),
                ListKomik(
                  image: 'assets/images/cover_comic/Cover_Komik_3.jpg',
                  title: 'Black Clover',
                  route: '/detail-komik',
                ),
                ListKomik(
                  image: 'assets/images/cover_comic/Cover_Komik_4.jpg',
                  title: 'i\'m An Evil God ',
                  route: '/detail-komik',
                ),
                ListKomik(
                  image: 'assets/images/cover_comic/Cover_Komik_5.png',
                  title: 'Reon And Friends',
                  route: '/detail-komik',
                ),
                ListKomik(
                  image: 'assets/images/cover_comic/Cover_Komik_7.jpg',
                  title: '339 Year In Prison ',
                  route: '/detail-komik',
                ),
              ],
            )
          ],
        ),
      );
    }

    Widget article() {
      final List artikel = dataArtikel;
      print("Data Artikel : ${artikel[1]['title']}");

      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(
                top: 20,
                bottom: 15,
              ),
              child: Text(
                'Artikel yang mungkin kamu suka',
                style: primaryTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: semibold,
                ),
              ),
            ),

            for (var i = 3; i < 6; i++)
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

            // article,
          ],
        ),
      );
    }

    Widget podcast() {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 20,
              ),
              child: Text(
                'Podcast yang mungkin kamu suka',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semibold,
                ),
              ),
            ),
            Wrap(
              children: [
                CardPodcast(
                  title: 'Pengembangan Diri',
                  imageCover: 'assets/images/Artikel/pengembangan_diri.jpg',
                ),
                CardPodcast(
                  title: 'Pengendalian Emosi',
                  imageCover: 'assets/images/Artikel/Pengendalian_Emosi.png',
                ),
                CardPodcast(
                  title: 'Meredakan Cemas',
                  imageCover: 'assets/images/Artikel/Meredakan_Cemas.jpg',
                ),
                CardPodcast(
                  title: 'Mengurangi Stress',
                  imageCover: 'assets/images/Artikel/Mengurangi_Stress.jpg',
                ),
                CardPodcast(
                  title: 'Pengembangan Diri',
                  imageCover: 'assets/images/Artikel/Meredakan_Cemas.jpg',
                ),
                CardPodcast(
                  title: 'Bahaya Pikiran Negatif',
                  imageCover: 'assets/images/Artikel/Pengendalian_Emosi.png',
                ),
              ],
            ),
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
          "Education",
          style: primaryTextStyle.copyWith(
            fontWeight: semibold,
            fontSize: 18,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        // leading: IconButtonBackApps(route: '/home'),
        actions: [
          EmergencyButtonAppbar(),
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        child: ListView(
          children: [
            header(),
            aktivitas(),
            listKomik(),
            article(),
            podcast(),
          ],
        ),
      ),
    );
  }
}
