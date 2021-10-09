import 'package:flutter/material.dart';
import 'package:delit_app/theme.dart';

class ViewArticlePage extends StatelessWidget {
  const ViewArticlePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
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
                            'assets/images/Artikel/Mengurangi_Stress.jpg'),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 60,
                      height: 60,
                      margin: EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: defaultMargin,
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 10,
                      ),
                      alignment: Alignment.topLeft,
                      decoration: BoxDecoration(
                        color: backgroundColor,
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
                      maxChildSize: 0.88,
                      builder: (BuildContext c, s) {
                        return Container(
                          padding: EdgeInsets.symmetric(
                            vertical: defaultMargin,
                          ),
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
                                      top: 10,
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
                                            'Stress',
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
                                    'Meredakan stress ketika sedang memiliki banyak pekerjaan',
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
                                        'by Siti',
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
                                      '284Ribu Lihat',
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
                                    'Stres yang berkepanjangan bisa memicu berbagai penyakit. Ketika stres, tubuh melepaskan hormon kortisol dan adrenalin yang membuat kerja jantung menjadi lebih cepat. Hormon-hormon tersebut juga bisa membuat Anda merasa mudah lelah.',
                                    style: primaryTextStyle.copyWith(
                                      fontSize: 12,
                                      fontWeight: medium,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text(
                                    'Selain itu, daya tahan tubuh seseorang yang sedang stres juga akan menurun. Tubuh menjadi sulit melawan virus atau bakteri dan Anda pun lebih mudah terkena penyakit. Ada beberapa penyakit yang bisa Anda alami saat stres, antara lain:',
                                    style: primaryTextStyle.copyWith(
                                      fontSize: 12,
                                      fontWeight: medium,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text(
                                    'Gangguan pencernaan, seperti iritasi usus besar, kolitis ulseratif, gastriris, dan GERD \n Masalah pada kulit dan rambut, seperti rambut rontok permanen, eksim, psoriasis, dan jerawat\nDisfungsi seksual, seperti ejakulasi dini, impotensi, dan hilangnya hasrat seksual\nGangguan menstruasi\nObesitas dan gangguan makan lainnya\nPenyakit kardiovaskular, seperti stroke, serangan jantung, tekanan darah tinggi, dan penyakit jantung\nGangguan mental, seperti kecemasan, depresi, dan gangguan kepribadian\nSakit kepala\nGangguan tidur\nAgar stres tidak semakin berat atau menimbulkan masalah kesehatan, penting bagi setiap orang untuk bisa mengurangi dan mengendalikan stres dengan baik',
                                    style: primaryTextStyle.copyWith(
                                      fontSize: 12,
                                      fontWeight: medium,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text(
                                    'Selain itu, daya tahan tubuh seseorang yang sedang stres juga akan menurun. Tubuh menjadi sulit melawan virus atau bakteri dan Anda pun lebih mudah terkena penyakit. Ada beberapa penyakit yang bisa Anda alami saat stres, antara lain:',
                                    style: primaryTextStyle.copyWith(
                                      fontSize: 12,
                                      fontWeight: medium,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text(
                                    'Selain itu, daya tahan tubuh seseorang yang sedang stres juga akan menurun. Tubuh menjadi sulit melawan virus atau bakteri dan Anda pun lebih mudah terkena penyakit. Ada beberapa penyakit yang bisa Anda alami saat stres, antara lain:',
                                    style: primaryTextStyle.copyWith(
                                      fontSize: 12,
                                      fontWeight: medium,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Text(
                                    'Selain itu, daya tahan tubuh seseorang yang sedang stres juga akan menurun. Tubuh menjadi sulit melawan virus atau bakteri dan Anda pun lebih mudah terkena penyakit. Ada beberapa penyakit yang bisa Anda alami saat stres, antara lain:',
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
