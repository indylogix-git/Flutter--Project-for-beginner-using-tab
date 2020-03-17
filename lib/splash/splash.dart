import 'dart:async';

import 'package:firstapp/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    CallMethod();
  }

  // ignore: non_constant_identifier_names
  void CallMethod() {
    Timer(
        Duration(seconds: 3),
            () => Navigator.of(context).pushReplacement(MaterialPageRoute(
//            builder: (BuildContext context) => MyHomePage()
            builder: (BuildContext context) => Login())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Center(
        child: Text(
          'Sample App',
          style: TextStyle(
            fontSize: 25,
            fontStyle: FontStyle.italic,
            color: Colors.amber,
            fontWeight: FontWeight.bold,
          ),
        ),
//        child: Image.asset('asse/**/ts/splash.png'),
      ),
    );
  }

}