import 'package:delit_app/page/Homes/Article/view_article_page.dart';
import 'package:flutter/material.dart';
import 'package:delit_app/theme.dart';
import 'package:url_launcher/url_launcher.dart';

// ----------------------
// ------ Appbar -------
// ----------------------

class IconButtonBackApps extends StatelessWidget {
  const IconButtonBackApps({
    Key? key,
    this.route,
  }) : super(key: key);

  final String? route;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Image.asset(
        'assets/icons/back_icon.png',
        width: 23,
        height: 23,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}

// ----------------------
// ------ Artikel -------
// ----------------------

class CardArticle extends StatelessWidget {
  const CardArticle({
    Key? key,
    this.imgProfile,
    this.nameUser,
    this.bioUser,
    this.imgCover,
    required this.titleArticle,
    required this.dateArticle,
    this.route,
    this.argumenID,
  }) : super(key: key);

  final String? imgProfile;
  final String? nameUser;
  final String? bioUser;
  final String? imgCover;
  final String titleArticle;
  final String dateArticle;
  final String? route;
  final int? argumenID;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 40,
                height: 43,
                decoration: ShapeDecoration(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7),
                  ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                        (imgProfile != null) ? imgProfile.toString() : ''),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(
                    left: 15,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          nameUser.toString() + argumenID.toString(),
                          style: primaryTextStyle.copyWith(
                            fontSize: 12,
                            fontWeight: semibold,
                          ),
                        ),
                      ),
                      Text(
                        bioUser.toString(),
                        style: secondaryTextStyle.copyWith(
                          fontSize: 11,
                          fontWeight: regular,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              (route != null)
                  ? Navigator.pushNamed(context, route.toString(), arguments: {
                      'indexs': argumenID,
                    })
                  : false;
            },
            child: Container(
              margin: EdgeInsets.symmetric(
                vertical: 15,
              ),
              child: Row(
                children: [
                  Container(
                    width: 88,
                    height: 80,
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      ),
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage(
                          imgCover.toString(),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 65,
                      margin: EdgeInsets.only(
                        left: 15,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text(
                              titleArticle.toString(),
                              style: primaryTextStyle.copyWith(
                                fontSize: 12,
                                fontWeight: bold,
                              ),
                            ),
                          ),
                          Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  dateArticle.toString(),
                                  style: secondaryTextStyle.copyWith(
                                    fontSize: 10,
                                    fontWeight: medium,
                                  ),
                                ),
                                Container(
                                  width: 18,
                                  height: 18,
                                  child: Image.asset(
                                      'assets/icons/favorite_icon.png'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              bottom: 15,
            ),
            width: double.infinity,
            height: 2,
            decoration: BoxDecoration(
              color: backgroundColor1,
              borderRadius: BorderRadius.circular(10),
            ),
          )
        ],
      ),
    );
  }
}

class EducationCategory extends StatelessWidget {
  const EducationCategory({
    Key? key,
    required this.images,
    required this.title,
    this.route,
  }) : super(key: key);

