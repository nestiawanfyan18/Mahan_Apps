import 'package:delit_app/component/component.dart';
import 'package:delit_app/page/Homes/Article/listDataArtikel.dart';
import 'package:flutter/material.dart';
import 'package:delit_app/theme.dart';

class MainArticlePage extends StatelessWidget {
  const MainArticlePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget headerTopic() {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Text(
                'Beberapa Pilihan Topik',
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semibold,
                ),
              ),
            ),
            SizedBox(
              height: 150,
              child: ListView(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      EducationCategory(
                        images: 'assets/images/Artikel/pengembangan_diri.jpg',
                        title: 'Pengembangan Diri',
                      ),
                      EducationCategory(
                        images: 'assets/images/Artikel/Pengendalian_Emosi.png',
                        title: 'Pengendali Emosi',
                      ),
                      EducationCategory(
                        images: 'assets/images/Artikel/Meredakan_Cemas.jpg',
                        title: 'Meredakan Cemas',
                      ),
                      EducationCategory(
                        images: 'assets/images/Artikel/Mengurangi_Stress.jpg',
                        title: 'Mengurangi Stress',
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      );
    }

    Widget newsArticle() {
      final List artikel = dataArtikel;
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 20,
              ),
              child: Text(
                "Artikel Terbaru untuk Kamu",
                style: primaryTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semibold,
                ),
              ),
            ),
            // ------
            // --- List Article ---
            // ------
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
          "Artikel",
          style: primaryTextStyle.copyWith(
            fontWeight: semibold,
            fontSize: 18,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButtonBackApps(
          route: '/home',
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 20),
        padding: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: ListView(
          children: [
            headerTopic(),
            newsArticle(),
          ],
        ),
      ),
    );
  }
}
