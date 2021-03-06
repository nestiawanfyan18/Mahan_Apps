import 'package:delit_app/page/Homes/Article/listDataArtikel.dart';
import 'package:flutter/material.dart';
import 'package:delit_app/theme.dart';

class ViewArticlePage extends StatelessWidget {
  // final int dataIndex;

  const ViewArticlePage({
    Key? key,
    // required this.dataIndex,
  }) : super(key: key);

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
                        image: AssetImage(artikel[viewArtikel['indexs']]
                                ['images']
                            .toString()),
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
                                    Row(
                                      children: [
                                        Container(
                                          width: 7,
                                          height: 7,
                                          child: Image.asset(
                                              'assets/icons/Dots_Icon.png'),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(left: 10),
                                          child: Text(
                                            'Pemahaman Diri',
                                            style: primaryTextStyle.copyWith(
                                              fontSize: 12,
                                              fontWeight: semibold,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Container(
                                      width: 25,
                                      height: 25,
                                      child: Image.asset(
                                        'assets/icons/archive_active_icon.png',
                                      ),
                                    )
                                  ],
                                ),

                                // title Article View
                                Container(
                                  margin: EdgeInsets.symmetric(
                                    vertical: 10,
                                  ),
                                  child: Text(
                                    artikel[viewArtikel['indexs']]['title']
                                        .toString(),
                                    style: primaryTextStyle.copyWith(
                                      fontSize: 20,
                                      fontWeight: bold,
                                    ),
                                  ),
                                ),

                                // fitured
                                SizedBox(
                                  height: 5,
                                ),

                                Row(
                                  children: [
                                    Container(
                                      child: Text(
                                        'by Nesti',
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
                                          'assets/icons/Dots_Icon_grey.png'),
                                    ),
                                    SizedBox(width: 10),
                                    Container(
                                      child: Text(
                                        '12 September 2020',
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
                                          'assets/icons/Dots_Icon_grey.png'),
                                    ),
                                    SizedBox(width: 10),
                                    Row(
                                      children: [
                                        Container(
                                          width: 20,
                                          height: 20,
                                          child: Image.asset(
                                              'assets/icons/eye_icons.png'),
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
                                  height: 30,
                                ),
                                Container(
                                  child: Text(
                                    artikel[viewArtikel['indexs']]['content']
                                        .toString(),
                                    style: primaryTextStyle.copyWith(
                                      fontSize: 12,
                                      fontWeight: medium,
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
