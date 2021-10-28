import 'package:flutter/material.dart';
import 'package:delit_app/theme.dart';
import 'package:delit_app/component/component.dart';

class MainEduKomik extends StatelessWidget {
  const MainEduKomik({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget recommended() {
      return Container(
        child: SizedBox(
          height: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              RecommendedKomik(
                image: 'assets/images/cover_comic/background-aliders.png',
                emphasis: 'Top 1',
                title: 'Bertarung Dengan Diri Sendiri',
              ),
              RecommendedKomik(
                image: 'assets/images/cover_comic/Manhua-Like-Apotheosis.jpg',
                emphasis: 'Manhua',
                title: 'Komik Terbaik Manhua',
              ),
              RecommendedKomik(
                image: 'assets/images/cover_comic/romance-background.jpg',
                emphasis: 'Romantis',
                title: 'Kisah Romantis yang popular',
              ),
            ],
          ),
        ),
      );
    }

    ;

    Widget listGenreComic() {
      return SizedBox(
        height: 70,
        child: ListView(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          children: [
            Row(
              children: [
                GenresComic(genre: 'Adventure'),
                GenresComic(genre: 'Fantasy'),
                GenresComic(genre: 'Horor'),
                GenresComic(genre: 'Romantis'),
                GenresComic(genre: 'School Life'),
                GenresComic(genre: 'Adventure'),
                GenresComic(genre: 'Fantasy'),
                GenresComic(genre: 'Horor'),
                GenresComic(genre: 'Romantis'),
                GenresComic(genre: 'School Life'),
              ],
            )
          ],
        ),
      );
    }

    Widget topListComic() {
      return Container(
        child: Column(
          children: [
            TitleListComic(title: 'Top Teratas'),

            // list Comic
            Wrap(
              children: [
                ListKomik(
                  image: 'assets/images/cover_comic/Cover_Komik_1.jpg',
                  title: 'Solo Leveling',
                  route: '/detail-komik',
                ),
                ListKomik(
                  image: 'assets/images/cover_comic/Cover_Komik_2.jpg',
                  route: '/detail-komik',
                  title: 'Log Horizon',
                ),
                ListKomik(
                  image: 'assets/images/cover_comic/Cover_Komik_3.jpg',
                  route: '/detail-komik',
                  title: 'Black Clover',
                ),
                ListKomik(
                  image: 'assets/images/cover_comic/Cover_Komik_4.jpg',
                  route: '/detail-komik',
                  title: 'i\'m An Evil God ',
                ),
                ListKomik(
                  image: 'assets/images/cover_comic/Cover_Komik_5.png',
                  route: '/detail-komik',
                  title: 'Reon And Friends',
                ),
                ListKomik(
                  image: 'assets/images/cover_comic/Cover_Komik_7.jpg',
                  route: '/detail-komik',
                  title: '339 Year In Prison ',
                ),
              ],
            )
          ],
        ),
      );
    }

    Widget topLikeListComic() {
      return Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleListComic(
              title: 'Paling Banyak Disuka',
            ),
            Wrap(
              children: [
                ListLikeComic(
                  title: '339 Year in Prison',
                  image: 'assets/images/cover_comic/Cover_Komik_7.jpg',
                  like: '230',
                ),
                ListLikeComic(
                  title: 'Black Clover',
                  image: 'assets/images/cover_comic/Cover_Komik_3.jpg',
                  like: '230',
                ),
                ListLikeComic(
                  title: 'Log Horizon',
                  image: 'assets/images/cover_comic/Cover_Komik_2.jpg',
                  like: '230',
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
          "Komik",
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
            recommended(),
            listGenreComic(),
            topListComic(),
            topLikeListComic(),
          ],
        ),
      ),
    );
  }
}

class ListLikeComic extends StatelessWidget {
  const ListLikeComic({
    Key? key,
    required this.title,
    required this.like,
    required this.image,
    this.route,
  }) : super(key: key);

  final String title;
  final String image;
  final String like;
  final String? route;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.286,
      margin: EdgeInsets.only(
        top: 10,
        right: 5,
        bottom: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              width: 120,
              height: 100,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    image.toString(),
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 8,
              bottom: 3,
            ),
            child: Text(
              title.toString(),
              style: primaryTextStyle.copyWith(
                fontSize: 11,
                fontWeight: semibold,
              ),
            ),
          ),
          Container(
            child: Row(
              children: [
                Container(
                  width: 10,
                  height: 10,
                  child: Image.asset('assets/icons/love_red_icon.png'),
                ),
                SizedBox(width: 6),
                Container(
                  child: Text(
                    '$like Ribu Suka',
                    style: secondaryTextStyle.copyWith(
                      fontSize: 10,
                      fontWeight: regular,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TitleListComic extends StatelessWidget {
  const TitleListComic({
    Key? key,
    required this.title,
    this.route,
  }) : super(key: key);

  final String title;
  final String? route;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title.toString(),
            style: primaryTextStyle.copyWith(
              fontSize: 16,
              fontWeight: bold,
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Text(
              'Lihat Lebih Banyak Lagi >',
              style: primaryTextStyle.copyWith(
                fontSize: 10,
                fontWeight: regular,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class GenresComic extends StatelessWidget {
  const GenresComic({
    Key? key,
    this.genre,
  }) : super(key: key);

  final String? genre;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.only(
          right: 10,
        ),
        padding: EdgeInsets.all(10),
        child: Text(
          genre.toString(),
          style: thiridTextStyle.copyWith(
            fontWeight: medium,
            fontSize: 10,
          ),
        ),
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(
            4,
          ),
        ),
      ),
    );
  }
}
