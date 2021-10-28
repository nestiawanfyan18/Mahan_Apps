import 'package:delit_app/Models/user_models.dart';
import 'package:delit_app/providers/auth_provider.dart';
import 'package:delit_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider =
        Provider.of<AuthProvider>(context, listen: false);
    UserModels user = authProvider.user;

    Widget hederProfile() {
      return Container(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 200,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                ),
                SizedBox(
                  height: 250,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      width: 130,
                      height: 130,
                      margin: EdgeInsets.only(
                        // right: 15,
                        // top: 30,
                        bottom: 15,
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: backgroundColor1, width: 0.8),
                        image: new DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/girl-1.jpg'),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              child: Text(
                user.name.toString(),
                style: primaryTextStyle.copyWith(
                  fontSize: 14,
                  fontWeight: bold,
                ),
              ),
            ),
            Container(
              child: Text(
                "Lampung - Bandar Lampung",
                style: primaryTextStyle.copyWith(
                  fontSize: 12,
                  fontWeight: medium,
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget listProfile() {
      return Container(
        padding: EdgeInsets.symmetric(
          horizontal: defaultMargin,
        ),
        margin: EdgeInsets.only(
          top: 50,
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                bottom: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text(
                      'Ubah Profile',
                      style: primaryTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: semibold,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      '>',
                      style: primaryTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: semibold,
                      ),
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: primaryColor.withOpacity(0.6),
                    width: 0.8,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: 10,
                bottom: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text(
                      'History Konsultasi',
                      style: primaryTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: semibold,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      '>',
                      style: primaryTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: semibold,
                      ),
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: primaryColor.withOpacity(0.6),
                    width: 0.8,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: 10,
                bottom: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text(
                      'Pengaturan',
                      style: primaryTextStyle.copyWith(
                        fontSize: 12,
                        fontWeight: semibold,
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      '>',
                      style: primaryTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: semibold,
                      ),
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: primaryColor.withOpacity(0.6),
                    width: 0.8,
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, '/login');
              },
              child: Container(
                padding: EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        'Logout',
                        style: primaryTextStyle.copyWith(
                          fontSize: 12,
                          fontWeight: semibold,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        '>',
                        style: primaryTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: semibold,
                        ),
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: primaryColor.withOpacity(0.6),
                      width: 0.8,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }

    return Scaffold(
        body: Container(
      child: ListView(
        children: [
          hederProfile(),
          listProfile(),
        ],
      ),
    ));
  }
}
