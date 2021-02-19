//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:tokopedia/page/home_page.dart';
import 'package:tokopedia/page/login_page.dart';
import 'package:tokopedia/theme/theme.dart';

import '../main.dart';

class splashPage extends StatefulWidget {
  splashPage({Key key}) : super(key: key);

  @override
  _splashPageState createState() => _splashPageState();
}

class _splashPageState extends State<splashPage> {
  @override
  void initState() {
    var d = Duration(seconds: 3);
    Future.delayed(d, () {
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) {
            return AuthenticationWrapper();
          },
        ),
        (route) => false,
      );
    });

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: blueColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/white icon.png'),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 100,
          ),
          Container(
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                width: 375,
                height: 34,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/Home Indicator.png')),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
