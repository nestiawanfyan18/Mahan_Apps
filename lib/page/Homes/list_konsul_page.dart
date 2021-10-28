import 'package:delit_app/component/component.dart';
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
          top: 15,
          bottom: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(
                top: 5,
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
        margin: EdgeInsets.only(
          top: 15,
          bottom: 2,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(
                bottom: 5,
              ),
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

    Widget pakarPsikologi() {
      return Container(
          // child: Text('Pakar Psikolgi Yang kamu Sediakan.', style: primaryTextStyle.copyWith(fontSize: ),),
          );
    }

    Widget listPsikologKonsultasi() {
      return Container(
        margin: EdgeInsets.only(
          top: 5,
          bottom: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    'Daftar Psikolog Untuk kamu',
                    style: primaryTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semibold,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 10,
                  ),
                  child: Text(
                    'Temukan Psikolog yang dapat membantu kamu menjadi lebih baik, untuk membuat mental yang lebih handal.',
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
              name: 'Shinta Mayasari, S.Psi., M.Psi., Psikolog',
              pengalaman: 8,
              images: 'assets/images/psikolog/shinta.png',
            ),
            ListKonsultanFWidth(
              name: 'Moch johan pratama, m.psi, psikolog',
              pengalaman: 8,
              images: 'assets/images/psikolog/johan.jpeg',
            ),
            ListKonsultanFWidth(
              name: 'Prida Harkina, S.Psi., M.Psi., Psikolog',
              pengalaman: 7,
              images: 'assets/images/psikolog/prida.png',
            ),
            ListKonsultanFWidth(
              name: 'Vira Sandayanti ,S.Psi., M.Psi., Psikolog',
              pengalaman: 7,
              images: 'assets/images/psikolog/vira.png',
            ),
            ListKonsultanFWidth(
              name: 'Octa Reni Setiawati, S.Psi., M.Psi., Psikolog',
              pengalaman: 8,
              images: 'assets/images/psikolog/octa.png',
            ),
            SizedBox(
              height: 8,
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
          "Konsultasi",
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
        child: ScrollConfiguration(
          behavior: MyBehavior(),
          child: ListView(
            children: [
              headerListKonsul(),
              rekomendasiPsikolog(),
              pakarPsikologi(),
              listPsikologKonsultasi(),
            ],
          ),
        ),
      ),
    );
  }
}
