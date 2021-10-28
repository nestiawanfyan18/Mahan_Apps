import 'package:flutter/material.dart';
import 'package:delit_app/component/component.dart';
import 'package:delit_app/theme.dart';

class MainPodcastPage extends StatelessWidget {
  const MainPodcastPage({Key? key}) : super(key: key);

  Widget popularToday() {
    return Container(
      child: Column(
        children: [
          TitleListComic(title: 'Populer saat ini'),
          SizedBox(
            height: 165,
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PodcastPopular(
                      images: 'assets/images/Artikel/pengembangan_diri.jpg',
                      topic: 'Kehidupan',
                      title: 'Bertahan Dalam Kesendirian',
                    ),
                    PodcastPopular(
                      images: 'assets/images/Artikel/Pengendalian_Emosi.png',
                      topic: 'Kebahagiaan',
                      title: 'Senang Dengan Diri Sendiri',
                    ),
                    PodcastPopular(
                      images: 'assets/images/Artikel/Meredakan_Cemas.jpg',
                      topic: 'Meditasi',
                      title: 'Kelola Stress Kamu',
                    ),
                    PodcastPopular(
                      images: 'assets/images/Artikel/Mengurangi_Stress.jpg',
                      topic: 'Kehidupan',
                      title: 'Bertahan Dalam Kesendirian',
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

  Widget newestPost() {
    //on development
    return Container(
      child: Column(
        children: [
          TitleListComic(title: 'Siaran Terbaru'),
        ],
      ),
    );
  }

  Widget recommendedArtist() {
    return Container(
      child: Column(
        children: [
          TitleListComic(title: 'Artis yang disarankan'),
          SizedBox(
            height: 165,
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    PodcastArtist(
                      images: 'assets/images/PodCast/dokter.png',
                      name: 'Dr.Mental',
                    ),
                    PodcastArtist(
                      images: 'assets/images/PodCast/dokter.png',
                      name: 'Dr.Mental',
                    ),
                    PodcastArtist(
                      images: 'assets/images/PodCast/dokter.png',
                      name: 'Dr.Mental',
                    ),
                    PodcastArtist(
                      images: 'assets/images/PodCast/dokter.png',
                      name: 'Dr.Mental',
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: appBarHeight,
        title: Text(
          'Podcast',
          style: primaryTextStyle.copyWith(
            fontWeight: semibold,
            fontSize: 18,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        actions: [SearchButtonAppBar(), EmergencyButtonAppbar()],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: defaultMargin),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            popularToday(),
            newestPost(),
            recommendedArtist(),
          ],
        ),
      ),
    );
  }
}
