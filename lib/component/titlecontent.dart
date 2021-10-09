import 'package:flutter/material.dart';

class TitleContent extends StatelessWidget {
  final String textTitle;
  final String textContent;

  const TitleContent({
    Key? key, 
    required this.textTitle, 
    required this.textContent
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Container(
      margin: EdgeInsets.only(bottom: size.height * 0.03),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(bottom: 8,),
            child: Text(
              textTitle,
              style: TextStyle(
                  fontSize: 40,
                  fontFamily: 'DMSans-Medium',
                  fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            child: Text(
              textContent,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w300,
              ),
            ),
          )
        ],
      ),
    );
  }
}
