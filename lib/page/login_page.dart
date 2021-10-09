import 'package:delit_app/animation/fadeRoute.dart';
import 'package:delit_app/component/logo.dart';
import 'package:delit_app/component/titlecontent.dart';
import 'package:delit_app/page/register_page.dart';
import 'package:delit_app/page/startQuestion.dart';
// ignore: unused_import
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool showPassword = false;

  void showPasswords() {
    setState(() {
      showPassword = !showPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        body: Container(
          margin: EdgeInsets.only(left: 40, right: 40, top: size.height * 0.07),
          child: ListView(
            children: <Widget>[
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 140,
                    margin: EdgeInsets.only(bottom: size.height * 0.13),
                    child: Image.asset('assets/images/logo-mahan.png'),
                  ),
                  TitleContent(
                      textTitle: "Login",
                      textContent: "Mulai Berfikir dengan damai"),

                  // this form input (email, password, and button)
                  Container(
                    child: Column(
                      children: <Widget>[
                        // email
                        Container(
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black38, width: 2.0),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF004368),
                                ),
                              ),
                              labelStyle: TextStyle(color: Color(0xFF004368)),
                              fillColor: Color(0xFF004368),
                              labelText: 'Email',
                              icon: Icon(
                                Icons.email,
                                color: Color(0xFF004368),
                              ),
                            ),
                          ),
                        ),

                        // password
                        Container(
                          child: TextField(
                            obscureText: !showPassword,
                            decoration: InputDecoration(
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: Colors.black38, width: 2.0),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFF004368),
                                ),
                              ),
                              labelStyle: TextStyle(color: Color(0xFF004368)),
                              fillColor: Color(0xFF004368),
                              labelText: 'password',
                              icon: Icon(
                                Icons.security,
                                color: Color(0xFF004368),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  Icons.remove_red_eye,
                                  color: showPassword
                                      // ignore: dead_code
                                      ? Colors.blue
                                      : Colors.grey,
                                ),
                                onPressed: showPasswords,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: size.width * 10,
                          margin: EdgeInsets.only(
                            top: 25,
                          ),
                          // ignore: deprecated_member_use
                          child: RaisedButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                FadeRoute(
                                  page: StartQuestion(),
                                ),
                              );
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            padding: EdgeInsetsDirectional.all(15),
                            textColor: Colors.white,
                            color: Theme.of(context).backgroundColor,
                            child: Text(
                              'Login',
                              style: TextStyle(
                                fontSize: 18,
                                fontFamily: 'DMSans-Medium',
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // footer
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.16),
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text('Belum Punya akun ?'),
                              GestureDetector(
                                child: Text(
                                  "Daftar",
                                  style: TextStyle(
                                    color: Theme.of(context).backgroundColor,
                                  ),
                                ),
                                onTap: () {
                                  Navigator.pushReplacement(
                                    context,
                                    FadeRoute(
                                      page: RegisterPage(),
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          child: GestureDetector(
                            child: Text(
                              "Lupa Password ?",
                              style: TextStyle(
                                  color: Theme.of(context).backgroundColor),
                            ),
                            onTap: () {},
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
