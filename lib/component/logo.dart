// ignore: unused_import
import 'dart:ffi';

import 'package:flutter/material.dart';

// ignore: camel_case_types
class logoHeader extends StatefulWidget {
  const logoHeader({
    Key? key,
  }) : super(key: key);

  @override
  _logoHeaderState createState() => _logoHeaderState();
}

// ignore: camel_case_types
class _logoHeaderState extends State<logoHeader> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width * 0.34,
      margin: EdgeInsets.only(left: 0),
      padding: EdgeInsetsDirectional.all(10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            width: 40,
            height: 40,
            child: Image.asset('assets/logo-delit.png'),
          ),
          Container(
            margin: EdgeInsets.only(left: 5),
            child: Text(
              "Delit",
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'fredokaOne',
                fontSize: size.width * 0.06,
                letterSpacing: 2,
                fontWeight: FontWeight.w100,
              ),
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
          color: Theme.of(context).backgroundColor,
          borderRadius: BorderRadius.circular(10)),
    );
  }
}
