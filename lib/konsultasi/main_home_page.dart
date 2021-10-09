import 'package:delit_app/theme.dart';
import 'package:flutter/material.dart';

class MainHomePage extends StatelessWidget {
  const MainHomePage({Key? key}) : super(key: key);

  Widget customButtonNav() {
    return ClipRRect(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(15),
      ),
      child: BottomNavigationBar(
        // backgroundColor: primaryColor,
        type: BottomNavigationBarType.fixed,
        selectedFontSize: 20,
        selectedIconTheme: IconThemeData(color: primaryColor, size: 30),
        selectedItemColor: primaryColor,

        items: [
          BottomNavigationBarItem(
            icon: Container(
              margin: EdgeInsets.only(top: 20),
              child: Icon(
                Icons.supervised_user_circle,
                color: backgroundNonActive,
                size: 25,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              margin: EdgeInsets.only(top: 20),
              child: Icon(
                Icons.list_alt,
                color: backgroundNonActive,
                size: 25,
              ),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Container(
              margin: EdgeInsets.only(top: 20),
              child: Icon(
                Icons.verified_user_outlined,
                color: backgroundNonActive,
                size: 25,
              ),
            ),
            label: '',
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: customButtonNav(),
      body: SafeArea(
        child: Center(
          child: Text("Hellow"),
        ),
      ),
    );
  }
}
