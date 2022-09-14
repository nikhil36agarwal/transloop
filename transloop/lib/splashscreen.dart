import 'dart:ui';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:transloop/home.dart';
import 'package:transloop/globals/variables.dart';
import 'package:flare_flutter/flare_actor.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 5),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => Home())));
  }

  @override
  Widget build(BuildContext context) {
    Size size = globalKeys(context);
    return Scaffold(
      backgroundColor: Color.fromRGBO(30, 0, 35, 1),
      body: Center(
        child: Container(
          width: size.width * 0.8,
          height: size.height * 0.8,
          child: FlareActor(
            "assets/animations/splashscreen.flr",
            animation: 'Untitled',
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
