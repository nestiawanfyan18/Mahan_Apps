import 'package:delit_app/animation/fadeRoute.dart';
import 'package:delit_app/component/loading_bottom.dart';
import 'package:delit_app/component/logo.dart';
import 'package:delit_app/component/titlecontent.dart';
import 'package:delit_app/page/login_page.dart';
import 'package:delit_app/page/register_page.dart';
import 'package:delit_app/page/startQuestion.dart';
import 'package:delit_app/providers/auth_provider.dart';
// ignore: unused_import
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:delit_app/theme.dart';
import 'package:provider/provider.dart';

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

  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleSignUp() async {
      setState(() {
        isLoading = true;
      });

      if (await authProvider.signIn(
        email: emailController.text,
        password: passwordController.text,
      )) {
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: dangerColor,
            content: Text(
              'Gagal Login',
              textAlign: TextAlign.center,
              style: primaryTextStyle.copyWith(
                color: thridTextColor,
                fontSize: 14,
                fontWeight: semibold,
              ),
            ),
          ),
        );
      }

      setState(() {
        isLoading = false;
      });
    }

    // form email
    Widget formEmail() {
      return Container(
        child: TextFormField(
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          decoration: InputDecoration(
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black38, width: 2.0),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: primaryColor,
              ),
            ),
            labelStyle: TextStyle(color: primaryColor),
            fillColor: primaryColor,
            labelText: 'Email',
            icon: Icon(
              Icons.email,
              color: primaryColor,
            ),
          ),
        ),
      );
    }

    Widget formPassword() {
      return Container(
        child: TextFormField(
          controller: passwordController,
          obscureText: !showPassword,
          decoration: InputDecoration(
            border: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.black38, width: 2.0),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: primaryColor,
              ),
            ),
            labelStyle: TextStyle(color: primaryColor),
            fillColor: primaryColor,
            labelText: 'password',
            icon: Icon(
              Icons.security,
              color: primaryColor,
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
      );
    }

    // button Daftar
    Widget btnDaftar() {
      return Container(
        width: size.width * 10,
        margin: EdgeInsets.only(
          top: 25,
        ),
        // ignore: deprecated_member_use
        child: RaisedButton(
          onPressed: handleSignUp,
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
      );
    }

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
                    margin: EdgeInsets.only(bottom: size.height * 0.08),
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
                        formEmail(),

                        // password
                        formPassword(),

                        // selection Old
                        // selectOld(),

                        // button daftar
                        isLoading ? LoadingButton() : btnDaftar(),
                      ],
                    ),
                  ),

                  // footer
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.1),
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
