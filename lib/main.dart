import 'package:acununparasiniharca/pages/homePage.dart';
import 'package:flare_splash_screen/flare_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home:SplashScreen.navigate(
        name: 'assets/splash.flr',
        fit: BoxFit.fill,
        next: (_) => HomePage(),
        until: () => Future.delayed(Duration(seconds: 4)),
        startAnimation: 'Untitled',
      ),
    );
  }
}