  final String images;
  final String title;
  final String? route;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              (route != null)
                  ? Navigator.pushNamed(context, route.toString())
                  : null;
            },
            child: Container(
              width: 110,
              height: 93,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(images),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: Text(
              title.toString(),
              style: primaryTextStyle.copyWith(
                fontSize: 11,
                fontWeight: medium,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class HistoryPodcastHome extends StatelessWidget {
  const HistoryPodcastHome({
    Key? key,
    required this.images,
    required this.title,
    required this.author,
    this.route,
  }) : super(key: key);

  final String images;
  final String title;
  final String? route;
  final String author;

  @override
  Widget build(BuildContext context) {
    _launchURL() async {
      const url =
          'https://open.spotify.com/episode/1W0sTrtZ4Uvtqn3MaZCtNP?si=ThIJbPw4TEuvd4EEPovTEg';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    return Container(
      margin: EdgeInsets.only(
        top: 10,
        bottom: 10,
        right: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              _launchURL();
              // (route != null)
              //     ? Navi\gator.pushNamed(context, route.toString())
              //     : null;
            },
            child: Container(
              width: 120,
              height: 93,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(images),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 10,
              // bottom: 2,
            ),
            child: Text(
              title.toString(),
              style: primaryTextStyle.copyWith(
                fontSize: 12,
                fontWeight: semibold,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 3,
            ),
            child: Text(
              author.toString(),
              style: primaryTextStyle.copyWith(
                fontSize: 10,
                fontWeight: medium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ListKomik extends StatelessWidget {
  const ListKomik({
    Key? key,
    required this.image,
    required this.title,
    this.route,
  }) : super(key: key);

  final String image;
  final String title;
  final String? route;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        (route != null) ? Navigator.pushNamed(context, route.toString()) : null;
      },
      child: Container(
        width: size.width * 0.27,
        margin: EdgeInsets.symmetric(
          horizontal: 5,
          vertical: 5,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 150,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(image.toString()),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                vertical: 8,
                horizontal: 3,
              ),
              child: Text(
                title.toString(),
                style: primaryTextStyle.copyWith(
                  fontSize: 10,
                  fontWeight: bold,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

class CardPodcast extends StatelessWidget {
  const CardPodcast({
    Key? key,
    this.imageCover,
    required this.title,
    this.author,
    this.route,
  }) : super(key: key);

  final String? imageCover;
  final String title;
  final String? route;
  final String? author;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    _launchURL() async {
      const url =
          'https://open.spotify.com/episode/1W0sTrtZ4Uvtqn3MaZCtNP?si=ThIJbPw4TEuvd4EEPovTEg';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }

    return Container(
      width: size.width * 0.27,
      margin: EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              _launchURL();
            },
            child: Container(
              width: size.width * 0.27,
              height: 90,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    imageCover.toString(),
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 7,
            ),
            child: RichText(
              overflow: TextOverflow.ellipsis,
              strutStyle: StrutStyle(fontSize: 12.0),
              text: TextSpan(
                style: primaryTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: semibold,
                ),
                text: title.toString(),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              bottom: 10,
            ),
            child: RichText(
              overflow: TextOverflow.ellipsis,
              strutStyle: StrutStyle(fontSize: 12.0),
              text: TextSpan(
                style: primaryTextStyle.copyWith(
                  fontSize: 10,
                  fontWeight: medium,
                ),
                text: author.toString(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class EmergencyButtonAppbar extends StatelessWidget {
  const EmergencyButtonAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 45,
        height: 50,
        margin: EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 15,
        ),
        padding: EdgeInsets.all(6),
        child: IconButton(
          onPressed: () {
            Navigator.pushNamed(context, '/emergency');
          },
          icon: Image.asset(
            "assets/images/alert_icon.png",
            width: 30,
          ),
        ),
        decoration: BoxDecoration(
          color: dangerColor,
          borderRadius: BorderRadius.circular(100),
        ));
  }
}

class RecommendedKomik extends StatelessWidget {
  const RecommendedKomik({
    Key? key,
    required this.image,
    required this.emphasis,
    required this.title,
  }) : super(key: key);

  final String image;
  final String emphasis;
  final String title;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: 170,
      margin: EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 10,
      ),
      child: Stack(
        children: <Widget>[
          Container(
            width: size.width * 0.75,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(image),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            width: size.width * 0.75,
            height: 170,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Container(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromARGB(200, 255, 255, 255),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '$emphasis - ',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(title),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class RecommendedKomikList extends StatelessWidget {
  const RecommendedKomikList({Key? key, required this.listRecommended})
      : super(key: key);

  final List<RecommendedKomik> listRecommended;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        height: 200.0,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: listRecommended,
          shrinkWrap: true,
        ),
      ),
    );
  }
}

class CircleRekomenPsikolog extends StatelessWidget {
  const CircleRekomenPsikolog({
    Key? key,
    required this.name,
    required this.images,
    this.title,
    this.route,
  }) : super(key: key);

  final String name;
  final String images;
  final String? title;
  final String? route;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 5,
        right: 7,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
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
                backgroundImage: AssetImage(images.toString()),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 2,
            ),
            width: 100,
            child: Center(
              child: RichText(
                overflow: TextOverflow.ellipsis,
                strutStyle: StrutStyle(fontSize: 12.0),
                text: TextSpan(
                  style: primaryTextStyle.copyWith(
                    fontSize: 11,
                    fontWeight: semibold,
                  ),
                  text: name.toString(),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: 2,
            ),
            width: 100,
            child: Center(
              child: Text(
                title.toString(),
                style: primaryTextStyle.copyWith(
                  fontSize: 8,
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

class ListKonsultanFWidth extends StatelessWidget {
  const ListKonsultanFWidth({
    Key? key,
    required this.name,
    required this.pengalaman,
    this.images,
    this.route,
  }) : super(key: key);

  final String name;
  final int pengalaman;
  final String? images;
  final String? route;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        bottom: 5,
      ),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: backgroundColor1,
        borderRadius: BorderRadius.circular(10),
        // border: Border.all(color: backgroundNonActive, width: 0.6),
      ),
      child: Row(
        children: [
          Container(
            // width: 65,
            child: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage(images.toString()),
            ),
          ),
          SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    name,
                    style: primaryTextStyle.copyWith(
                      fontSize: 14,
                      fontWeight: semibold,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 5,
                  ),
                  child: Text(
                    'Pengalaman Selama $pengalaman Tahun',
                    style: primaryTextStyle.copyWith(
                      fontSize: 12,
                      fontWeight: medium,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SearchButtonAppBar extends StatelessWidget {
  const SearchButtonAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 45,
      height: 50,
      margin: EdgeInsets.symmetric(
        vertical: 15,
      ),
      padding: EdgeInsets.all(6),
      child: IconButton(
        onPressed: () {
          // Navigator.pushNamed(context, '/emergency');
        },
        icon: Image.asset(
          "assets/icons/akar-icons_search.png",
          width: 30,
        ),
      ),
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(
          width: 2.0,
          color: Colors.black,
        ),
        borderRadius: BorderRadius.circular(100),
      ),
    );
  }
}

class PodcastArtist extends StatelessWidget {
  const PodcastArtist({
    Key? key,
    required this.images,
    required this.name,
    this.route,
  }) : super(key: key);

  final String images;
  final String name;
  final String? route;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              (route != null)
                  ? Navigator.pushNamed(context, route.toString())
                  : null;
            },
            child: Container(
              width: 80,
              height: 80,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(100),
                  ),
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(images),
                ),
              ),
            ),
          ),
          Container(
            width: 90,
            margin: EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  name.toString(),
                  style: primaryTextStyle.copyWith(
                    fontSize: 11,
                    fontWeight: medium,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                ),
              ],
            ),
          )
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

class PodcastPopular extends StatelessWidget {
  const PodcastPopular({
    Key? key,
    required this.images,
    required this.title,
    required this.topic,
    this.route,
  }) : super(key: key);

  final String images;
  final String topic;
  final String title;
  final String? route;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              (route != null)
                  ? Navigator.pushNamed(context, route.toString())
                  : null;
            },
            child: Container(
              width: 110,
              height: 93,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(images),
                ),
              ),
            ),
          ),
          Container(
            width: 110,
            margin: EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  topic.toString(),
                  style: primaryTextStyle.copyWith(
                    fontSize: 11,
                    fontWeight: medium,
                  ),
                ),
                Text(
                  title.toString(),
                  style: primaryTextStyle.copyWith(
                    fontSize: 11,
                    fontWeight: medium,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  softWrap: true,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
