import 'package:delit_app/theme.dart';
import 'package:flutter/material.dart';

class LoadingButton extends StatelessWidget {
  const LoadingButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: size.width * 10,
      margin: EdgeInsets.only(
        top: 25,
      ),
      // ignore: deprecated_member_use
      child: RaisedButton(
        onPressed: () {},
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsetsDirectional.all(15),
        textColor: Colors.white,
        color: Theme.of(context).backgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation(
                  backgroundColor1,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              'Loading',
              style: TextStyle(
                fontSize: 18,
                fontFamily: 'DMSans-Medium',
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
