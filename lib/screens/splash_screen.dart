import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:playstationappcopy/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {


  @override
  void initState() {
    _jumpScreen();
    super.initState();
  }

  void _jumpScreen() async {
    await Future.delayed(Duration(seconds: 3,));
    Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Icon(
          FontAwesomeIcons.playstation,
          color: Colors.white,
          size: 100,
        ),
      ),
    );
  }
}
