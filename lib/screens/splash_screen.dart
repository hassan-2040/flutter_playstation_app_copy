import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:playstationappcopy/helpers/size_config.dart';
import 'package:playstationappcopy/screens/home_screen.dart';
import 'package:playstationappcopy/widgets/loading_widget.dart';

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
    await Future.delayed(Duration(
      seconds: 3,
    ));
    Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context); //configuring size based on device screen
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Stack(
        children: <Widget>[
          Align(
            alignment: Alignment.center,
            child: Icon(
              FontAwesomeIcons.playstation,
              color: Colors.white,
              size: 100,
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: SizeConfig.smallDevice ? 50 : 200,
            child: LoadingWidget(
              color: Colors.white,
              sizeReference: 20,
              borderWidth: 2,
            ),
          ),
        ],
      ),
    );
  }
}
