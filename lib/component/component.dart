import 'package:flutter/material.dart';
import 'package:delit_app/theme.dart';

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
  }) : super(key: key);

  final String? imgProfile;
  final String? nameUser;
  final String? bioUser;
  final String? imgCover;
  final String titleArticle;
  final String dateArticle;
  final String? route;

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
                          nameUser.toString(),
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
                  ? Navigator.pushNamed(context, route.toString())
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

    return Container(
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
    );
  }
}

class CardPodcast extends StatelessWidget {
  const CardPodcast({
    Key? key,
    this.imageCover,
    required this.title,
    this.route,
  }) : super(key: key);

  final String? imageCover;
  final String title;
  final String? route;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {},
            child: Container(
              width: size.width * 0.28,
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
            margin: EdgeInsets.symmetric(
              vertical: 10,
            ),
            child: Text(
              title.toString(),
              style: primaryTextStyle.copyWith(
                fontSize: 10,
                fontWeight: medium,
              ),
            ),
          )
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
