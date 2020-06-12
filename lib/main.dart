import 'package:flutter/material.dart';
import 'package:playstationappcopy/screens/home_screen.dart';
import 'package:playstationappcopy/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static Color colorPrimary = Color(0xff003087);
  static ThemeData appTheme = ThemeData(
//    backgroundColor: colorBackground,
    primaryColor: colorPrimary,
    visualDensity: VisualDensity.adaptivePlatformDensity,
//    primaryColorDark: colorPrimaryDark,
//    primaryColorLight: colorPrimaryLight,
//    accentColor: colorAccent,
//    highlightColor: colorPrimaryDark,
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PlayStationAppCopy',
      theme: appTheme,
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
      routes: {
        HomeScreen.routeName: (ctx) => HomeScreen(),
      },
    );
  }
}