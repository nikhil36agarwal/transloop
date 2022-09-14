import 'package:transloop/splashscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'transloop',
        theme: ThemeData(
          primaryColor: Colors.black,
        ),
        home: SplashScreen(),
        debugShowCheckedModeBanner: false);
  }
}
