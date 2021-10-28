import 'package:delit_app/page/Homes/Article/listDataArtikel.dart';
import 'package:flutter/material.dart';
import 'package:delit_app/theme.dart';

class DetailKomikPage extends StatelessWidget {
  const DetailKomikPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewArtikel = ModalRoute.of(context)!.settings.arguments as Map;
    final List artikel = dataArtikel;

    // print("viewArtikel : " + viewArtikel['indexs'].toString());

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Container(
        child: Stack(
          children: [
            Container(
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: size.height * 0.5,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(
                            'assets/images/cover_comic/Cover_Komik_6.jpg'),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 60,
                      height: 60,
                      margin: EdgeInsets.symmetric(
                        vertical: 40,
                        horizontal: defaultMargin,
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 10,
                      ),
                      alignment: Alignment.topLeft,
                      decoration: BoxDecoration(
                        color: backgroundColor.withOpacity(0.7),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Image.asset('assets/icons/back_icon.png'),
                      ),
                    ),
                  ),

                  // draggable scroll up
                  SizedBox.expand(
                    child: DraggableScrollableSheet(
                      initialChildSize: 0.55,
                      minChildSize: 0.55,
                      maxChildSize: 0.86,
                      builder: (BuildContext c, s) {
                        return Container(
                          decoration: BoxDecoration(
                            color: backgroundColor,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 15.0,
                              ),
                            ],
                          ),
                          child: Container(
                            padding:
                                EdgeInsets.symmetric(horizontal: defaultMargin),
                            child: ListView(
                              controller: s,
                              children: [
                                Center(
                                  child: Container(
                                    margin: EdgeInsets.only(
                                      bottom: 10,
                                    ),
                                    width: 140,
                                    height: 7,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFEAEAEA),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // title Article View
                                    Flexible(
                                      child: Container(
                                        margin: EdgeInsets.only(
                                          top: 10,
                                          bottom: 10,
                                          right: 10,
                                        ),
                                        child: Text(
                                          "Pemimpin Muda Yang Sangat Hebat",
                                          style: primaryTextStyle.copyWith(
                                            fontSize: 22,
                                            fontWeight: bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                        left: 5,
                                      ),
                                      width: 37,
                                      height: 37,
                                      child: Image.asset(
                                        'assets/icons/love_red_icon.png',
                                      ),
                                    )
                                  ],
                                ),

                                Row(
                                  children: [
                                    Container(
                                      width: 17,
                                      height: 17,
                                      child: Image.asset(
                                          'assets/icons/love_red_icon.png'),
                                    ),
                                    SizedBox(width: 10),
                                    Container(
                                      child: Text(
                                        '432 Suka',
                                        style: secondaryTextStyle.copyWith(
                                          fontSize: 12,
                                          fontWeight: regular,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Container(
                                      width: 7,
                                      height: 7,
                                      child: Image.asset(
                                        'assets/icons/Dots_Icon_grey.png',
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Row(
                                      children: [
                                        Container(
                                          width: 20,
                                          height: 20,
                                          child: Image.asset(
                                              'assets/icons/eye_icons.png',
                                              color: primaryColor),
                                        ),
                                      ],
                                    ),
                                    SizedBox(width: 3),
                                    Text(
                                      '284 Lihat',
                                      style: secondaryTextStyle.copyWith(
                                        fontSize: 12,
                                        fontWeight: regular,
                                      ),
                                    ),
                                  ],
                                ),

                                // Text Content Article
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  child: Text(
                                    "Menceritakan 5 remaja yang terjebak pada zona waktu saat dalam penjara dan memulai untuk kehidupan baru dengan zaman yang tidak mereka kenal...",
                                    style: primaryTextStyle.copyWith(
                                      fontSize: 12,
                                      fontWeight: medium,
                                    ),
                                  ),
                                ),

                                // List Chapter
                                SizedBox(
                                  height: 30,
                                ),
                                Container(
                                  child: Text(
                                    "List Chapter",
                                    style: primaryTextStyle.copyWith(
                                      fontSize: 14,
                                      fontWeight: semibold,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 13,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, '/view-chapter-komik');
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(17),
                                    decoration: BoxDecoration(
                                      color: backgroundColor1,
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      "Chapter 1",
                                      style: primaryTextStyle.copyWith(
                                        fontSize: 14,
                                        fontWeight: medium,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
