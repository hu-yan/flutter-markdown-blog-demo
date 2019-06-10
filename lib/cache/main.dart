import 'package:flutter_app/cache/Constant/Constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/cache/Screens/HomeScreen.dart';
import 'package:flutter_app/cache/Screens/SplashScreen.dart';

main() {
  runApp(new MaterialApp(
    title: 'FluterBottemNavigationView',
    debugShowCheckedModeBanner: false,
    theme: new ThemeData(
         accentColor: Colors.black,
         indicatorColor: Colors.grey,
         highlightColor: Colors.grey,
         bottomAppBarColor: Colors.black,
         primaryColor: Color(0xFFffffff),
         primaryColorDark: Color(0xffffff)),
    home: new SplashScreen(),
    routes: <String, WidgetBuilder>{
      HOME_SCREEN: (BuildContext context) => new HomeScreen(),
      ANIMATED_SPLASH: (BuildContext context) => new SplashScreen(),

    },
  ));
}
